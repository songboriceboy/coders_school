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
  </head>
  <body>
  欢迎您 ${user_info.user_name}
<a href="${pageContext.request.contextPath}/user/login">login</a>
<a href="${pageContext.request.contextPath}/user/reg">reg</a>
  <a href="${pageContext.request.contextPath}/topic/new">new topic</a>
  <ul>
    <c:forEach items="${topics}" var="topic">
        <li>
          ${topic.topic_title}
          <a href="${pageContext.request.contextPath}/topic/modify/${topic.topic_id}">修改</a>
        </li>
    </c:forEach>
  </ul>
  </body>
</html>
