package school.coder.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.TopicInfo;
import school.coder.service.TopicService;
import school.coder.service.UserService;
import school.coder.util.imgUploadBackData;
import school.coder.util.picEncode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2018/2/19.
 */
@Controller
@RequestMapping("/topic")
public class TopicController {
    @Autowired
    private TopicService topicService;
    @RequestMapping("/new")
    public ModelAndView newTopic()
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/topic/new");
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
//            articleService.updateTrueArticles(topicInfo);
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
