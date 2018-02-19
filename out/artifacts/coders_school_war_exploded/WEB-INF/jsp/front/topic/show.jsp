<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 19:21
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
    <script src="${pageContext.request.contextPath}/assets/js/autosize.js"></script>
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
        .uk-comment-header{
            background: 0;
            border: 0;
            border-top:1px solid #ddd;
        }
    </style>
    <script>
        //动态生成的评论框提交
        function check_submit(form) {
            alert(form);
            var txt = $(form).find('textarea').val();
            alert(txt);
            var comment = `
                    <li class="reply-child-item">
                    <article class="uk-comment">
                        <header class="uk-comment-header">
                            <img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">
                            <h4 class="uk-comment-title">Author</h4>
                            <div class="uk-comment-meta">12 days ago | Profile | #</div>
                        </header>
                        <div class="uk-comment-body">
                           <p>${txt}</p>
                        </div>
                        <div class="x-comment-footer uk-margin-top">
                            <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                            <a href="#" class="uk-button">赞</a>
                        </div>
                    </article>
                    </li>
                `;
            var li = $(comment);
            $(form).closest('.reply-item').find('.ul-comment-list-child').append(li);
            return false;
        }
        $(document).ready(function () {
                    autosize(document.querySelector('textarea'));
                    //动态添加元素的事件绑定问题参考了http://blog.csdn.net/lixin2151408/article/details/71411564
                    //最后面的评论框提交
                    $('#final-reply').on('submit', 'form', function () {
                        alert('first')
                        var txt = $(this).find('textarea').val();
                        var comment = `
                    <li class="reply-item">
                    <article class="uk-comment">
                        <header class="uk-comment-header">
                            <img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">
                            <h4 class="uk-comment-title">Author</h4>
                            <div class="uk-comment-meta">12 days ago | Profile | #</div>
                        </header>
                        <div class="uk-comment-body">
                            <p>${txt}</p>
                        </div>
                        <div class="x-comment-footer uk-margin-top">
                            <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                            <a href="#" class="uk-button">赞</a>
                        </div>
                    </article>
                    <ul class="ul-comment-list-child">
                    </ul>
                    </li>
                `;
                        var li = $(comment);
                        $('#uk-comment-list').append(li);
                        return false;
                    })
                    $('#uk-comment-list').on('click', '.btn-reply', function () {
                        alert('kkkkkkkk');
                        var $div = $('#reply-anywhere');
                        alert($div.length);
                        if ($div.length > 0)
                        {
                            $('#reply-anywhere').remove();
                        }
                        var reply = `
                                   <div class="reply" id="reply-anywhere">
                            <form class="uk-form" action="#" method="post" onsubmit="return check_submit(this);">
                                <div class="uk-form-row">
                                    <textarea rows="1" placeholder="文明社会，理性评论" style="width:80%;min-height: 25px; max-height: 132px; overflow: hidden; word-wrap: break-word; height: 30px;"></textarea>
                                    <input type="submit" class="uk-button">
                                </div>
                            </form>
                        </div>`;
                        var replynode = $(reply);
                        $(this).closest('.reply-item').append(replynode);
                        return false;
                    })
                }
        );
    </script>
</head>
<body class="uk-height-1-1">
<%@include file="../common/header.jsp"%>

<div class="mb-cover uk-height-1-1">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">

        <div class="uk-panel uk-panel-box">
            <h2>${topic.topic_title}</h2>
            <div>
                ${topic.topic_content}
            </div>
            <ul class="uk-comment-list" id="uk-comment-list">
                <!--<li class="reply-item">-->
                <!--<article class="uk-comment">-->
                <!--<header class="uk-comment-header">-->
                <!--<img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">-->
                <!--<h4 class="uk-comment-title">Author</h4>-->
                <!--<div class="uk-comment-meta">12 days ago | Profile | #</div>-->
                <!--</header>-->
                <!--<div class="uk-comment-body">-->
                <!--<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>-->
                <!--</div>-->
                <!--<div class="x-comment-footer uk-margin-top">-->
                <!--<a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>-->
                <!--<a href="#" class="uk-button">赞</a>-->
                <!--</div>-->
                <!--</article>-->
                <!--<ul class="ul-comment-list-child">-->
                <!--&lt;!&ndash;<li class="reply-child-item">&ndash;&gt;-->
                <!--&lt;!&ndash;<article class="uk-comment">&ndash;&gt;-->
                <!--&lt;!&ndash;<header class="uk-comment-header">&ndash;&gt;-->
                <!--&lt;!&ndash;<img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">&ndash;&gt;-->
                <!--&lt;!&ndash;<h4 class="uk-comment-title">Author</h4>&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="uk-comment-meta">12 days ago | Profile | #</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</header>&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="uk-comment-body">&ndash;&gt;-->
                <!--&lt;!&ndash;<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="x-comment-footer uk-margin-top">&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#" class="uk-button">赞</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</article>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->
                <!--&lt;!&ndash;<li class="reply-child-item">&ndash;&gt;-->
                <!--&lt;!&ndash;<article class="uk-comment">&ndash;&gt;-->
                <!--&lt;!&ndash;<header class="uk-comment-header">&ndash;&gt;-->
                <!--&lt;!&ndash;<img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">&ndash;&gt;-->
                <!--&lt;!&ndash;<h4 class="uk-comment-title">Author</h4>&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="uk-comment-meta">12 days ago | Profile | #</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</header>&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="uk-comment-body">&ndash;&gt;-->
                <!--&lt;!&ndash;<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="x-comment-footer uk-margin-top">&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>&ndash;&gt;-->
                <!--&lt;!&ndash;<a href="#" class="uk-button">赞</a>&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</article>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->

                <!--</ul>-->
                <!--&lt;!&ndash;<li class="reply">&ndash;&gt;-->
                <!--&lt;!&ndash;<form class="uk-form" action="#" method="post">&ndash;&gt;-->
                <!--&lt;!&ndash;<div class="uk-form-row">&ndash;&gt;-->
                <!--&lt;!&ndash;<textarea rows="1" placeholder="文明社会，理性评论" style="width:80%;min-height: 25px; max-height: 132px; overflow: hidden; word-wrap: break-word; height: 30px;"></textarea>&ndash;&gt;-->
                <!--&lt;!&ndash;<input type="submit" class="uk-button">&ndash;&gt;-->
                <!--&lt;!&ndash;</div>&ndash;&gt;-->
                <!--&lt;!&ndash;</form>&ndash;&gt;-->
                <!--&lt;!&ndash;</li>&ndash;&gt;-->
                <!--</li>-->
            </ul>

            <div class="reply" id="final-reply">
                <form class="uk-form" action="#" method="post" id="reply-form">
                    <div class="uk-form-row">
                        <textarea rows="1" placeholder="文明社会，理性评论" style="width:80%;min-height: 25px; max-height: 132px; overflow: hidden; word-wrap: break-word; height: 30px;"></textarea>
                        <input type="submit" class="uk-button">
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>

</body>
</html>