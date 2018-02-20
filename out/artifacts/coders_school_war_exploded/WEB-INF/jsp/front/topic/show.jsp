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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />

    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/autosize.js"></script>
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
//                    $('#final-reply').on('submit', 'form', function () {
//
//                    })
                    $('#uk-comment-list').on('click', '.btn-reply', function () {
//                        alert($(this).closest('.uk-comment').html());
                        alert($(this).closest('.uk-comment').find('h4').text());
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
                        autosize(document.querySelector('textarea'));
                        return false;
                    })



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
                                        autosize(document.querySelector('textarea'));
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