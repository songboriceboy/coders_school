<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="uk-height-1-1">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>
    <style>
        html, h1, h2, h3, h4, h5, h6 {
            font-family: 'Microsoft YaHei',"Helvetica Neue",Helvetica,Arial,sans-serif!important;
        }
        .touch-nav {
            line-height: 40px;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            z-index: 999999;
            background: #00a8e6 !important;
        }
        a.w1:link, a.w1:visited, a.w1:active, a.w1:hover {
            color: #fff;
            text-decoration: none;
        }

        .uk-navbar
        {
            background: 0;
            border: 0;
            text-shadow: none;
        }

        #top-header {
            background: #fff;
            height: 88px;
            border-bottom: 2px solid green;
            width: 100%

        }

        #top-header .uk-navbar-brand, #top-header .uk-navbar-content{
            height: 88px;
        }

        #top-header .uk-navbar-nav > li > a {
            height: 88px;
            line-height: 88px;
            font-family: "Microsoft Yahei";
            font-size: 16px;
            padding: 0 11px;
        }
        .mb-cover{
            background: #f2f2f2;
        }
        .b20{
            height: 20px;
        }
        .b35{
            height: 35px;
        }
        .uk-panel-box {
            background: #fff !important
        }
        a.b:link, a.b:visited, a.b:active {
            color: #444;
            text-decoration: none
        }

        a.b:hover {
            color: #00a8e6
        }

    </style>
</head>
<body class="uk-height-1-1">

<%@include file="common/header.jsp"%>

<div class="mb-cover uk-height-1-1">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">

        <div class="uk-panel uk-panel-box">
            <div class="uk-grid uk-grid-divider" data-uk-grid-margin="">
                <div class="uk-width-medium-1-2">
                    <div class="uk-grid">
                        <div class="uk-width-1-5"></div>
                        <div class="uk-width-3-5">
                            <div class="uk-panel">
                                <div class="b35"></div>
                                <h1>
                                    <a href="http://www.mooban.cn/member/register.php" class="b list_cat"><i
                                            class="uk-icon-user mb-a"></i> 用户注册</a>
                                </h1>
                                <iframe src="" name="send" id="send" style="display:none;"></iframe>
                                <form class="uk-form jqtransformdone" action="register.php" method="post"
                                      target="send" onsubmit="return check();">
                                    <input name="action" type="hidden" id="action"
                                           value="92f3b602c33e9d4acb42c319bb47ef63">
                                    <input name="forward" type="hidden" value="http://www.mooban.cn/know/">
                                    <input name="post[truename]" type="hidden" value="魔芋">
                                    <input name="post[gender]" type="hidden" value="1">
                                    <input name="post[areaid]" type="hidden" value="1">
                                    <input name="post[regid]" type="hidden" value="5">
                                    <div class="uk-form-row">
                                        <div class="uk-form-icon">
                                            <i class="uk-icon-user" id="dusername"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" maxlength="20"
                                                   onkeyup="value=value.replace(/[^a-z0-9_\-]/g,'')"
                                                   title="4-20个字符，只能使用小写字母(a-z)、数字(0-9)、下划线(_)、中划线(-)，且以字母或数字开头和结尾"
                                                   class="uk-form-width-large uk-form-large"
                                                   name="post[username]" id="username"
                                                   onblur="validator('username');" type="text"
                                                   autocomplete="off" placeholder="请输入账号">
                                        </div>
                                    </div>

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-lock" id="dpassword"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" maxlength="20"
                                                   title="" class="uk-form-width-large uk-form-large"
                                                   name="post[password]" id="password"
                                                   onblur="validator('password');" type="password"
                                                   autocomplete="off" value="" placeholder="请输入密码"
                                                   data-cached-title="6-20个字符，区分大小写，推荐使用数字、字母和特殊符号组合">

                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-unlock-alt" id="dcpassword"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" maxlength="20"
                                                   title="" class="uk-form-width-large uk-form-large"
                                                   name="post[cpassword]" id="cpassword"
                                                   onblur="validate('cpassword');" type="password"
                                                   autocomplete="off" value="" placeholder="请确认密码"
                                                   data-cached-title="必须和上面输入的密码一样">

                                        </div>
                                    </div>


                                    <div class="uk-form-row">
                                        <button type="submit" name="submit"
                                                class="uk-button uk-button-primary border_radius3 uk-button-large uk-width-1-1"
                                                id="registerBtn">立 即 注 册
                                        </button>
                                    </div>
                                    <div class="b35"></div>
                                </form>
                            </div>
                        </div>
                        <div class="uk-width-1-5"></div>
                    </div>
                </div>
                <div class="uk-width-medium-1-2">
                    <div class="uk-grid">
                        <div class="uk-width-1-6"></div>
                        <div class="uk-width-4-6">
                            <div class="uk-panel">
                                <div class="b35"></div>
                                <h1 class="uk-text-center">
                                    <a href="javascript:Go('login.php?forward=http%3A%2F%2Fwww.mooban.cn%2Fknow%2F');"
                                       class="b">我已注册账号</a>
                                </h1>
                                <button class="uk-button uk-button-large uk-button-success uk-width-1-1"
                                        onclick="Go('http://www.mooban.cn/member/login.php')">立 即 登 录
                                </button>
                                <div class="b20"></div>
                                <div class="uk-form-row">
                                    <h3 class="uk-margin-bottom-remove"><span
                                            class="uk-text-muted">快捷登录:&nbsp;</span>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-qq"
                                           href="http://www.mooban.cn/api/oauth/qq/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="QQ登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-weibo"
                                           href="http://www.mooban.cn/api/oauth/sina/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="微博登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-paw"
                                           href="http://www.mooban.cn/api/oauth/baidu/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="百度登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-envelope-square"
                                           href="http://www.mooban.cn/api/oauth/netease/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="网易邮箱">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-windows"
                                           href="http://www.mooban.cn/api/oauth/msn/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="微软登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-github"
                                           href="http://www.mooban.cn/api/oauth/github/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="Github">
                                        </a>
                                    </h3>
                                </div>
                                <div class="uk-form-row uk-text-center">
                                    <a href="javascript:Go('login.php?forward=http%3A%2F%2Fwww.mooban.cn%2Fknow%2F');"><img
                                            src="http://www.mooban.cn/skin/moob/img/register-reg-4.png" alt=""></a>
                                </div>
                            </div>
                        </div>
                        <div class="uk-width-1-6"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
