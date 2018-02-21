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
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/pagination.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/template.js"></script>
    <style>
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

      var pagination;
      var pagesize = 3;
      //规定，cateid=0代表加载全部分类的主题
      //index:要第几页
      //catetoryid:分类是什么（0，代表全部分类）
      function loadData(index,section_id)
      {
        $.getJSON('${pageContext.request.contextPath}/topic/getpagedtopics'
                ,{pageIndex:index,pageSize:pagesize,section_id:section_id},function(data)
                {
                  var html = template('topic-list-tpl',data);

                  $('#topic-list').html(html);

                })
      }

      $(function()
      {
        //alert('ddd');
        //向服务器发起ajax请求，询问分类表中一共有多少条记录
        //回调函数,服务器回应我们的请求后，该回调函数会被浏览器调用
        //并且将服务器回应的数据，通过data参数传进来
        //$.get('请求地址','发给服务器的参数',回调函数(data));
        //0：代表查找全部分类
        $.getJSON('${pageContext.request.contextPath}/topic/gettopiccounts/0',function(json){
          //alert(param)
          //$('#count').html(param);

          //var pagination = UIkit.pagination(分页组件元素,配置选项json对象);


          pagination = UIkit.pagination('.uk-pagination', {items:json.counts,itemsOnPage:pagesize});

          loadData(0,0);

          $('.uk-pagination').on('select.uk.pagination',function(e,index){
            //alert(index);
            //向服务器要第二页数据（每页3条）

            loadData(index,0);

          })
        });


        $('.uk-navbar-nav li a').on('click',function(){
          //alert('ddd');
          var section_id = $(this).attr("section_id");

          $.getJSON('${pageContext.request.contextPath}/topic/gettopiccounts/'+section_id,function(json){
            //alert(param)
            //$('#count').html(param);

            //var pagination = UIkit.pagination(分页组件元素,配置选项json对象);
//            var json=JSON.parse(param);

            pagination.options.items = json.counts;
            pagination.init();
            //var pagination = UIkit.pagination('.uk-pagination', {items:json.counts,itemsOnPage:9});
            //第二次发ajax
            loadData(0,section_id);

            $('.uk-pagination').on('select.uk.pagination',function(e,index){
              //alert(index);
              //向服务器要第二页数据（每页3条）

              loadData(index,section_id);

            })
          });
        })
      });

    </script>

  </head>
  <body>
  欢迎您 ${user_info.user_name}
<a href="${pageContext.request.contextPath}/user/login">login</a>
<a href="${pageContext.request.contextPath}/user/reg">reg</a>
  <a href="${pageContext.request.contextPath}/topic/new">new topic</a>
  <a href="${pageContext.request.contextPath}/">home</a>
  <div id="wai">
    <div id="nei"></div>
  </div><span id="precent"></span><br/>
  <img class="uk-border-circle" id="avatar">
  <input type="file" name="pic" onchange="upfile();"/>

  <nav class="uk-navbar">

      <ul class="uk-navbar-nav">
          <c:forEach items="${sections}" var="section">
              <li><a href="javascript:;" section_id="${section.section_id}">${section.section_name}</a></li>
          </c:forEach>
      </ul>
  </nav>


  <ul class="uk-margin-top" id="topic-list">

  </ul>

  <ul class="uk-pagination">

  </ul>


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
                <span class="uk-badge uk-badge-notification uk-vertical-align-middle">100</span>
              </div>
            </div>

            <div>
              <span class="node"><a href="#">Android</a></span>
              <span class="split">•</span>
              <span class="author"><a href="${pageContext.request.contextPath}/user/show/{{topic.user_id}}">{{topic.user_name}}</a></span>
              <span class="split">•</span>
              <span class="datetime">{{topic.topic_createtime}}</span>
            </div>

          </div>
        </li>

      {{/each}}

    </ul>
  </script>
  </body>
</html>
