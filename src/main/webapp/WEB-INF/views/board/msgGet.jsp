<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@include file="../includes/header.jsp" %>


<h1>getJSP상세페이지입니다.</h1>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				
				
					<div class="form-group">
						<label>번호</label><input class="form-control" 
						value='<c:out value="${get.mid}" />' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>보낸사람</label><input class="form-control" 
						value='<c:out value="${get.sender}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>메시지내용</label>
						<textarea class="form-control" cols="20" rows="3" name="content"  readonly="readonly">
							<c:out value="${get.message}"/>
						</textarea>
					</div>
					
			
			
					<button data-oper='list' class="btn btn-info">List</button>

</div>
</div>
</div>
</div>


<script>
	$(".btn-info").on("click",function(){
		self.location="/messages/msgList";
	});

</script>













<%@include file="../includes/footer.jsp" %>    