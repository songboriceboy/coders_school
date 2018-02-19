<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/15
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>hello</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.min.css" rel="stylesheet">

    <script type="text/javascript">
      function upfile(){
        var pic=document.getElementsByTagName('input')[0].files[0];
        var fd=new FormData();
        var xhr=new XMLHttpRequest();
        xhr.open('post','${pageContext.request.contextPath}/user/upload_avatar',true);
        xhr.onreadystatechange=function (){
          if(this.readyState==4){
            var res = JSON.parse(this.responseText);
            document.getElementById('avatar').src = '${pageContext.request.contextPath}/avatar/' + res.src;
          }
        }
        xhr.upload.onprogress=function (ev){

          if(ev.lengthComputable){
            var precent=100 * ev.loaded/ev.total;
            console.log(precent);
            document.getElementById('nei').style.width=precent+'%';
            document.getElementById('precent').innerHTML=Math.floor(precent)+'%';
          }
        }
        fd.append('file',pic);
        xhr.send(fd);
      }
    </script>
    <style>
      #wai{
        width:500px;
        height:30px;
        border:1px solid green;
      }
      #nei{
        width:0px;
        height:30px;
        background:green;
      }
    </style>
  </head>
  <body>
  欢迎您 ${user_info.user_name}
<a href="${pageContext.request.contextPath}/user/login">login</a>
<a href="${pageContext.request.contextPath}/user/reg">reg</a>
  <a href="${pageContext.request.contextPath}/topic/new">new topic</a>

  <div id="wai">
    <div id="nei"></div>
  </div><span id="precent"></span><br/>
  <img class="uk-border-circle" id="avatar">
  <input type="file" name="pic" onchange="upfile();"/>

  <ul>
    <c:forEach items="${topics}" var="topic">
        <li>
          <a href="${pageContext.request.contextPath}/topic/show/${topic.topic_id}">${topic.topic_title}</a>
          <a href="${pageContext.request.contextPath}/topic/modify/${topic.topic_id}">修改</a>
        </li>
    </c:forEach>
  </ul>
  </body>
</html>
