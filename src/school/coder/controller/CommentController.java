package school.coder.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicInfo;
import school.coder.domain.UserInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Administrator on 2018/2/20.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @RequestMapping("/add_comment")
    public void SaveArticle(HttpServletRequest request, HttpServletResponse response,TopicCommentInfo topicCommentInfo) throws IOException {

        String strMarkdown = request.getParameter("test-editormd-html-code");
        topicCommentInfo.setComment_content(strMarkdown);
        topicCommentInfo.setComment_createtime(new Date());
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        topicCommentInfo.setUser_id(userInfo.getUser_id());
        System.out.println(topicCommentInfo);
        //代表是新增

//        response.setContentType("application/json;charset=utf-8");
//        String strJson = JSON.toJSONString(topicInfo);
//        response.getWriter().println(strJson);
    }

}
