package com.hnrc.controller;


import com.amazonaws.services.s3.AmazonS3;

import com.hnrc.domain.*;
import com.hnrc.repository.CommentMapper;
import com.hnrc.util.SystemUtil;
import com.hnrc.repository.UserMapper;
import com.hnrc.repository.SiteBoardFileMapper;
import com.hnrc.repository.SiteBoardMapper;
import com.hnrc.service.FileService;


import com.hnrc.util.RequestUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping("/board")
public class SiteBoardController {
    @Inject
    private AmazonS3 amazonS3;

    @Inject
    private SiteBoardMapper siteBoardMapper;

    @Inject
    private CommentMapper commentMapper;

    @Inject
    private SiteBoardFileMapper siteBoardFileMapper;
    @Inject
    private FileService fileService;

    @Inject
    private SystemUtil systemUtil;

    @Inject
    private UserMapper userMapper;

    @Value("${aws.s3.bucket}")
    private String bucket;




    @RequestMapping("/{boardName}")
    public String board(@PathVariable String boardName, Model model, HttpServletRequest request,
                        @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false) String msg, HttpSession session) throws IOException {
        RequestUtil.checkAndSleep(request);

        String user1 = (String) session.getAttribute("user1");

        SiteBoard siteBoard = siteBoardMapper.findByPageName(boardName);

        model.addAttribute("msg", msg);
        if (siteBoard == null) {
            return String.format("redirect:/");
        }
        if(boardName.equals("ga")){
            int articleNum = siteBoardMapper.countArticleByBoardId(siteBoard.getId());
            int max_page = 0;
            if(articleNum % 9 == 0){
                max_page = articleNum/9;
            }
            else{
                max_page = (articleNum/9) + 1;
            }
            model.addAttribute("currentPage", page);
            model.addAttribute("max_page", max_page);

            List<SiteArticle> articles = siteBoardMapper.findArticleByBoardId(siteBoard.getId());
            for(int i=0; i<articles.size();i++){
                articles.get(i).setImgPath(siteBoardFileMapper.findImageByArticleId(articles.get(i).getId()));
            }
            model.addAttribute("board",siteBoard);
            model.addAttribute("article",articles);

            return String.format("hnrc/galleryList");

        }



        List<SiteArticle> siteArticle = siteBoardMapper.findLatestArticleOrderByFixedAndRegAll(siteBoard.getId());

        model.addAttribute("board", siteBoard);
        model.addAttribute("user", user1);
        model.addAttribute("article", siteArticle);
        return String.format("hnrc/board");
    }

    @RequestMapping("/date/calendar")
    public String calendar(Model model, HttpServletRequest request,
                     Locale locale, HttpSession session) throws IOException {
        RequestUtil.checkAndSleep(request);
        String user1 = (String) session.getAttribute("user1");
        SiteBoard siteBoard = siteBoardMapper.findByPageName("date");


        List<SiteArticle> articles = siteBoardMapper.findArticleByBoardId(siteBoard.getId());


        model.addAttribute("user", user1);
        model.addAttribute("board",siteBoard);
        model.addAttribute("article",articles);

        return String.format("hnrc/calendar");
    }



    @RequestMapping("/ga/galleryList")
    public String ga(Model model, HttpServletRequest request,
                     Locale locale,  @RequestParam(required = false, defaultValue = "1") int page, HttpSession session) throws IOException {
        RequestUtil.checkAndSleep(request);
        String user1 = (String) session.getAttribute("user1");
        SiteBoard siteBoard = siteBoardMapper.findByPageName("ga");

        int boardListLength = siteBoardMapper.findArticleByBoardIdLength(siteBoard.getId());

        int boardCountPerPage = 9; //페이지당 보여줄 게시물의 개수

        int paginationTotalCount = (int) Math.ceil((double) boardListLength / boardCountPerPage);
        int paginationPerCount = 10; //한 화면에 보여질 페이지 개수

        int pageGroup = (int) Math.ceil((double) page / paginationPerCount);

        List<SiteArticle> articles = siteBoardMapper.findArticleByBoardIdLimit10(siteBoard.getId(), (page-1)*9);

        int startPage = ((pageGroup - 1) * paginationPerCount) + 1;
        int endPage = (pageGroup * paginationPerCount);
        if(endPage > paginationTotalCount) {
            endPage = paginationTotalCount;
        }

        int preNumber = 1;
        int afterNumber = 1;

        if(paginationTotalCount >= 11 && page > 10) {
            preNumber = page - 10;
        }

        if(page + 10 < paginationTotalCount) {
            afterNumber = page + 10;
        } else {
            afterNumber = paginationTotalCount;
        }

        for(int i=0; i<articles.size();i++){
            articles.get(i).setImgPath(siteBoardFileMapper.findImageByArticleId(articles.get(i).getId()));
        }
        model.addAttribute("user", user1);
        model.addAttribute("board",siteBoard);
        model.addAttribute("article",articles);
        model.addAttribute("preNumber", preNumber);
        model.addAttribute("afterNumber", afterNumber);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("page", page);
        model.addAttribute("paginationTotalCount", paginationTotalCount);
        model.addAttribute("boardListLength", boardListLength);

        return String.format("hnrc/galleryList");
    }


    @RequestMapping("/ga/article/{articleId}")
    public String gaArticle(HttpServletRequest request, @PathVariable int articleId, HttpSession session, Model model){
        RequestUtil.checkAndSleep(request);
        String user1 = (String) session.getAttribute("user1");
        SiteArticle siteArticle = siteBoardMapper.findArticleByArticleId(articleId);
        if(siteArticle == null){
            return "redirect:/board/ga/galleryList";
        }
        siteArticle.setBoardFiles(siteBoardFileMapper.findByArticleId(articleId));
        String boardNameEng = siteBoardMapper.findBoardNameOByArticle(siteArticle.getBoardId());
        String boardNameKor = siteBoardMapper.findBoardNameByArticle(siteArticle.getBoardId());
        siteBoardMapper.updateArticleHits(articleId,siteArticle.getHits()+1);
        model.addAttribute("imgLength", siteArticle.getBoardFiles().size());
        model.addAttribute("boardId", siteArticle.getBoardId());
        model.addAttribute("article", siteArticle);
        model.addAttribute("boardName",boardNameEng);
        model.addAttribute("boardNameKor",boardNameKor);
        model.addAttribute("user", user1);

        return String.format("hnrc/galleryArticle");
    }


    @RequestMapping("/article/{articleId}")
    public String article(HttpServletRequest request, @PathVariable int articleId, Model model, HttpSession session){
        RequestUtil.checkAndSleep(request);

        SiteArticle siteArticle = siteBoardMapper.findArticleByArticleId(articleId);
        if(siteArticle == null){
            return "redirect:/board";
        }
        String user1 = (String) session.getAttribute("user1");


        List<Comment> commentList = commentMapper.findByArticleId(articleId);
        model.addAttribute("commentList", commentList);
        Comment command = new Comment();

        model.addAttribute("command", command);

        siteArticle.setBoardFiles(siteBoardFileMapper.findByArticleId(articleId));
        String boardName = siteBoardMapper.findBoardNameOByArticle(siteArticle.getBoardId());
        SiteBoard siteBoard = siteBoardMapper.findByBoardId(siteArticle.getBoardId());
        siteBoardMapper.updateArticleHits(articleId,siteArticle.getHits()+1);
        model.addAttribute("boardId", siteArticle.getBoardId());
        model.addAttribute("article", siteArticle);
        model.addAttribute("user", user1);
        model.addAttribute("board", siteBoard);
        model.addAttribute("boardName",boardName);

        return String.format("hnrc/article");
    }

    @ResponseBody
    @RequestMapping(value = "postComment/{articleId}", method = RequestMethod.POST)
    public String postComment(@PathVariable int articleId, @ModelAttribute("command") Comment command) throws IOException {

        command.setArticleId(articleId);
        commentMapper.insert(command);

        return "true";
    }

    @Transactional
    @RequestMapping(value = "/deleteComment/{commentId}", method = RequestMethod.POST)
    @ResponseBody
    public String deleteComment(@PathVariable int commentId) {
        Comment comment = commentMapper.findOne(commentId);;
        commentMapper.delete(comment);
        return "true";
    }

    @RequestMapping(value="/article/{articleId}", method = RequestMethod.POST)
    public String articlePost( @PathVariable String articleId, @ModelAttribute("article") SiteArticle siteArticle, HttpServletRequest request, SessionStatus status) throws IOException {
        request.setCharacterEncoding("utf-8");
        status.setComplete();
        return String.format("redirect:/article/%s", articleId);
    }

    @RequestMapping(value = "/form/{boardId}",method = RequestMethod.GET)
    public String form(@PathVariable int boardId, Model model, HttpServletResponse response, Locale locale,HttpSession session) throws IOException {

        String boardName = siteBoardMapper.findBoardNameOByArticle(boardId);
        String boardNameKor = siteBoardMapper.findBoardNameByArticle(boardId);
        SiteArticle siteArticle = new SiteArticle();
        User user = User.current();

        String userString = (String) session.getAttribute("user1");
        if(!boardName.equals("qna") && userString == null){
            return "redirect:/login";
        }
        if(boardName.equals("ga")) {
            model.addAttribute("boardName", boardName);
            model.addAttribute("article", siteArticle);
            model.addAttribute("boardNameKor", boardNameKor);
            model.addAttribute("mode", "create");

            return String.format("hnrc/galleryForm");
        }

        SiteBoard siteBoard = siteBoardMapper.findByBoardId(siteArticle.getBoardId());
        model.addAttribute("board", siteBoard);
        model.addAttribute("boardName", boardName);
        model.addAttribute("boardNameKor", boardNameKor);
        model.addAttribute("article", siteArticle);
        model.addAttribute("mode", "create");
        return String.format("hnrc/form");
    }

    public void uploadBoardFile(SiteArticle article, int articleId) throws IOException {
        List<MultipartFile> files = article.getFiles();
        if(CollectionUtils.isNotEmpty(files)) {
            for (MultipartFile file : files) {
                if (file.getBytes().length == 0) {
                    continue;
                }
                String key = "site/hnrc/board/" + UUID.randomUUID();
                fileService.fileUploadToS3(file, bucket, key);
                SiteBoardFile boardFile = new SiteBoardFile();
                boardFile.setArticleId(articleId);
                boardFile.setName(file.getOriginalFilename());
                boardFile.setPath(key);

                siteBoardMapper.updateFile(1,articleId);
                siteBoardFileMapper.insert(boardFile);
            }
        }

    }

    @RequestMapping(value = "/form/{boardId}",method = RequestMethod.POST)
    public String formPost(@PathVariable int boardId, @ModelAttribute("article") SiteArticle siteArticle,
                           @RequestParam(required=false, name="g-recaptcha-response") String recaptchaResponse,
                           HttpServletRequest request) throws IOException {

        String boardName = siteBoardMapper.findBoardNameOByArticle(boardId);

        if(boardName.equals("qna") && StringUtils.isBlank(recaptchaResponse)){
            return String.format("redirect:/board/%s?msg=no", boardName);
        }

        if(boardName.equals("ga")){
            siteArticle.setBoardId(boardId);
            siteBoardMapper.insert(siteArticle);
            uploadBoardFile(siteArticle,siteArticle.getId());
            List<SiteArticle> articles = siteBoardMapper.findAllArticleByBoardId(boardId);
            for(int i=0; i<articles.size();i++){
                articles.get(i).setImgPath(siteBoardFileMapper.findImageByArticleId(articles.get(i).getId()));
            }
            return String.format("redirect:/board/ga/galleryList");
        }


        boolean success = systemUtil.validateRecaptcha(recaptchaResponse);

        if(boardName.equals("qna") && success) {
            siteArticle.setBoardId(boardId);
            siteBoardMapper.insert(siteArticle);
            uploadBoardFile(siteArticle, siteArticle.getId());
        }else{
            siteArticle.setBoardId(boardId);
            siteBoardMapper.insert(siteArticle);
            uploadBoardFile(siteArticle, siteArticle.getId());
        }

        if(boardName.equals("date")){
            return String.format("redirect:/board/date/calendar");
        }

        return String.format("redirect:/board/%s", boardName);
    }

    @RequestMapping(value = "/edit/{articleId}")
    public String editForm(Model model, @PathVariable int articleId, HttpSession session) {

        SiteArticle siteArticle = siteBoardMapper.findArticleByArticleId(articleId);

        String boardName = siteBoardMapper.findBoardNameOByArticle(siteArticle.getBoardId());
        String boardNameKor = siteBoardMapper.findBoardNameByArticle(siteArticle.getBoardId());

        String userString = (String) session.getAttribute("user1");
        if(userString == null){
            return "redirect:/login";
        }

        if(boardName.equals("ga")) {
            SiteArticle article = siteBoardMapper.findArticleByArticleId(articleId);

            List<SiteBoardFile> files = siteBoardFileMapper.findByArticleId(articleId);
            model.addAttribute("files",files);

            model.addAttribute("article", article);
            model.addAttribute("boardName",boardName);
            model.addAttribute("boardNameKor",boardNameKor);
            model.addAttribute("mode", "edit");
            return String.format("hnrc/galleryForm");
        }


        List<SiteBoardFile> files = siteBoardFileMapper.findByArticleId(articleId);
        SiteBoard siteBoard = siteBoardMapper.findByBoardId(siteArticle.getBoardId());
        model.addAttribute("board", siteBoard);
        model.addAttribute("files",files);
        model.addAttribute("article", siteArticle);
        model.addAttribute("boardName",boardName);
        model.addAttribute("mode", "edit");
        return String.format("hnrc/form");

    }

    @RequestMapping(value = "/edit/{articleId}", method = RequestMethod.POST)
    public String editFormPost(@PathVariable int articleId, @ModelAttribute("article") SiteArticle siteArticle, HttpServletRequest request, SessionStatus status) throws IOException {
        request.setCharacterEncoding("utf-8");


        SiteArticle siteArticle1 = siteBoardMapper.findArticleByArticleId(articleId);

        System.out.println(siteArticle1.getBoardId());
        System.out.println("fuck");
        String boardName = siteBoardMapper.findBoardNameOByArticle(siteArticle1.getBoardId());

        if(boardName != null) {
            if (boardName.equals("ga") || boardName.contains("gallery")) {
                List<SiteArticle> articles = siteBoardMapper.findAllArticleByBoardId(siteArticle.getBoardId());
                siteBoardMapper.update(siteArticle);
                uploadBoardFile(siteArticle,siteArticle.getId());
                for (int i = 0; i < articles.size(); i++) {
                    articles.get(i).setImgPath(siteBoardFileMapper.findImageByArticleId(articles.get(i).getId()));
                }
                return String.format("redirect:/board/ga/article/%s", articleId);
            }
        }

        siteBoardMapper.update(siteArticle);
        uploadBoardFile(siteArticle, siteArticle.getId());
        status.setComplete();

        if(boardName.equals("date")){
            return String.format("redirect:/board/date/calendar");
        }

        return String.format("redirect:/board/article/%s", articleId);
    }

    @RequestMapping(value = "/delete/{articleId}/{boardId}", method = RequestMethod.GET)
    public String deleteArticle(Model model, @PathVariable int articleId, @PathVariable int boardId, SessionStatus status) {

        String boardName = siteBoardMapper.findBoardNameOByArticle(boardId);

        if(boardName.equals("ga")) {

            siteBoardMapper.deleteById(articleId);
            siteBoardFileMapper.deleteByArticle(articleId);  // 파일 같이 삭제

            List<SiteArticle> articles = siteBoardMapper.findAllArticleByBoardId(boardId);
            for(int i=0; i<articles.size();i++){
                articles.get(i).setImgPath(siteBoardFileMapper.findImageByArticleId(articles.get(i).getId()));
            }

            model.addAttribute("boardName", boardName);
            model.addAttribute("article", articles);
            return String.format("redirect:/board/ga/galleryList");
        }

        siteBoardMapper.deleteById(articleId);
        status.setComplete();

        return String.format("redirect:/board/%s",boardName);
    }

    @RequestMapping(value ="/{articleId}/{fileId}", method = RequestMethod.DELETE)
    public void fileDelete(@PathVariable int articleId, @PathVariable int fileId, HttpServletResponse response) throws Exception {

        deleteFileById(fileId);
        siteBoardMapper.updateFile(0,articleId);
        response.setStatus(200);
    }

    public void deleteBoardFile(int deleteFileId) {
        SiteBoardFile boardFile = siteBoardFileMapper.findOne(deleteFileId);
        amazonS3.deleteObject(bucket, boardFile.getPath());
    }

    public void deleteFileById(int fileId) {
        SiteBoardFile boardFile = siteBoardFileMapper.findOne(fileId);
        deleteBoardFile(fileId);
        siteBoardFileMapper.delete(boardFile);
    }

    @Transactional
    @RequestMapping(value = "/{articleId}/{fileId}", method = RequestMethod.GET)
    public void downloadFile(@PathVariable int articleId, @PathVariable int fileId,  HttpServletRequest request, HttpServletResponse response, HttpSession session
    ) throws IOException {

        SiteBoardFile f = siteBoardFileMapper.findPathByArticleIdAndFileId(articleId, fileId);

        SiteArticle siteArticle = siteBoardMapper.findArticleByArticleId(articleId);
        SiteBoard siteBoard = siteBoardMapper.findByBoardId(siteArticle.getBoardId());


        if (f == null) {
            response.sendRedirect("/");
        } else {
            fileService.downloadAlternative(request, response, f.getPath(), f.getName());
        }
    }

}
