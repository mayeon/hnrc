package com.hnrc.controller;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.*;
import com.hnrc.domain.SiteArticle;
import com.hnrc.domain.SiteBoard;
import com.hnrc.domain.SiteFile;
import com.hnrc.domain.User;
import com.hnrc.repository.UserMapper;
import com.hnrc.repository.SiteBoardMapper;
import com.hnrc.util.SystemUtil;
import com.hnrc.repository.SiteFileMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

@Controller
@RequestMapping("/*")
public class HomeController {
    @Inject
    private AmazonS3 amazonS3;
    @Inject
    UserMapper userMapper;
    @Inject
    private SiteBoardMapper siteBoardMapper;

    @Inject
    private SystemUtil systemUtil;
    @Inject
    private SiteFileMapper siteFileMapper;

    @Value("${aws.s3.bucket}")
    private String bucket;

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "Hello, Spring MVC with Maven!");

        SiteBoard siteBoard = siteBoardMapper.findByPageName("notice");
        System.out.println(siteBoard.getId());
        List<SiteArticle> siteArticle = siteBoardMapper.findLatestArticleByBoardIdLimit(siteBoard.getId(), 5);
        model.addAttribute("article", siteArticle);

        return "hnrc/index"; // home.jsp를 반환
    }

    @RequestMapping("/{jspName}")
    public String common(Model model, @PathVariable String jspName) {

        return String.format("hnrc/%s", jspName);

    }

    @RequestMapping("/login")
    public String siteMlLogin( HttpServletRequest request, HttpSession session, @RequestParam(required=false) String from, @RequestParam(required=false) String msg, Model model) {
        model.addAttribute("from", from);
        model.addAttribute("msg", msg);
        String referer = request.getHeader("referer");

        model.addAttribute("referer", referer);

        return "hnrc/login";
    }
    @ResponseBody
    @RequestMapping(value = "/upload-ck5-image", method = RequestMethod.POST)
    public String uploadCk5Image(@RequestParam String s, HttpServletRequest request) throws IllegalStateException, IOException {

        if (request instanceof MultipartHttpServletRequest) {
            MultipartFile file = ((MultipartHttpServletRequest) request).getFile("upload");
            SiteFile siteFile = processSiteFile(file, "ckimage");
            int fileId = siteFile.getId();


            return "{\"url\":\"" + "/file/download/" + fileId +"\"}";
        } else
            return null;
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
    @Transactional(readOnly = true)
    @RequestMapping(value = "/file/download/{fn}", method = RequestMethod.GET)
    public void downloadSoConfFile(@PathVariable("fn") int fn, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        SiteFile uf = siteFileMapper.findOne(fn);
        if (uf != null) {
            S3Object s3Object = amazonS3.getObject(bucket, uf.getPath());
            S3ObjectInputStream objectContent = s3Object.getObjectContent();
            ObjectMetadata metadata = s3Object.getObjectMetadata();
            systemUtil.setFileResponseHeader(request, response, uf.getName(), (int) metadata.getContentLength(), metadata.getContentType());
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
        }
    }

    public SiteFile processSiteFile(MultipartFile file, String type) throws IOException {
        String randomString = UUID.randomUUID().toString();
        String key = String.format("site/hnrc/file/%s", randomString);
        fileUploadToS3(file, bucket, key);
        SiteFile siteFile = new SiteFile();
        siteFile.setName(file.getOriginalFilename());
        siteFile.setPath(key);
        siteFile.setType(type);
        siteFileMapper.insert(siteFile);
        return siteFile;
    }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String siteMlLoginPost(HttpServletRequest request, HttpSession session,
                                  @RequestParam("username") String username,
                                  @RequestParam("password") String password,
                                  @RequestParam(value = "fromUrl", required = false) String fromUrl) {

        User user = userMapper.findByUsernamePassword(username.trim(),password);

        if(user != null){
            session.setAttribute("user1", user.getUsername());
            System.out.println(session.getAttribute("user1"));
        } else {
            return "redirect:/login?msg=error";
        }

        if(fromUrl == null || fromUrl.equals("") || fromUrl.contains("login")){
            return "redirect:/";
        }
        return "redirect:"+fromUrl;
    }

}