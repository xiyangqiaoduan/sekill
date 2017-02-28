<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>秒杀列表页</title>
<%@include file="common/header.jsp"%>

<script type="text/javascript">

	
var ws = null;  
function startServer(){
	
	var url="ws://127.0.0.1:8080/seckill/websocket/test"; 
	 if ('WebSocket' in window) {  
         ws = new WebSocket(url);  
     } else if ('MozWebSocket' in window) {  
         ws = new MozWebSocket(url);  
     } else {  
         console.log('浏览器不支持');  
         return;  
     }  
	
	  ws.onopen = function() {  
          //alert('Opened!');  
      };  
      // 收到服务器发送的文本消息, event.data表示文本内容  
      ws.onmessage = function(event) {  
         // alert('Receive message: ' + event.data);  
          console.log(event.data);
          
      };  
      ws.onclose = function() {  
      //  alert('Closed!');  
     }  
}
//发送信息  
function sendMessage(){  
    var textMessage=document.getElementById("textMessage").value;  
      
    if(ws!=null&&textMessage!=""){  
        ws.send(textMessage);  
          
    }  
}  
</script>

</head>
<body onload="startServer()">
 		

	<div class="container">

		<div class="panel panel-default">
			<div class="panel-heading text-center">
				<h2>秒杀列表页</h2>
			</div>

			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>名称</th>
							<th>库存</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>详情页</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="sk" items="${list }">
							<tr>
								<td>${sk.name }</td>
								<td>${sk.number }</td>
								<td><fmt:formatDate value="${sk.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><fmt:formatDate value="${sk.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><a class="btn btn-info" href="/seckill/seckill/${sk.seckillId }/detail" target="_blank">link</a></td>
							</tr>
						</c:forEach>

					</tbody>


				</table>
			</div>
		</div>

	</div>
</body>
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
</html>