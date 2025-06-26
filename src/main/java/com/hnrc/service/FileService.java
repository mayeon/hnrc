package com.hnrc.service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.*;
import com.amazonaws.services.s3.transfer.TransferManager;

import com.hnrc.domain.SiteFile;
import com.hnrc.repository.SiteFileMapper;
import com.hnrc.util.SystemUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

@Service
public class FileService {
    @Inject
    private AmazonS3 amazonS3;

    @Inject
    private SiteFileMapper siteFileMapper;
    @Inject
    private SystemUtil systemUtil;
    @Inject
    private TransferManager transferManager;
    @Value("${s3.alternative}")
    private boolean s3Alternative;
    @Value("${s3.alternative.url}")
    private String s3AlternativeUrl;
    @Value("${aws.s3.bucket}")
    private String bucket;
    @Value("${super.env}")
    private String env;


    public SiteFile processSiteFile(MultipartFile file, String type) throws IOException {
        String randomString = UUID.randomUUID().toString();
        String key = String.format("site/semi/%s", randomString);
        fileUploadToS3(file, bucket, key);

        SiteFile siteFile = new SiteFile();
        siteFile.setName(file.getOriginalFilename());
        siteFile.setPath(key);
        siteFile.setType(type);
        siteFileMapper.insert(siteFile);
        return siteFile;
    }



    public String fileUploadToS3(MultipartFile file, String s3BucketName, String key) throws IOException {
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentType(file.getContentType());
        metadata.setContentLength(file.getSize());

        PutObjectRequest putObjectRequest = new PutObjectRequest(s3BucketName, key, file.getInputStream(), metadata);
        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
        amazonS3.putObject(putObjectRequest);

        return key;
    }

    public String fileUploadToS3(File file, String s3BucketName, String key) {
        PutObjectRequest putObjectRequest = new PutObjectRequest(s3BucketName, key, file);
        putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
        amazonS3.putObject(putObjectRequest);
        return key;
    }

    public void deleteS3File(String s3BucketName, String key) {
        if(!env.equalsIgnoreCase("dev")) {
            amazonS3.deleteObject(s3BucketName, key);
        }
    }

    public boolean isImageType(String filename) {
        if(filename == null) return false;
        String imgCode = getExtension(filename);
        return imgCode.equalsIgnoreCase("png") || imgCode.equalsIgnoreCase("jpg") || imgCode.equalsIgnoreCase("gif") || imgCode.equalsIgnoreCase("jpeg");
    }


    public String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1).toLowerCase();
        } else {
            return "";
        }
    }

    public String getFileNameWithoutExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
            return fileName.substring(0, dotPosition).toLowerCase();
        } else {
            return "";
        }
    }

    public String extractAsString(File file) throws IOException {
        FileInputStream inputStream = new FileInputStream(file);
        try {
            return IOUtils.toString(inputStream);
        } finally {
            inputStream.close();
        }
    }

    public String getTempPath(HttpServletRequest request) {
        return request.getSession().getServletContext().getRealPath("/") + "temp";
    }

    public String getResourcePath(HttpServletRequest request) {
        String resourcePath = request.getSession().getServletContext().getRealPath("/") + "/WEB-INF/resources";
        resourcePath = resourcePath.replaceAll("//", "/");
        return resourcePath;
    }

    public File convert(MultipartFile file, HttpServletRequest request) throws IOException {
        String tempPath = getTempPath(request);
        File originDir = new File(tempPath);
        if (!originDir.exists())
            originDir.mkdirs();


        String filename  = getFileNameWithoutExtension(file.getOriginalFilename());
        String ext = getExtension(file.getOriginalFilename());
        File tempFile = new File(tempPath + File.separator + filename + "." + ext);
        FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(tempFile));
        return tempFile;
    }

    public File saveStringToFile(String str, String originalName, HttpServletRequest request) throws IOException {
        String tempPath = getTempPath(request);

        File originDir = new File(tempPath);
        if (!originDir.exists())
            originDir.mkdirs();

        File tempFile = new File(tempPath + File.separator + originalName);
        FileUtils.writeStringToFile(tempFile, str);
        return tempFile;

    }

    public void saveManagementFile(String str, String originalName, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String tempPath = getTempPath(request);

        File originDir = new File(tempPath);
        if (!originDir.exists())
            originDir.mkdirs();

        File tempFile = new File(tempPath + File.separator + originalName);
        FileUtils.writeStringToFile(tempFile, str);

//        String key = "management/mail/mail.html";
//        fileUploadToS3(tempFile, bucket, key);
//        downloadFromS3(request, response, key, "mail.html");

        File f = new File(tempPath+"/mail.html");
        response.setContentType("application/download");
        response.setContentLength((int)f.length());
        response.setHeader("Content-disposition", "attachment;filename=\"" + "mail.html" + "\"");
        // response 객체를 통해서 서버로부터 파일 다운로드
        OutputStream os = response.getOutputStream();
        // 파일 입력 객체 생성
        FileInputStream fis = new FileInputStream(f);
        FileCopyUtils.copy(fis, os);
        fis.close();
        os.close();
//        System.out.println("저장성공 service");

    }


    public ResponseEntity<byte[]> downloadResponseEntityAlternative(String key) {
        try {
            key = key.replaceAll("\\+", " ");
            String fileUrl = URLDecoder.decode(s3AlternativeUrl + "/" + key, StandardCharsets.UTF_8.name());
            URL url = new URL(fileUrl);
            HttpURLConnection httpCon = (HttpURLConnection) url.openConnection();
            httpCon.addRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20100101 Firefox/25.0");
            httpCon.setRequestProperty("Cache-Control", "no-cache");
            httpCon.setReadTimeout(10000);
            httpCon.setConnectTimeout(10000);
            InputStream in = new BufferedInputStream( httpCon.getInputStream());

            byte[] bytes = com.amazonaws.util.IOUtils.toByteArray(in);

            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            httpHeaders.setContentLength(bytes.length);
            httpHeaders.setContentDispositionFormData("attachment", key);

            in.close();
            return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
        } catch(Exception e) {
            return downloadResponseEntityFromS3(key);
        }
    }

    public void downloadFromS3(HttpServletRequest request, HttpServletResponse response, String key, String originalFileName) {
        try {
            S3Object s3Object = amazonS3.getObject(bucket, key);
            S3ObjectInputStream objectContent = s3Object.getObjectContent();
            ObjectMetadata metadata = s3Object.getObjectMetadata();
            systemUtil.setFileResponseHeader(request, response, originalFileName, (int) metadata.getContentLength(), metadata.getContentType());
            try {
                OutputStream out = response.getOutputStream();
                FileCopyUtils.copy(objectContent, out);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (objectContent != null) {
                    objectContent.close();
                }
            }
        } catch(AmazonServiceException | IOException e) {
            e.printStackTrace();
        }
    }

    public void downloadFromS3ToClientResponse(String key, String originalFileName, HttpServletResponse response) {
        try {
            S3Object s3Object = amazonS3.getObject(bucket, key);
            S3ObjectInputStream objectContent = s3Object.getObjectContent();

            // 응답 헤더 설정
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\"");

            // S3 객체의 내용을 클라이언트에 직접 스트림으로 전송
            IOUtils.copy(objectContent, response.getOutputStream());
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public ResponseEntity<byte[]> downloadResponseEntityFromS3(String key) {
        key = key.replaceAll("\\+", " ");
        GetObjectRequest getObjectRequest = new GetObjectRequest(bucket, key);
        try {
            S3Object s3Object = transferManager.getAmazonS3Client().getObject(getObjectRequest);
            S3ObjectInputStream objectInputStream = s3Object.getObjectContent();

            byte[] bytes = com.amazonaws.util.IOUtils.toByteArray(objectInputStream);

            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            httpHeaders.setContentLength(bytes.length);
            httpHeaders.setContentDispositionFormData("attachment", key);
            return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
        } catch(Exception e) {
            System.out.println("key = " + key);
            e.printStackTrace();
            return null;
        }

    }

    public void downloadAlternative(HttpServletRequest request, HttpServletResponse response, String key, String originalFileName) {
        try {
            String fileUrl = URLDecoder.decode(s3AlternativeUrl + "/" + key, StandardCharsets.UTF_8.name());
            if(originalFileName == null)
                originalFileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);

            if(SystemUtil.isKorean(fileUrl)) {
                String[] fileUrlSplit = fileUrl.split("/");
                String fileName = fileUrlSplit[fileUrlSplit.length - 1];
                String fileNameEncoded = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

                fileUrlSplit[fileUrlSplit.length - 1] = fileNameEncoded;

                fileUrl = String.join("/", fileUrlSplit);
            }
            
            URL url = new URL(fileUrl);
            HttpURLConnection httpCon = (HttpURLConnection) url.openConnection();
            httpCon.addRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20100101 Firefox/25.0");
            httpCon.setRequestProperty("Cache-Control", "no-cache");
            httpCon.setReadTimeout(10000);
            httpCon.setConnectTimeout(10000);
            InputStream in = new BufferedInputStream( httpCon.getInputStream());
            ServletOutputStream out = response.getOutputStream();

            response.setHeader( "Content-Transfer-Encoding", "binary");
            response.setContentType( "application/x-download");
            systemUtil.setFileResponseHeader(request, response, originalFileName);

            IOUtils.copy( in, out );

            out.flush();
            out.close();
            in.close();
        } catch (Exception e) {
            downloadFromS3(request, response, key, originalFileName);
        }

    }

    public String getFileStorageUrl() {
        return s3Alternative? s3AlternativeUrl : "https://journal-home.s3.ap-northeast-2.amazonaws.com";
    }
//   청정기술 맥미니...
    public String getCleantechStorageUrl() {
        return s3Alternative? s3AlternativeUrl : "https://cleantechnol.s3.ap-northeast-2.amazonaws.com";
    }
    public boolean isKoreanIp(HttpServletRequest request) {
        try {
            String ipList = getResourcePath(request) + "/iplist_ko.xml";
            File initialFile = new File(ipList);
            String xml = extractAsString(initialFile);
            Document originalDoc = Jsoup.parse(xml);
            String ip = request.getRemoteAddr();
            List<Element> elements = originalDoc.select("ipv4");
            System.out.println("ip = " + ip);
            if(ip.equals("0:0:0:0:0:0:0:1") || ip.equals("127.0.0.1"))
                return true;
            boolean isInRange = false;
            for (Element element : elements) {
                String ipStart = element.select("sno").first().text();
                String ipEnd = element.select("eno").first().text();
                if (isInRange(ip, ipStart, ipEnd)) {
                    isInRange = true;
                    break;
                }
            }
            return isInRange;

        } catch(Exception e) {
            return false;
        }
    }

    private boolean isInRange(String ip, String ipStart, String ipEnd) {
        try {
            String[] ipSplit = ip.split(Pattern.quote("."));
            String[] ipSplitStart = ipStart.split(Pattern.quote("."));
            String[] ipSplitEnd = ipEnd.split(Pattern.quote("."));
            if(ipSplit.length != 4) return false;
            int ipMatchingCount = 0;
            for(int i=0; i<ipSplit.length; i++) {
                int number = Integer.parseInt(ipSplit[i]);
                int numberStart = Integer.parseInt(ipSplitStart[i]);
                int numberEnd = Integer.parseInt(ipSplitEnd[i]);
                if(number >= numberStart && number <= numberEnd)
                    ipMatchingCount++;
            }
            if(ipMatchingCount == 4) return true;
        } catch(Exception e) {
            return false;
        }
        return false;
    }


}
