package school.coder.controller;


import com.alibaba.fastjson.JSON;
import org.omg.CORBA.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicCommentInfoEx;
import school.coder.domain.TopicInfo;
import school.coder.service.TopicCommentService;
import school.coder.service.TopicService;
import school.coder.util.imgUploadBackData;
import school.coder.util.picEncode;
import school.coder.vo.TopicCommentList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by Administrator on 2018/2/19.
 */
@Controller
@RequestMapping("/topic")
public class TopicController {
    @Autowired
    private TopicService topicService;
    @Autowired
    private TopicCommentService topicCommentService;
    @RequestMapping("/new")
    public ModelAndView newTopic()
    {

        ModelAndView maView = new ModelAndView();
        TopicInfo topicInfo = new TopicInfo();

//        topicInfo.setTopic_markdown_content("\n\n\n\n\n");
        maView.addObject("topic",topicInfo);
        maView.setViewName("front/topic/new");
//        maView.setViewName("front/topic/test_new");

        return maView;
    }
    @RequestMapping("/modify/{id}")
    public ModelAndView modifyTopic(@PathVariable int id)
    {
        TopicInfo topicInfo = topicService.getTopicByID(id);

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/topic/new");

        maView.addObject("topic",topicInfo);
        return maView;
    }
    @RequestMapping("/show/{id}")
    public ModelAndView showTopic(@PathVariable int id)
    {
        TopicInfo topicInfo = topicService.getTopicByID(id);
        List<TopicCommentInfoEx> list  = topicCommentService.getAllCommentsByTopicID(id);
        Map<Integer,TopicCommentList> mapComments = new HashMap<>();
        //获取嵌套评论列表
        for(TopicCommentInfoEx topicCommentInfoEx : list)
        {

            Integer tci_comment_id = topicCommentInfoEx.getTci_comment_id();
            if(tci_comment_id == 0)
            {
                TopicCommentList topicCommentList = new TopicCommentList();
                Integer comment_id = topicCommentInfoEx.getComment_id();
                String comment_content = topicCommentInfoEx.getComment_content();
                Date comment_createtime =topicCommentInfoEx.getComment_createtime();
                Integer user_id = topicCommentInfoEx.getUser_id();
                topicCommentList.setCurr_comment_id(comment_id);
                topicCommentList.setCurr_comment_content(comment_content);
                topicCommentList.setCurr_comment_createtime(comment_createtime);
                topicCommentList.setCurr_comment_user_id(user_id);
                List<TopicCommentInfo> childCommentList = new ArrayList<>();
                topicCommentList.setChildCommentList(childCommentList);
                mapComments.put(topicCommentInfoEx.getComment_id(),topicCommentList);
            }
            else
            {
                TopicCommentList topicCommentList = mapComments.get(tci_comment_id);
                List<TopicCommentInfo> childCommentList = topicCommentList.getChildCommentList();

                Integer comment_id = topicCommentInfoEx.getComment_id();
                String comment_content = topicCommentInfoEx.getComment_content();
                Date comment_createtime =topicCommentInfoEx.getComment_createtime();
                Integer user_id = topicCommentInfoEx.getUser_id();

                TopicCommentInfo topicCommentInfo = new TopicCommentInfo();
                topicCommentInfo.setComment_content(comment_content);
                topicCommentInfo.setComment_id(comment_id);
                topicCommentInfo.setComment_createtime(comment_createtime);
                topicCommentInfo.setUser_id(user_id);

                childCommentList.add(topicCommentInfo);
            }

        }

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/topic/show");
        maView.addObject("topic",topicInfo);
        maView.addObject("mapComments",mapComments);
        maView.addObject("txt","${txt}");
        maView.addObject("cid","${comment.comment_id}");
        maView.addObject("reply_comment_id","${reply_comment_id}");

        return maView;
    }
    @RequestMapping("/save_topic")
    public void SaveArticle(HttpServletRequest request, HttpServletResponse response, TopicInfo topicInfo) throws IOException {

        String strMarkdown = request.getParameter("test-editormd-html-code");
        topicInfo.setTopic_content(strMarkdown);
        topicInfo.setTopic_createtime(new Date());
        System.out.println(topicInfo);
        //代表是新增
        if(topicInfo.getTopic_id() == 0)
        {
            topicService.insertTopic(topicInfo);
        }
        else //代表是修改文章
        {
            topicService.updateTopic(topicInfo);
        }
        response.setContentType("application/json;charset=utf-8");
        String strJson = JSON.toJSONString(topicInfo);
        response.getWriter().println(strJson);
    }

    @RequestMapping("/uploadimg")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response, TopicInfo topicInfo) throws IOException {
        String strTemp = request.getParameter("base");
        System.out.println(strTemp);
        strTemp = strTemp.replace("data:image/png;base64,","");
        String strPath = request.getServletContext().getRealPath(File.separator+"upload");
        String strUUid = UUID.randomUUID().toString();
        System.out.println(strPath);

        File file = new File(strPath);

        if(!file.exists())
        {
            file.mkdir();
        }
        String strSavePath = strPath+File.separator+strUUid+".jpg";
        picEncode.generateImage(strTemp,strSavePath);
        imgUploadBackData iubd = new imgUploadBackData();
        iubd.setPath("upload"+File.separator+strUUid+".jpg");
        iubd.setCode(1);
        String strJson = JSON.toJSONString(iubd);
        response.getWriter().println(strJson);
    }

}
