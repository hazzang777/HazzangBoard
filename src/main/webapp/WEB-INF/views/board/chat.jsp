<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@include file="../includes/header.jsp" %>



	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-2">	   
				<div id="one">
				<br><br> 
					<span class="h2">실시간 채팅방</span>&nbsp;<span class="h3">(이용자수:${count})</span>
					<br><br> 
					<div class="form-inline">
					<input type="text" class="form-control" placeholder="별명입력하세요" id="nickname" />
					<input type="button" class="btn btn-success btn-sm" id="enter" value="입장" />
					</div>
				</div>
				
				<div id="two"  style="display:none">
					<input type="button" class="btn btn-danger btn-sm" id="exit" value="퇴장" />
					<br/><br/>
					<div id="chatarea" style="width:400px; height:600px; border:1px solid;"></div>
					<br/>
					<div class="form-inline">
					<input type="text" class="form-control" id="message" />
					<input type="button" class="btn btn-info" id="send" value="보내기" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		one = document.getElementById("one");
		
		two = document.getElementById("two");
		
		document.getElementById("enter").addEventListener("click",function(){
			// 웹 소켓을 연결해주는 함수 호출
			connect();
		});
		
		document.getElementById("exit").addEventListener("click",function(){
			// 연결을 해제해주는 함수 호출
			
			 disconnect();
		});
		
		document.getElementById("send").addEventListener("click",function(){
			// 채팅 입력
			send();
		});
		
		var websocket;
		
		// 입장 버튼을 눌렀을 때 호출 되는 함수
		 
		function connect(){
			websocket = new WebSocket("ws://localhost:8090/chat-ws");
			
			// 웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
			
			websocket.onopen = onOpen;
			
			websocket.onmessage = onMessage;
			
			websocket.onclose = onClose;
		}
		
		// 퇴장 버튼을 눌렀을 때 호출되는 함수
		
		function disconnect(){
			msg = document.getElementById("nickname").value;
			
			websocket.send(msg+"님이 퇴장하셨습니다.");
			
			websocket.close();
		}
		
		// 보내기 버튼을 눌렀을 때 호출될 함수
		
		function send(){
			nickname = document.getElementById("nickname").value;
			
			msg = document.getElementById("message").value;
			
			websocket.send(nickname + ":" + msg);
			
			document.getElementById("message").value = "";
		}
		
		// 웹 소켓에 연결되었을때 호출될 함수
		
		function onOpen(){
			
			nickname = document.getElementById("nickname").value;
			
			two = document.getElementById("two");
			
			two.style.display = 'block';
		
			websocket.send(nickname + "님 입장하셨습니다.");
		}
		
		// 웹 소켓에서 연결이 헤제 되었을 때 호출될 함수
		function onMessage(evt){
			data = evt.data;
			
			chatarea = document.getElementById("chatarea");
			
			chatarea.innerHTML = data + "<br/>" + chatarea.innerHTML;
		}
		
		function onClose(){
			
		}






	</script>


<%@include file="../includes/footer.jsp" %>  