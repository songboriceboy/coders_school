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



        .avatar{
            width: 45px;
            height: 45px;
        }
        .author-avatar
        {
            float:left;
        }
        .topic
        {
            padding-bottom: 10px;
            border-bottom: 2px solid #ccc;
            line-height: 22px;
        }
        .topic .content
        {
            margin-left: 60px;
        }
    </style>
    <script>
        $(function () {
            $('.uk-tab').on('change.uk.tab',function (event, item) {
                alert(item.text());
            })
        })
    </script>
</head>
<body>

<%@include file="../common/header.jsp"%>
<!--整体背景-->
<div class="mb-cover">
    <div class="b20"></div>
    <!--固定宽度，居中对齐-->
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">
                <div id="mb_member_left">
                    <div class="uk-panel uk-panel-box uk-text-center">
                        <div class="uk-grid user-info">
                            <div class="uk-width-medium-1-5">
                                <a href="#">
                                    <img src="https://user-gold-cdn.xitu.io/2018/2/22/161bc4cd96f02929?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1">
                                </a>
                            </div>
                            <div class="uk-width-medium-3-5">
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
                            <div class="uk-width-medium-1-5">
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
                                <li class="uk-active"><a href="#">话题</a></li>
                                <li><a href="#">文章</a></li>
                                <li><a href="#">动态</a></li>
                                <li><a href="#">文章</a></li>
                                <li><a href="#">话题</a></li>
                                <li><a href="#">文章</a></li>
                                <li><a href="#">话题</a></li>
                                <li><a href="#">关注</a></li>
                            </ul>

                            <div id="list-body" class="list-body">
                                <ul class="bookshelf">


                                    <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
                                        <a href="#" class="author-avatar"><img class="avatar" src="/avatar/0d69d4a5-752a-4343-88ff-f138cc91e78b3.jpg"></a>
                                        <div class="content">
                                            <div class="uk-grid">
                                                <div class="uk-width-5-6">
                                                    <a href="/topic/show/1">电风扇的说法</a>
                                                    <a href="/topic/modify/1">修改</a>
                                                </div>
                                                <div class="uk-width-1-6 uk-vertical-align uk-text-center">

                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">
                  11
                </span>

                                                </div>
                                            </div>

                                            <div>
                                                <span class="node"><a href="javascript:;" section_id="3">程序员</a></span>
                                                <span class="split">•</span>
                                                <span class="author"><a href="/user/show/1">aaa</a></span>
                                                <span class="split">•</span>
                                                <span class="datetime">1519027428000</span>
                                            </div>

                                        </div>
                                    </li>


                                    <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
                                        <a href="#" class="author-avatar"><img class="avatar" src="/avatar/0d69d4a5-752a-4343-88ff-f138cc91e78b3.jpg"></a>
                                        <div class="content">
                                            <div class="uk-grid">
                                                <div class="uk-width-5-6">
                                                    <a href="/topic/show/2">很反感</a>
                                                    <a href="/topic/modify/2">修改</a>
                                                </div>
                                                <div class="uk-width-1-6 uk-vertical-align uk-text-center">

                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">
                  8
                </span>

                                                </div>
                                            </div>

                                            <div>
                                                <span class="node"><a href="javascript:;" section_id="3">程序员</a></span>
                                                <span class="split">•</span>
                                                <span class="author"><a href="/user/show/1">aaa</a></span>
                                                <span class="split">•</span>
                                                <span class="datetime">1519027673000</span>
                                            </div>

                                        </div>
                                    </li>


                                    <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
                                        <a href="#" class="author-avatar"><img class="avatar" src="/avatar/0d69d4a5-752a-4343-88ff-f138cc91e78b3.jpg"></a>
                                        <div class="content">
                                            <div class="uk-grid">
                                                <div class="uk-width-5-6">
                                                    <a href="/topic/show/3">范德萨</a>
                                                    <a href="/topic/modify/3">修改</a>
                                                </div>
                                                <div class="uk-width-1-6 uk-vertical-align uk-text-center">

                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">
                  11
                </span>

                                                </div>
                                            </div>

                                            <div>
                                                <span class="node"><a href="javascript:;" section_id="8">javascript</a></span>
                                                <span class="split">•</span>
                                                <span class="author"><a href="/user/show/1">aaa</a></span>
                                                <span class="split">•</span>
                                                <span class="datetime">1519028060000</span>
                                            </div>

                                        </div>
                                    </li>


                                    <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
                                        <a href="#" class="author-avatar"><img class="avatar" src="/avatar/0d69d4a5-752a-4343-88ff-f138cc91e78b3.jpg"></a>
                                        <div class="content">
                                            <div class="uk-grid">
                                                <div class="uk-width-5-6">
                                                    <a href="/topic/show/4">科技好好干科技好好干科技好好干科技好好干科技好好干科技好好干科技好好干科技好好干</a>
                                                    <a href="/topic/modify/4">修改</a>
                                                </div>
                                                <div class="uk-width-1-6 uk-vertical-align uk-text-center">

                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">
                  5
                </span>

                                                </div>
                                            </div>

                                            <div>
                                                <span class="node"><a href="javascript:;" section_id="3">程序员</a></span>
                                                <span class="split">•</span>
                                                <span class="author"><a href="/user/show/1">aaa</a></span>
                                                <span class="split">•</span>
                                                <span class="datetime">1519206032000</span>
                                            </div>

                                        </div>
                                    </li>


                                    <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
                                        <a href="#" class="author-avatar"><img class="avatar" src="/avatar/0d69d4a5-752a-4343-88ff-f138cc91e78b3.jpg"></a>
                                        <div class="content">
                                            <div class="uk-grid">
                                                <div class="uk-width-5-6">
                                                    <a href="/topic/show/5">ds都是</a>
                                                    <a href="/topic/modify/5">修改</a>
                                                </div>
                                                <div class="uk-width-1-6 uk-vertical-align uk-text-center">

                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">
                  9
                </span>

                                                </div>
                                            </div>

                                            <div>
                                                <span class="node"><a href="javascript:;" section_id="8">javascript</a></span>
                                                <span class="split">•</span>
                                                <span class="author"><a href="/user/show/1">aaa</a></span>
                                                <span class="split">•</span>
                                                <span class="datetime">1519037977000</span>
                                            </div>

                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="uk-width-medium-1-4" id="mb_list_right">
                <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                    <div class="uk-grid">
                        <div class="uk-width-1-2 uk-text-center uk-text-large">
                            <a href="/user/59693b86518825490d1dd04f/following">
                                <div data-v-4cdfa676="" class="item-title uk-text-muted">关注了</div>
                                <div data-v-4cdfa676="" class="item-count uk-text-muted">8</div>
                            </a>
                        </div>
                        <div class="uk-width-1-2 uk-text-center uk-text-large">
                            <a href="/user/59693b86518825490d1dd04f/followers">
                                <div data-v-4cdfa676="" class="item-title uk-text-muted">关注者</div>
                                <div data-v-4cdfa676="" class="item-count uk-text-muted">0</div>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="b20"></div>
                <!--页脚部分-->

            </div>
        </div>
    </div>
</div>
</body>
</html>