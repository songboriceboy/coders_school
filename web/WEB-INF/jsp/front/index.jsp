<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/15
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>hello</title>
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/Mricode.Pagination-master/mricode.pagination.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.js"></script>
    <script src="${pageContext.request.contextPath}/assets/Mricode.Pagination-master/mricode.pagination.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <script type="text/javascript">


      var pagesize = 5;

      $(function()
      {
        $("#page").pagination({
          pageIndex: 0,
          pageSize: pagesize,
          showFirstLastBtn:true,
//          showInfo: true,
//          showJump: true,
//          showPageSizes: true,
          remote: {
            url: '${pageContext.request.contextPath}/topic/getpagedtopics',
            success: function (data) {
              var html = template('topic-list-tpl', data);
              $('#topic-list').html(html);
              $('.node a').on('click',function(){

                var section_id = $(this).attr("section_id");
                $("#page").pagination('setPageIndex', 0);
                $("#page").pagination('setPageSize', pagesize);
                $("#page").pagination('setParams', {section_id:section_id});
                $("#page").pagination('remote');

              })
            }
          }
        });



        $('.uk-navbar-nav li a').on('click',function(){

          var section_id = $(this).attr("section_id");
          $("#page").pagination('setPageIndex', 0);
          $("#page").pagination('setPageSize', pagesize);
          $("#page").pagination('setParams', {section_id:section_id});
          $("#page").pagination('remote');

        })

      });

    </script>

  </head>
  <body>
  <%--欢迎您 ${user_info.user_name}--%>
<%--<a href="${pageContext.request.contextPath}/user/login">login</a>--%>
<%--<a href="${pageContext.request.contextPath}/user/reg">reg</a>--%>
  <%--<a href="${pageContext.request.contextPath}/topic/new">new topic</a>--%>
  <%--<a href="${pageContext.request.contextPath}/">home</a>--%>
  <%--<div id="wai">--%>
    <%--<div id="nei"></div>--%>
  <%--</div><span id="precent"></span><br/>--%>
  <%--<img class="uk-border-circle" id="avatar">--%>
  <%--<input type="file" name="pic" onchange="upfile();"/>--%>
  <%@include file="common/header.jsp"%>
  <div class="mb-cover">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">

    <nav class="uk-navbar">

      <ul class="uk-navbar-nav">
          <c:forEach items="${sections}" var="section">
              <li><a href="javascript:;" section_id="${section.section_id}">${section.section_name}</a></li>
          </c:forEach>
      </ul>
  </nav>


  <ul class="uk-margin-top" id="topic-list">

  </ul>

  <div id="page" class="m-pagination"></div>

    </div>
  </div>

  <script type="text/html" id="topic-list-tpl">
    <ul class="bookshelf">

      {{each list as topic i}}
        <li class="uk-list uk-list-line uk-clearfix topic uk-margin-top">
          <a href="#" class="author-avatar"><img class="avatar" src="${pageContext.request.contextPath}/avatar/{{topic.user_avatar}}"></a>
          <div class="content">
            <div class="uk-grid">
              <div class="uk-width-5-6">
                <a href="${pageContext.request.contextPath}/topic/show/{{topic.topic_id}}">{{topic.topic_title}}</a>
                <a href="${pageContext.request.contextPath}/topic/modify/{{topic.topic_id}}">修改</a>
              </div>
              <div class="uk-width-1-6 uk-vertical-align uk-text-center">
                {{if topic.comment_count > 0}}
                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">
                  {{topic.comment_count}}
                </span>
                {{/if}}
              </div>
            </div>

            <div>
              <span class="node"><a href="javascript:;" section_id = {{topic.section_id}}>{{topic.section_name}}</a></span>
              <span class="split">•</span>
              <span class="author"><a href="${pageContext.request.contextPath}/user/show/{{topic.user_id}}">{{topic.user_name}}</a></span>
              <span class="split">•</span>
              <span class="datetime">{{topic.createtime_str}}</span>
            </div>

          </div>
        </li>

      {{/each}}

    </ul>
  </script>
  </body>
</html>
