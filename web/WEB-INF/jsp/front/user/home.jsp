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
                        <div data-v-4cdfa676="" data-v-3f216172="" class="user-info-block block shadow">
                            <div data-v-b2db8566="" data-v-1b9df826="" data-v-4cdfa676=""
                                 data-src="http://tvax3.sinaimg.cn/default/images/default_avatar_male_180.gif"
                                 class="lazy avatar avatar loaded" title="" data-v-3f216172=""
                                 style="background-image: url(&quot;http://tvax3.sinaimg.cn/default/images/default_avatar_male_180.gif&quot;);"></div>
                            <div data-v-282a39d4="" data-v-4cdfa676="" class="info-box info-box" data-v-3f216172=""><h1
                                    data-v-282a39d4="" class="username">__豆约翰__</h1>
                                <div data-v-282a39d4="" class="position">
                                    <div data-v-282a39d4="" st:name="profileBtn" title="填写职位信息" class="info-input">
                                        你从事什么职业？
                                    </div>
                                </div>
                                <div data-v-282a39d4="" class="intro">
                                    <div data-v-282a39d4="" st:name="profileBtn" title="填写个人介绍" class="info-input">
                                        你有哪些爱好？
                                    </div>
                                </div>
                            </div>
                            <div data-v-4cdfa676="" data-v-3f216172="" class="action-box">
                                <div data-v-9595d788="" data-v-4cdfa676="" class="link-box link-box" data-v-3f216172="">
                                    <a data-v-9595d788="" title="微博" class="weibo-link link"
                                       href="https://weibo.com/u/1366427322" rel="nofollow noopener noreferrer"
                                       target="_blank">
                                        <svg data-v-9595d788="" width="21" height="18" viewBox="0 0 21 18"
                                             class="icon weibo-icon">
                                            <g data-v-9595d788="" fill="none" fill-rule="nonzero">
                                                <path data-v-9595d788="" fill="#D52B2A"
                                                      d="M15.343 8.474c-.268-.08-.452-.135-.311-.489.304-.767.335-1.429.005-1.9-.619-.887-2.312-.839-4.252-.025 0 0-.61.267-.454-.217.299-.961.254-1.767-.21-2.232-1.054-1.055-3.853.04-6.254 2.445-1.798 1.802-2.842 3.711-2.842 5.362 0 3.158 4.042 5.078 7.996 5.078 5.184 0 8.633-3.018 8.633-5.413 0-1.448-1.217-2.27-2.31-2.609zm-6.311 6.89c-3.156.312-5.88-1.117-6.084-3.193-.205-2.075 2.187-4.01 5.342-4.323 3.156-.313 5.88 1.117 6.085 3.191.204 2.077-2.187 4.012-5.343 4.325z"></path>
                                                <path data-v-9595d788="" fill="#E89213"
                                                      d="M18.786 2.695a5.039 5.039 0 0 0-4.803-1.558.731.731 0 0 0 .304 1.43 3.584 3.584 0 0 1 3.415 1.108 3.6 3.6 0 0 1 .75 3.516.73.73 0 0 0 1.39.451v-.003a5.06 5.06 0 0 0-1.056-4.944"></path>
                                                <path data-v-9595d788="" fill="#E89213"
                                                      d="M16.863 4.433a2.453 2.453 0 0 0-2.34-.758.63.63 0 0 0 .263 1.23v.002a1.202 1.202 0 0 1 1.394 1.548.629.629 0 0 0 1.195.387 2.462 2.462 0 0 0-.512-2.409"></path>
                                                <path data-v-9595d788="" fill="#040000"
                                                      d="M9.347 9.445c-1.501-.391-3.199.359-3.85 1.684-.665 1.352-.023 2.853 1.494 3.344 1.572.507 3.424-.27 4.068-1.73.635-1.426-.158-2.895-1.712-3.298zm-1.146 3.453c-.306.488-.96.702-1.451.476-.486-.221-.629-.788-.324-1.263.302-.474.934-.685 1.422-.48.495.211.652.774.353 1.267zm1.005-1.293c-.11.189-.354.28-.545.201-.188-.077-.247-.289-.14-.474.11-.185.344-.276.531-.201.19.07.26.284.154.474z"></path>
                                            </g>
                                        </svg>
                                    </a><a data-v-9595d788="" title="绑定 GitHub" class="github-link link inactive"
                                           rel="nofollow noopener noreferrer" target="_blank">
                                    <svg data-v-9595d788="" width="21" height="18" viewBox="0 0 21 18"
                                         class="icon github-icon">
                                        <path data-v-9595d788="" fill="#161614" fill-rule="nonzero"
                                              d="M1.857 9.203c0 3.624 2.456 6.698 5.862 7.782.429.076.585-.177.585-.395 0-.194-.007-.71-.012-1.395-2.384.496-2.887-1.1-2.887-1.1-.39-.947-.952-1.2-.952-1.2-.778-.508.06-.498.06-.498.86.058 1.312.846 1.312.846.765 1.253 2.007.89 2.495.68.078-.529.3-.89.544-1.095-1.903-.207-3.904-.911-3.904-4.054 0-.896.334-1.628.882-2.201-.088-.208-.383-1.042.084-2.171 0 0 .72-.22 2.357.84a8.557 8.557 0 0 1 2.146-.276 8.566 8.566 0 0 1 2.146.277c1.636-1.062 2.354-.841 2.354-.841.468 1.129.174 1.963.086 2.17.55.574.881 1.306.881 2.202 0 3.15-2.004 3.844-3.913 4.047.307.253.581.754.581 1.52 0 1.096-.01 1.98-.01 2.25 0 .219.154.474.589.394C16.546 15.898 19 12.825 19 9.203 19 4.673 15.162 1 10.428 1c-4.733 0-8.57 3.672-8.57 8.203z"></path>
                                    </svg>
                                </a><a data-v-9595d788="" title="个人主页" class="site-link link"
                                       href="http://weibo.com/douyh" rel="nofollow noopener noreferrer" target="_blank">
                                    <svg data-v-9595d788="" width="21" height="18" viewBox="0 0 21 18"
                                         class="icon site-icon">
                                        <path data-v-9595d788="" fill="#0062D1" fill-rule="evenodd"
                                              d="M12.956 5.684l-.04.08-.472-.043.1-.432.412.395m-1.459-1.84l-.663-.29c.452-.216.55-.17.663.29m1.683.133l-.11.02-2.015-2.098 2.394 1.091c-.271.228-.428.554-.269.987M10.334 1.93l.564-.205.078.074c-.11.127-.208.269-.339.366-.025.02-.175-.133-.303-.235m.018.619c.517.025.862.358 1.221.667l-.078.14-1.209-.688.066-.119M8.885 2.42c.202.051.393.085.57.157.03.012.03.253-.013.274-.146.076-.318.101-.49.149l-.067-.58m2.267 10.777c-.182-.2-.338-.423-.5-.64-.276-.366-.293-.75-.065-1.145.07-.122.152-.253.17-.388.035-.271-.13-.335-.376-.359-.18-.018-.463-.107-.503-.23-.189-.588-.728-.62-1.152-.773-.428-.153-.745-.336-.924-.78-.129-.318-.336-.603-.508-.903l-.05.018.167.739c-.112-.174-.185-.25-.215-.34-.207-.623-.481-1.237-.576-1.878-.055-.371.183-.788.292-1.183.016-.057.079-.112.073-.163a18.42 18.42 0 0 0-.13-.918c-.072-.432-.29-.504-.633-.22-.111.093-.232.172-.348.258l-.096-.101c.225-.28.41-.608.682-.826.39-.314.724-.756 1.386-.535.344.115.715.18 1.074.291.308.095.695-.076 1.047-.13L9.95 2.88l.515.339c.045.25-.04.443-.388.46-.091.004-.188.079-.266.142-.425.343-.399.572.086.822.533.274.533.274.701.638.053-.291.102-.583.16-.873.033-.168.079-.333.119-.5.14.065.276.143.422.193.376.13.691.347.952.65.09.106.186.207.335.373l-1.124.517-.005.152c.459-.47.5.087.737.173-.026.05-.04.09-.048.09-.687-.114-.782.618-1.207.877-.035.022-.08.083-.073.112.09.337-.14.482-.34.672-.085.082-.098.266-.1.405-.003.117.057.236.09.354l-.092.05c-.055-.068-.126-.128-.162-.205-.168-.358-.384-.435-.752-.27a.495.495 0 0 1-.247.03c-.368-.04-.555.09-.624.449-.08.408.103.87.385.92.087.015.205-.061.284-.126.11-.09.198-.209.295-.315l.103.053-.142.613c.119.035.238.046.327.104.08.053.18.154.184.239.028.482.425.716.835.475.6-.353 1.192-.206 1.736.098.37.208.659.564 1.022.792.251.157.563.222.855.305.451.128.51.226.304.651-.152.314-.269.674-.5.915-.506.527-1.079.986-1.617 1.482-.458.422-1.224.548-1.254 1.382-.353-.038-.461-.232-.383-.535.109-.425.244-.844.355-1.27.111-.42.019-.79-.277-1.115m4.934-8.278l-.128.09-.47-.757.098-.07.5.737m.487 3.061c.028-.165.062-.333.055-.498a.946.946 0 0 1 .424-.863c.071-.05.24-.06.293-.01.144.137.313.3.361.482.263 1.008.355 2.031.134 3.148-.233-.259-.4-.224-.585-.023-.163.177-.298.147-.441-.085-.42-.685-.365-1.41-.24-2.15m-.288-2.535c-.02-.281-.034-.563-.056-.935.747.402.751 1.15 1.09 1.682l-.452-.537-.078 1.066c-.338-.259-.543-.46-.46-.847.028-.133-.033-.285-.044-.43M10.857 1C6.525 1 3 4.589 3 9s3.525 8 7.857 8c4.333 0 7.857-3.589 7.857-8s-3.524-8-7.857-8"></path>
                                    </svg>
                                </a></div>
                                <button data-v-4cdfa676="" data-v-3f216172="" st:name="settingBtn"
                                        class="setting-btn btn">编辑个人资料
                                </button>
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