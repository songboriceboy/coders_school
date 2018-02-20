<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />

    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <%--<script src="${pageContext.request.contextPath}/assets/js/autosize.js"></script>--%>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/editor-md-master/editormd.min.js"></script>
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
            var txt = testEditor2.getHTML();

            var param = $("#reply-reply-form").serialize();
            $.post('${pageContext.request.contextPath}/comment/add_comment', param)
                    .done(function (comment) {
                        if(comment.comment_id >= 0)
                        {
                            alert('first');

                            var comment = `
                    <li class="reply-child-item" id="comment_${cid}">
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

                            var $div = $('#reply-anywhere');
                            if ($div.length > 0)
                            {
                                testEditor2.editor.remove();
                                $('#reply-anywhere').remove();
                            }

                            return false;

                        }

                    })
                    .fail(function () {

                    });

            return false;

        }

        var testEditor2 = null;
        $(document).ready(function () {


                    //markdown
                    var testEditor = editormd({
                        id: "test-editormd",
//                height: 840,
                        width   : "90%",
                        height  : 250,
                        placeholder          : "文明社会，理性评论，支持Markdown",
                        path: "${pageContext.request.contextPath}/assets/editor-md-master/lib/",
                        toolbarIcons: function () {
                            // Or return editormd.toolbarModes[name]; // full, simple, mini
                            // Using "||" set icons align right.
                            return ["undo", "redo", "|", "watch", "fullscreen", "preview"]
                        },
                        //toolbar  : false,             // 关闭工具栏
                        codeFold: true,
                        searchReplace: true,
                        saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
                        htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                        emoji: true,
                        taskList: true,
                        tocm: true,          // Using [TOCM]
                        tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
                        //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
                        flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
                        sequenceDiagram: true,          // 同上
                        //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
                        //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
                        //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
                        //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
                        //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
                        imageUpload: true,
                        imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                        imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
                        onload: function () {
                            this.unwatch();
                            this.on('paste', function () {
                                console.log(1);
                            });

                        },
                        onpreviewing : function() {
                            this.watch();
//                            console.log("onpreviewing =>", this, this.id, this.settings);
                            // on previewing you can custom css .editormd-preview-active
                        },

                        onpreviewed : function() {
//                            console.log("onpreviewed =>", this, this.id, this.settings);
                            this.unwatch();
                        }
                    });

                    /**
                     * 上传图片
                     */
                    $("#test-editormd").on('paste', function (ev) {
                        var data = ev.clipboardData;
                        var items = (event.clipboardData || event.originalEvent.clipboardData).items;
                        for (var index in items) {
                            var item = items[index];
                            if (item.kind === 'file') {
                                var blob = item.getAsFile();
                                var reader = new FileReader();
                                reader.onload = function (event) {
                                    var base64 = event.target.result;
                                    //ajax上传图片
                                    $.post("${pageContext.request.contextPath}/topic/uploadimg",{base:base64}, function (res) {
                                        // layer.msg(ret.msg);
                                        var ret = JSON.parse(res);
                                        if (ret.code === 1) {
                                            //新一行的图片显示
                                            testEditor.insertValue("\n![" + "image.png" + "](${pageContext.request.contextPath}/" + ret.path + ")");
                                        }
                                    });
                                }; // data url!
                                var url = reader.readAsDataURL(blob);
                            }
                        }
                    });

//                    autosize(document.querySelector('textarea'));
                    //点击某条评论里的回复按钮，动态生成一个textarea
                    $('#uk-comment-list').on('click', '.btn-reply', function () {

//                        alert($(this).closest('.uk-comment').find('h4').text());
                        var reply_comment_id = $(this).closest('.reply-item').attr('id').replace('comment_','');

                        var $div = $('#reply-anywhere');
                        if ($div.length > 0)
                        {
                            testEditor2.editor.remove();
                            $('#reply-anywhere').remove();
                        }
                        var reply = `
                                   <div class="reply" id="reply-anywhere">
                            <form class="uk-form" id="reply-reply-form" action="#" method="post" onsubmit="return check_submit(this);">
                                <div class="uk-form-row">
                                    <input type="hidden" name = "topic_id" value="${topic.topic_id}">
                                    <input type="hidden" name = "reply_comment_id" value="${reply_comment_id}">
                               <div class="editormd" id="test-editormd2">
    <textarea class="editormd-markdown-textarea" name="comment_markdown_content" id = "topic_markdown_content2"></textarea>
</div>
                                    <input type="submit" class="uk-button">
                                </div>
                            </form>
                        </div>`;
                        var replynode = $(reply);
                        $(this).closest('.reply-item').append(replynode);


                        //markdown
                        testEditor2 = editormd({
                            id: "test-editormd2",
//                height: 840,
                            width   : "90%",
                            height  : 250,
                            placeholder          : "文明社会，理性评论，支持Markdown",
                            path: "${pageContext.request.contextPath}/assets/editor-md-master/lib/",
                            toolbarIcons: function () {
                                // Or return editormd.toolbarModes[name]; // full, simple, mini
                                // Using "||" set icons align right.
                                return ["undo", "redo", "|", "watch", "fullscreen", "preview"]
                            },
                            //toolbar  : false,             // 关闭工具栏
                            codeFold: true,
                            searchReplace: true,
                            saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
                            htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                            emoji: true,
                            taskList: true,
                            tocm: true,          // Using [TOCM]
                            tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
                            //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
                            flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
                            sequenceDiagram: true,          // 同上
                            //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
                            //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
                            //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
                            //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
                            //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
                            imageUpload: true,
                            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                            imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
                            onload: function () {
                                this.unwatch();
                                this.on('paste', function () {
                                    console.log(1);
                                });

                            },
                            onpreviewing : function() {
                                this.watch();
//                            console.log("onpreviewing =>", this, this.id, this.settings);
                                // on previewing you can custom css .editormd-preview-active
                            },

                            onpreviewed : function() {
//                            console.log("onpreviewed =>", this, this.id, this.settings);
                                this.unwatch();
                            }
                        });

                        /**
                         * 上传图片
                         */
                        $("#test-editormd2").on('paste', function (ev) {
                            var data = ev.clipboardData;
                            var items = (event.clipboardData || event.originalEvent.clipboardData).items;
                            for (var index in items) {
                                var item = items[index];
                                if (item.kind === 'file') {
                                    var blob = item.getAsFile();
                                    var reader = new FileReader();
                                    reader.onload = function (event) {
                                        var base64 = event.target.result;
                                        //ajax上传图片
                                        $.post("${pageContext.request.contextPath}/topic/uploadimg",{base:base64}, function (res) {
                                            // layer.msg(ret.msg);
                                            var ret = JSON.parse(res);
                                            if (ret.code === 1) {
                                                //新一行的图片显示
                                                testEditor.insertValue("\n![" + "image.png" + "](${pageContext.request.contextPath}/" + ret.path + ")");
                                            }
                                        });
                                    }; // data url!
                                    var url = reader.readAsDataURL(blob);
                                }
                            }
                        });




                        return false;
                    })

                    //动态添加元素的事件绑定问题参考了http://blog.csdn.net/lixin2151408/article/details/71411564
                    //最后面的评论框提交
//                    $('#final-reply').on('submit', 'form', function () {
//
//                    })
                    $("#submit").click(function () {
                        var param = $("#reply-form").serialize();
                        $.post('${pageContext.request.contextPath}/comment/add_comment', param)
                                .done(function (comment) {
                                    if(comment.comment_id >= 0)
                                    {
                                        alert('first');
//                        var txt = $(this).find('textarea').val();
                                        var txt = testEditor.getHTML();
                                        var comment = `
                    <li class="reply-item" id="comment_${cid}">
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

                                    }

                                })
                                .fail(function () {

                                });

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


            <%--<ul class="uk-comment-list" id="uk-comment-list">--%>
             <%----%>
            <%--</ul>--%>

            <ul class="uk-comment-list" id="uk-comment-list">
                <c:forEach items="${mapComments}" var="entry">
                    <li class="reply-item" id="comment_${entry.value.curr_comment_id}">
                        <article class="uk-comment">
                            <header class="uk-comment-header">
                                <img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">
                                <h4 class="uk-comment-title">${entry.value.curr_comment_user_id}</h4>
                                <div class="uk-comment-meta">${entry.value.curr_comment_createtime} | Profile | #</div>
                            </header>
                            <div class="uk-comment-body">
                                <p>${entry.value.curr_comment_content}</p>
                            </div>
                            <div class="x-comment-footer uk-margin-top">
                                <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                                <a href="#" class="uk-button">赞</a>
                            </div>
                        </article>

                        <ul class="ul-comment-list-child">
                            <c:forEach items="${entry.value.childCommentList}" var="childComment">
                                <li class="reply-child-item" id="comment_${childComment.comment_id}">
                                    <article class="uk-comment">
                                        <header class="uk-comment-header">
                                            <img class="uk-comment-avatar" src="https://sfault-avatar.b0.upaiyun.com/245/908/2459088887-5a6fbf581bbbb_big64" width="50" height="50" alt="">
                                            <h4 class="uk-comment-title">${childComment.user_id}</h4>
                                            <div class="uk-comment-meta">${childComment.comment_createtime}| Profile | #</div>
                                        </header>
                                        <div class="uk-comment-body">
                                            <p>${childComment.comment_content}</p>
                                        </div>
                                        <div class="x-comment-footer uk-margin-top">
                                            <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                                            <a href="#" class="uk-button">赞</a>
                                        </div>
                                    </article>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>

            <div class="reply" id="final-reply">
                <form class="uk-form" action="#" method="post" id="reply-form">
                    <div class="uk-form-row">
                        <div class="editormd" id="test-editormd">
                            <input type="hidden" name = "topic_id" value="${topic.topic_id}">
                            <textarea class="editormd-markdown-textarea" name="comment_markdown_content" id = "topic_markdown_content"></textarea>
                            <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                            <%--<textarea class="editormd-html-textarea" name="article_content"></textarea>--%>

                        </div>
                        <input type="submit" class="uk-button" id="submit">
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>
</body>
</html>