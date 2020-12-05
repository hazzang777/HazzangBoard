<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@include file="../includes/header.jsp" %>

<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원가입</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="joinForm" action="/member/join" method="post">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <fieldset>
                                <div class="form-group">
                                	<label>아이디</label>
                                    <input id="user_id" class="form-control" placeholder="ID" name="userid" type="text" autofocus>
                                    <div class="check_font" id="id_check"></div>
                                    <button id="duplicate_check" type="button" onclick="check();" class="btn btn-warning">중복체크</button>
                                    
                                </div>
                                <div class="form-group">
                                  	<label>비밀번호</label>
                                    <input class="form-control" id="pw1" placeholder="Password" name="userpw" type="password" autofocus>
                                    <div class="check_font" id="pw1_check"></div>
                                </div>
                                
                                 <div class="form-group">
                                  	<label>비밀번호확인</label>
                                    <input class="form-control" id="pw2" placeholder="Password" name="userpwCheck" type="password" autofocus>
                                    <div class="check_font" id="pw2_check"></div>
                                </div>
                                
                                <div class="form-group">
                                  	<label>이름</label>
                                    <input class="form-control" id="name" placeholder="NAME" name="username" type="text" autofocus>
                                    <div class="check_font" id="name_check"></div>
                                </div>
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="index.html" class="btn btn-lg btn-success btn-block">Join</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
    
    <script>
    
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";
    
    function check(){
    	id = $("#user_id").val();
    	console.log(id);
    	$.ajax({
    		url:'/member/check',
    		type:'POST',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
    		},
    		dataType:'text',
    		contentType:'text/plain; charset=utf-8;',
    		data:id,
    		success:function(data){
    			if(data == 0){
    				console.log("아이디 없음");
    				alert("사용하실수 있는 아이디입니다.");
    			} else{
    				console.log("아이디 있음");
    				alert("중복된 아이디가 존재합니다.");
    			}
    		},
    		error:function(){
    			console.log("에러");
    		}
    	});
    }
    	
    
    
    $(".btn-success").on("click",function(e){
    	
    	
    	e.preventDefault();
    	
    	$("form").submit();
    })
    
   
    
    </script>
    
    <script>
     $(document).ready(function(){
    	 
    	 // 모든 공백 체크 정규식
    	 var empJ = /\s/g;
    	 // 아이디 정규식
    	 var idJ = /^[a-z0-9]{4,12}$/; // a-z, 0-9로 시작하는 4-12자리 아이디를 만들 수 있다.
    	 // 비밀번호 정규식
    	 var pwJ = /^[A-Za-z0-9]{4,12}$/; // A-Z,a-z,0-9로 시작하는 4-12자리 비밀번호를 설정할 수 있다.
    	 // 이름 정규식
    	 var nameJ = /^[가-힣]{2,6}$/; // 가-힣. 한글로 이뤄진 문자만으로 2-6자리 이름을 적어야 한다.
    	 
    	 
    	 $("#user_id").blur(function(){
    		 if(idJ.test($('#user_id').val())){
    			 console.log('true');
    			 $("#id_check").text('');
    		 } else{
    			 console.log('false');
    			 $("#id_check").text('영어소문자와 숫자를 합쳐 4-12 자리 입력');
    			 $("#id_check").css('color','red');
    		 }
    	 })
    	 
    	 $("#pw1").blur(function(){
    		if(pwJ.test($('#pw1').val())){
    			console.log('true');
    			$("#pw1_check").text('');
    		} else{
    			console.log('false');
    			$('#pw1_check').text('숫자 or 문자로만 4-12자리 입력');
    			$('#pw1_check').css('color','red');
    		}
    	 });
    	
    	 $("#pw2").blur(function(){
    		if($("#pw1").val() != $(this).val()){
    			$("#pw2_check").text('비밀번호가 일치하지 않습니다. :(');
    			$("#pw2_check").css('color','red');
    		} else{
    			$('#pw2_check').text('');
    		}
    	 });
    	 
    	$('#name').blur(function(){
    		if(nameJ.test($("#name").val())){
    			console.log('true');
    			$('#name_check').text('');
    		} else{
    			console.log('false');
    			$('#name_check').text('이름은 한글로 2-6자리');
    			$('#name_check').css('color','red');
    		}
    	});
    	 
    	 
    	 
     });
    
    </script>
    
    
<%@include file="../includes/footer.jsp" %>    