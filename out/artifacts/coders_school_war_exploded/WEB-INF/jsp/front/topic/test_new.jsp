<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>admin</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png">
    <link id="data-uikit-theme" rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/uikit.docs.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/docs.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/editor-md-master/editormd.min.js"></script>

    <%--<script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>--%>
    <script>

//        var testEditor = null;

        $(function () {

            var testEditor = editormd({
                id: "test-editormd",
//                height: 840,
                width   : "90%",
                height  : 100,
//                autoHeight      : true,

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
//                    this.hideToolbar();

                },
                onpreviewing : function() {
                    this.watch();
                     console.log("onpreviewing =>", this, this.id, this.settings);
                    // on previewing you can custom css .editormd-preview-active
                },

                onpreviewed : function() {
                     console.log("onpreviewed =>", this, this.id, this.settings);
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
                var param = $("#article_form").serialize();
                $.post('${pageContext.request.contextPath}/topic/save_topic', param)
                        .done(function (article) {
                            if(article.topic_id >= 0)
                            {
                                alert("ok");
                                return false;
                            }

                        })
                        .fail(function () {

                        });
            })

        });
    </script>
</head>
<body class="tm-background">



<div class="tm-middle">
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin>

            <div class="tm-main uk-width-medium-2-4">

                <div>
                    <form action="#" method="post"
                          target="_blank" id = "article_form">
                        <h1>完整demo</h1>

                        <input type="hidden" name = "topic_id" value="${topic.topic_id}" id="topic_id">

                        标题： <input type="text" name="topic_title" value="${topic.topic_title}" id = "title">

                        <div class="editormd" id="test-editormd">

                            <textarea class="editormd-markdown-textarea" name="topic_markdown_content" id = "topic_markdown_content">${topic.topic_markdown_content}</textarea>
                            <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                            <%--<textarea class="editormd-html-textarea" name="article_content"></textarea>--%>

                        </div>
                        <input type="button" value="保存博文w" id = "submit">
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</div>



</body>
<html>