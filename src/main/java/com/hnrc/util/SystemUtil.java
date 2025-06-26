package com.hnrc.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.cache.Cache;
import com.hnrc.domain.RecaptchaResult;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.security.web.authentication.logout.CookieClearingLogoutHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.authentication.rememberme.AbstractRememberMeServices;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.regex.Pattern;

@Component
public class SystemUtil {
    @Inject
    private SqlSessionFactory sqlSessionFactory;

    // DO NOT REMOVE : In use at velocity
    public String trim(String str) {
        return str.trim() /*.replace("\n", "").replace("\r", "")*/;
    }

    public String capitalize(String string) {
        if (StringUtils.isBlank(string))
            return "";
        String[] wordArray = string.split(" "); // Split string to analyze word by word.
        int i = 0;

        lowercase: for (String word : wordArray) {
            if (!word.equals(wordArray[0])) { // First word always in capital
                String[] lowercaseWords = { "a", "an", "as", "and", "although", "at", "because", "but", "by", "for", "in", "nor", "of", "on", "or", "so", "the", "to", "up", "yet" };
                for (String word2 : lowercaseWords) {
                    if (word.equals(word2)) {
                        wordArray[i] = word;
                        i++;
                        continue lowercase;
                    }
                }
            }
            char[] characterArray = word.toCharArray();
            characterArray[0] = Character.toTitleCase(characterArray[0]);
            if (characterArray[characterArray.length - 1] == '.') {
                characterArray = Arrays.copyOfRange(characterArray, 0, characterArray.length - 1);
            }
            wordArray[i] = new String(characterArray);
            i++;
        }
        return StringUtils.join(wordArray, " "); // Re-join string
    }

    public boolean validateRecaptcha(String recaptchaResponse) {
        String recaptchaUri = "https://www.google.com/recaptcha/api/siteverify";

        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("secret", "6LcCTV0qAAAAALi2y970raDbcyKcYskjj5pKfotn");
        params.add("response", recaptchaResponse);

        RestTemplate restTemplate = new RestTemplate();
        RecaptchaResult result = restTemplate.postForObject(recaptchaUri, params, RecaptchaResult.class);

        if (result.getSuccess()) {
            return true;
        } else {
            return false;
        }
    }


    public String removeBlank(String s) {
        if (s != null) {
            s = s.trim();
            s = s.replaceAll("  ", " ");
            s = s.replaceAll("   ", " ");
            s = s.replaceAll("    ", " ");
        }
        return s;
    }

    public String removeQuotes(String s) {
        if (s != null) {
            s = s.trim();
            s = s.replaceAll("\"", "''");
        }
        return s;
    }

    public int getDiff(Calendar prevEventCalendar, Calendar nextEventCalendar) {
        int prevDayOfYear = prevEventCalendar.get(Calendar.DAY_OF_YEAR);
        int nextDayOfYear = nextEventCalendar.get(Calendar.DAY_OF_YEAR);
        if (nextEventCalendar.get(Calendar.YEAR) > prevEventCalendar.get(Calendar.YEAR))
            nextDayOfYear += 365;
        else if(prevEventCalendar.get(Calendar.YEAR) > nextEventCalendar.get(Calendar.YEAR))
        	prevDayOfYear += 365;
        return nextDayOfYear - prevDayOfYear;
    }

    public String cloneString(String original) {
        StringReader reader = new StringReader(original);
        StringWriter writer = new StringWriter();
        int ch;
        try {
            while ((ch = reader.read()) != -1) {
                writer.write(ch);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return writer.toString();
    }

    public static boolean isEnglish(String str) {
        String checkString = str.replaceAll(" ", "");
        try {
            if (!Pattern.matches("[a-zA-Z]*", checkString))
                return false;
        } catch (Exception e) {
            return false;
        }
        return true;

    }

    public static boolean isKorean(String str) {
        return Pattern.matches("^[ㄱ-ㅎ가-힣]*$", str);
    }

    public static boolean isKorEngNumber(String str) {
        return Pattern.matches("^[ㄱ-ㅎ가-힣0-9a-zA-Z]*$", str);
    }

    public static boolean isEmail(String str) {
        return Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", str);
    }

    public static String replaceSpecialCharacter(String str) {
        if(str == null) return null;
        String match = "[^ㄱ-ㅎ가-힣0-9a-zA-Z\\@\\.\\(\\)]";
        //한글, 숫자, 영문, 이메일, 괄호 허용
        return str.replaceAll(match, "");
    }

    public <K, V extends Comparable<? super V>> Map<K, V> sortByValueDesc(Map<K, V> map) {
        List<Map.Entry<K, V>> list = new LinkedList<>(map.entrySet());
        Collections.sort(list, (o1, o2) -> -1 * o1.getValue().compareTo(o2.getValue()));

        Map<K, V> result = new LinkedHashMap<>();
        for (Map.Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }
        return result;
    }
    
    public String generateRandomQuery() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    public String replace(String source, String os, String ns) {
        if (source == null) {
            return null;
        }
        int i = 0;
        if ((i = source.indexOf(os, i)) >= 0) {
            char[] sourceArray = source.toCharArray();
            char[] nsArray = ns.toCharArray();
            int oLength = os.length();
            StringBuilder buf = new StringBuilder (sourceArray.length);
            buf.append (sourceArray, 0, i).append(nsArray);
            i += oLength;
            int j = i;
            // Replace all remaining instances of oldString with newString.
            while ((i = source.indexOf(os, i)) > 0) {
                buf.append (sourceArray, j, i - j).append(nsArray);
                i += oLength;
                j = i;
            }
            buf.append (sourceArray, j, sourceArray.length - j);
            source = buf.toString();
            buf.setLength (0);
        }
        return source;
    }

    public String toLowerCase(String word) {
        return word.toLowerCase();
    }

    public void logoff(HttpServletRequest request, HttpServletResponse response) {
        CookieClearingLogoutHandler cookieClearingLogoutHandler = new CookieClearingLogoutHandler(AbstractRememberMeServices.SPRING_SECURITY_REMEMBER_ME_COOKIE_KEY);
        SecurityContextLogoutHandler securityContextLogoutHandler = new SecurityContextLogoutHandler();
        cookieClearingLogoutHandler.logout(request, response, null);
        securityContextLogoutHandler.logout(request, response, null);
    }

    public void clearCache() {
        sqlSessionFactory.getConfiguration().getCaches().forEach(Cache::clear);

    }

    public static Locale convertLangToLocale(String lang) {
        if(lang == null)
            return new Locale("en");
        switch(lang) {
            case "ko":
            case "ko_KR":
                return new Locale("ko");
            default:
                return new Locale("en");
        }
    }

    public String toJson(Object src) {
        if(src == null) return "";
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(src);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }

    public void setFileResponseHeader(HttpServletRequest request, HttpServletResponse response, String fileName, int contentLength, String contentType) {
        response.setContentLength(contentLength);
        response.setHeader("Content-type", contentType);
        response.setHeader("Content-Transfer-Encoding", "binary");
        setFileResponseHeader(request, response, fileName);
    }

    public void setFileResponseHeader(HttpServletRequest request, HttpServletResponse response, String fileName) {
        response.setHeader("Content-Transfer-Encoding", "binary");
        String userAgent = request.getHeader("User-Agent");
        try {

            if (userAgent == null || userAgent.contains("Chrome") || userAgent.contains("Firefox")) {
                response.setHeader( "Content-Disposition", "attachment;filename=\"" + new String( fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1) + "\";" );
            } else if (userAgent.contains("MSIE 5.5")) { // MS IE 5.5 이하
                String decodeName = URLDecoder.decode( fileName, "UTF-8" );
                String encodeName = URLEncoder.encode( decodeName, "UTF-8" );
                response.setHeader( "Content-Disposition", "filename=" + encodeName.replaceAll( "\\+", "\\ " ) + ";" );
            } else if (userAgent.contains("MSIE") || userAgent.contains( "Trident" )) {
                String decodeName = URLDecoder.decode( fileName, "UTF-8" );
                String encodeName = URLEncoder.encode( decodeName, "UTF-8" );
                response.setHeader( "Content-Disposition", "attachment; filename=" + encodeName.replaceAll( "\\+", "\\ " ) + ";" );
            } else {
                response.setHeader( "Content-Disposition", "attachment; filename=" + new String( fileName.getBytes( "euc-kr" ), "latin1" ).replaceAll( "\\+", "\\ " ) + ";" );
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public static boolean setObjectFieldValue(Object object, String fieldName, Object fieldValue) {
        Class<?> clazz = object.getClass();
        while (clazz != null) {
            try {
                Field field = clazz.getDeclaredField(fieldName);
                field.setAccessible(true);
                if(field.getType().isAssignableFrom(String.class) )
                    field.set(object, fieldValue);
                else if(field.getType().isAssignableFrom(Integer.TYPE) )
                    field.set(object, Integer.parseInt((String)fieldValue));
                else if(field.getType().isAssignableFrom(Double.TYPE) )
                    field.set(object, Double.parseDouble((String)fieldValue));
                else if(field.getType().isAssignableFrom(Boolean.TYPE) )
                    field.set(object, Boolean.parseBoolean((String)fieldValue));
                return true;
            } catch (NoSuchFieldException e) {
                clazz = clazz.getSuperclass();
            } catch (Exception e) {
                throw new IllegalStateException(e);
            }
        }
        return false;
    }


    public static String removeHtml(String str) {
        if(str == null) return null;
        return str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
    }

    public String convertNewLineToBr(String str) {
        if (str != null && str.length() != 0) {
            return str.replaceAll("(\r\n|\n\r|\r|\n)", "<br/>");
        } else {
            return "";
        }
    }

    public Locale getLocaleByLang(String lang) {
        switch (lang) {
            case "ko":
                return Locale.KOREAN;
            case "en":
                return Locale.ENGLISH;
            default:
                return Locale.ENGLISH;
        }
    }
}