<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@include file="../includes/header.jsp" %>




<sec:authentication property="principal" var="pinfo" />

<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">USERMESSEGE</h3>
                    </div>
                    <div class="panel-body">
                        <form id="userForm" method="get" action="/member/delete" role="form">
                        
                            <fieldset>
                                <div class="form-group">
                                	<label>아이디</label>
                                    <input class="form-control" name="id" value="${pinfo.username}"  type="text" readonly="readonly">
                                </div>

                                <input type="submit" class="btn btn-danger" value="회원탈퇴" />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<sec:authorize access="isAuthenticated()">
<script>
	
	var formObj = $("#userForm");
	$(".btn-danger").on("click",function(e){
		e.preventDefault();
		if(confirm("탈퇴하시겠습니까?(동의하시면 확인)") == true){
			formObj.submit();
			return;
		} else{
			return;
		}
	})

</script>
</sec:authorize>


<%@include file="../includes/footer.jsp" %> 