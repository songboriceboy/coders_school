<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="uk-hidden-small" id="top-header">
    <div class="uk-container uk-container-center">
        <nav class="uk-navbar">
            <a class="uk-navbar-brand" href="http://www.mooban.cn/" title="魔工坊">
                <img src="http://www.mooban.cn/skin/moob/img/logo.png" alt="魔工坊" width="60" height="60">
            </a>
            <ul class="uk-navbar-nav">
                <li><a href="http://www.mooban.cn/">首页</a></li>
                <li class="uk-parent" data-uk-dropdown>
                    <a href="http://www.mooban.cn/down/">模板</a>
                    <div class="uk-dropdown uk-dropdown-width-2 uk-dropdown-navbar" style="width: 200px;">
                        <div class="uk-grid uk-dropdown-grid">
                            <div class="uk-width-1-2">
                                <ul class="uk-nav uk-nav-dropdown uk-panel">
                                    <li class="uk-nav-header">网站</li>
                                    <li><a href="http://www.mooban.cn/down/dt-c5-1.html" target="_blank">Destoon</a></li>
                                    <li><a href="http://www.mooban.cn/down/wp-c48-1.html" target="_blank">WordPress</a></li>
                                    <li><a href="http://www.mooban.cn/down/dede-c31-1.html" target="_blank">DeDeCMS</a></li>
                                    <li><a href="http://www.mooban.cn/down/ec-c7-1.html" target="_blank">ECShop</a></li>
                                    <li><a href="http://www.mooban.cn/down/dz-c56-1.html" target="_blank">Discuz</a></li>
                                    <li><a href="http://www.mooban.cn/down/static-c143-1.html" target="_blank">HTML</a></li>
                                    <li><a href="http://www.mooban.cn/down/qita-c225-1.html" target="_blank">其他模板</a></li>
                                </ul>
                            </div>
                            <div class="uk-width-1-2">
                                <ul class="uk-nav uk-nav-dropdown uk-panel">
                                    <li class="uk-nav-header">APP</li>
                                    <li><a href="http://www.mooban.cn/down/app-c6-1.html" target="_blank">AppCan</a></li>
                                    <li><a href="http://www.mooban.cn/down/ecm-c33-1.html" target="_blank">ECMobile</a></li>
                                    <li><a href="http://www.mooban.cn/down/ect-c66-1.html" target="_blank">ECTouch</a></li>
                                    <li><a href="http://www.mooban.cn/down/pg-c65-1.html" target="_blank">PhoneGap</a></li>
                                    <li><a href="http://www.mooban.cn/down/web-c64-1.html" target="_blank">WebAPP</a></li>
                                    <li><a href="http://www.mooban.cn/down/api-c32-1.html" target="_blank">APICloud</a></li>
                                    <li><a href="http://www.mooban.cn/down/React-c227-1.html" target="_blank">React</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/original/">原创</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/source/">源码</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/plugin/">插件</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/material/">素材</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://school.mooban.cn/">教程</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/know/">问答</a>

                </li>
                <li class="uk-parent uk-hidden-medium uk-active" data-uk-dropdown="">
                    <a href="http://st.mooban.cn/?fr=mooban" target="_blank">更多</a>

                </li>
            </ul>
            <div id="destoon_member" class="uk-navbar-content uk-navbar-flip top-head-avatar">
                <div class="uk-button-group"><a class="uk-button uk-button-primary uk-margin-right"
                                                href="http://www.mooban.cn/member/register.php">免费注册</a><a
                        class="uk-button uk-button-primary"
                        href="http://www.mooban.cn/member/login.php">立即登录</a></div>
            </div>

        </nav>
    </div>
</header>
<div class="uk-container uk-visible-small touch-nav">
    <nav class="uk-navbar">
        <div class="uk-grid">
            <div class="uk-width-4-6">
                <div class="uk-navbar-brand uk-float-left">
                    <a class="w1" href="http://www.mooban.cn/down/"> <i class="uk-icon-home"></i> 会员 - 魔工坊</a>
                </div>
            </div>
            <div class="uk-width-2-6">
                <nav class="uk-nav">
                    <a href="#offcanvas" class="uk-navbar-toggle uk-float-right w1" data-uk-offcanvas=""></a>
                </nav>
            </div>
        </div>
    </nav>
</div>
<div id="offcanvas" class="uk-offcanvas">
    <div class="uk-offcanvas-bar">
        <ul class="uk-nav uk-nav-offcanvas">
            <li class="uk-active"><a href="http://www.mooban.cn/"><i class="uk-icon-home"></i> 首页</a></li>
            <li><a href="http://www.mooban.cn/down/"><i class="uk-icon-folder-o"></i> 模板</a></li>
            <li><a href="http://www.mooban.cn/original/"><i class="uk-icon-folder-o"></i> 原创</a></li>
            <li><a href="http://www.mooban.cn/source/"><i class="uk-icon-folder-o"></i> 源码</a></li>
            <li><a href="http://www.mooban.cn/plugin/"><i class="uk-icon-folder-o"></i> 插件</a></li>
            <li><a href="http://www.mooban.cn/material/"><i class="uk-icon-folder-o"></i> 素材</a></li>
            <li><a href="http://school.mooban.cn/"><i class="uk-icon-folder-o"></i> 教程</a></li>
            <li><a href="http://www.mooban.cn/know/"><i class="uk-icon-folder-o"></i> 问答</a></li>
        </ul>
    </div>
</div>
