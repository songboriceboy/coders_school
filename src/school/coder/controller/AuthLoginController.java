package school.coder.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.util.CommonUtil;
import school.coder.vo.GithubAuthResJson;


/**
 * Created by Administrator on 2018/2/22.
 */
@Controller
@RequestMapping("/auth")
public class AuthLoginController {

    static String client_id = "dee9dd47e28f78701ccb";
    static String client_secret = "114e8083327a80e2006614b6e4eba46fb23005a3";
    @RequestMapping("/github")
    public ModelAndView github(String code)
    {
        System.out.println(code);

        String me = CommonUtil.sendPost
                ("https://github.com/login/oauth/access_token?client_id="+client_id+"&client_secret="+client_secret+"&code="+code+"&redirect_uri=http://127.0.0.1:8080/cqput-bbs/User/RegisteredByGithub.do",null);

        String atoke = me.split("&")[0];

        String res = CommonUtil.sendGet("https://api.github.com/user?"+atoke+"");
        GithubAuthResJson githubAuthResJson = JSON.parseObject(res, new TypeReference<GithubAuthResJson>() {});
//        JSONObject user = (JSONObject) JSON.parse(res);
        System.out.println(githubAuthResJson.getLogin());
//        return CommonUtil.constructResponse(1,"user_Person_Notice",user);
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");

        return maView;
    }
}
