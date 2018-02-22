<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/22
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
<body>

<%@include file="../common/header.jsp"%>
<!--整体背景-->
<div class="mb-cover">
    <div class="b20"></div>
    <!--固定宽度，居中对齐-->
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4 uk-hidden-small">
                <div id="mb_member_left">
                    <div class="uk-panel uk-panel-box">
                        <div class="uk-grid user-info">
                            <div class="uk-width-1-5">
                                <a href="#">
                                    <img src="https://user-gold-cdn.xitu.io/2018/2/22/161bc4cd96f02929?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1">
                                </a>
                            </div>
                            <div class="uk-width-3-5">
                                <h2>__豆约翰__</h2>
                                <div>
                                    <span>teacher</span>
                                    <span>|</span>
                                    <span>neu</span>
                                </div>
                                <div class="uk-margin">
                                    闲看庭前花开花落 漫随天外云卷云舒
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div>
                                    编辑个人资料
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="uk-panel uk-panel-box uk-margin">
                        <div data-v-815abe10="" data-v-4cdfa676="" class="detail-list detail-list sticky-box"
                             data-v-3f216172="">
                            <ul class="uk-tab" data-uk-tab="">
                                <li class="uk-active"><a href="#">动态</a></li>
                                <li><a href="#">文章</a></li>
                                <li><a href="#">话题</a></li>
                                <li class="uk-disabled"><a href="#">关注</a></li>
                                <li class="uk-tab-responsive uk-active uk-hidden" aria-haspopup="true"
                                    aria-expanded="false"><a>Active</a>
                                    <div class="uk-dropdown uk-dropdown-small">
                                        <ul class="uk-nav uk-nav-dropdown"></ul>
                                        <div></div>
                                    </div>
                                </li>
                            </ul>
                            <div data-v-815abe10="" class="list-body">
                                <div data-v-7921c096="" data-v-815abe10="" st:block="activityList"
                                     class="activity-list-box">
                                    <ul data-v-7921c096="" class="activity-list">
                                        <li data-v-7921c096="" class="item">
                                            <div data-v-7921c096="" class="activity"><a data-v-7921c096=""
                                                                                        href="/user/5821e3d8bf22ec0068e631e2"
                                                                                        target="_blank" rel=""
                                                                                        class="link">
                                                <div data-v-7921c096="" class="meta-box">
                                                    <div data-v-7921c096="" class="action">关注了用户</div>
                                                    <div data-v-7921c096="" class="date">2小时前</div>
                                                </div>
                                                <div data-v-7921c096="" class="content user">
                                                    <div data-v-b2db8566="" data-v-1b9df826="" data-v-7921c096=""
                                                         data-src="https://dn-mhke0kuv.qbox.me/6s1bRksynJg45dV2remrqkyAd83yysx2K6TnP4vc?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1"
                                                         class="lazy avatar avatar loaded" title=""
                                                         style="background-image: url(&quot;https://dn-mhke0kuv.qbox.me/6s1bRksynJg45dV2remrqkyAd83yysx2K6TnP4vc?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1&quot;);"></div>
                                                    <div data-v-7921c096="" class="info-box">
                                                        <div data-v-7921c096="" class="username">少木木</div>
                                                        <div data-v-7921c096="" class="detail">前端小爬爬~ @ 山东科技大学</div>
                                                    </div>
                                                </div>
                                            </a></div><!----><!----></li>
                                        <li data-v-7921c096="" class="item">
                                            <div data-v-7921c096="" class="activity"><a data-v-7921c096=""
                                                                                        href="/user/56e62d3ac4c9710051378d97"
                                                                                        target="_blank" rel=""
                                                                                        class="link">
                                                <div data-v-7921c096="" class="meta-box">
                                                    <div data-v-7921c096="" class="action">关注了用户</div>
                                                    <div data-v-7921c096="" class="date">1月前</div>
                                                </div>
                                                <div data-v-7921c096="" class="content user">
                                                    <div data-v-b2db8566="" data-v-1b9df826="" data-v-7921c096=""
                                                         data-src="https://dn-mhke0kuv.qbox.me/7825953e230f3a8979f0.jpg?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1"
                                                         class="lazy avatar avatar loaded" title=""
                                                         style="background-image: url(&quot;https://dn-mhke0kuv.qbox.me/7825953e230f3a8979f0.jpg?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1&quot;);"></div>
                                                    <div data-v-7921c096="" class="info-box">
                                                        <div data-v-7921c096="" class="username">Alihanniba</div>
                                                        <div data-v-7921c096="" class="detail">研发 @ 某滴</div>
                                                    </div>
                                                </div>
                                            </a></div><!----><!----></li>

                                    </ul>
                                </div><!----></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="uk-width-medium-1-4" id="mb_list_right">
                <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                    <div data-v-4cdfa676="" data-v-3f216172="" class="follow-block block shadow"><a data-v-4cdfa676=""
                                                                                                    href="/user/59693b86518825490d1dd04f/following"
                                                                                                    class="follow-item"
                                                                                                    data-v-3f216172="">
                        <div data-v-4cdfa676="" class="item-title">关注了</div>
                        <div data-v-4cdfa676="" class="item-count">8</div>
                    </a><a data-v-4cdfa676="" href="/user/59693b86518825490d1dd04f/followers" class="follow-item"
                           data-v-3f216172="">
                        <div data-v-4cdfa676="" class="item-title">关注者</div>
                        <div data-v-4cdfa676="" class="item-count">0</div>
                    </a></div>

                </div>

                <div class="b20"></div>
                <!--页脚部分-->

            </div>
        </div>
    </div>
</div>
</body>
</html>