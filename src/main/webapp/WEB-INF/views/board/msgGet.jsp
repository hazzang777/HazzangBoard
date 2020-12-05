<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>       
    
<%@include file="../includes/header.jsp" %>




<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<div class="panel-heading">Message Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				
				
					<div class="form-group">
						<label>번호</label><input class="form-control" name="mid"
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
					
			
			
					<button  class="btn btn-info">List</button>
					<button  class="btn btn-success">답장</button>
					<a href="/messages/remove?mid=${get.mid}&&id=${get.targetid}"  class="btn btn-danger">Delete</a>
						
					

</div>
</div>
</div>
</div>

<sec:authentication property="principal" var="pinfo" /> 
       
      <sec:authorize access="isAuthenticated()">        
               <!-- Modal -->
      <div class="modal fade" id="MsgModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="msgModalLabel">Message MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Sender</label> 
                <input class="form-control" name='sender' value='${pinfo.username}' readonly="readonly">
              </div>      
              <div class="form-group">
                <label>Targetid</label> 
                <input class="form-control receiver" name="targetid" value="${get.sender}" readonly="readonly">
              </div>
              <div class="form-group">
                <label>Message</label> 
                <textarea class="form-control" rows="3" name='message' ></textarea>
              </div>
      
            </div>
		<div class="modal-footer">
		
	        <button id='msgSendBtn' type="button" class="btn btn-primary">Send</button>
	      
	        <button id='msgCloseBtn' type="button" class="btn btn-default">Close</button>
	     </div>          
	     </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
        </sec:authorize>              

<script>
	
		
	$(".btn-info").on("click",function(){
		self.location="/messages/msgList?targetid=${get.targetid}";
	});
	
	
	
</script>

<script>
	$(".btn-success").on("click",function(){
		$("#MsgModal").modal("show");
	});
	
	$("#msgCloseBtn").on("click",function(){
			
			$("#MsgModal").modal("hide");
		});
	
	var modal = $("#MsgModal");
		var modalMsgSender = modal.find("input[name='sender']");
		var modalMsgTarget = modal.find("input[name='targetid']");
		var modalMsgMsg = modal.find("textarea[name='message']");
		
		var csrfHeaderName = "${_csrf.headerName}";
    	var csrfTokenValue = "${_csrf.token}";
		
		$("#msgSendBtn").on("click",function(){
			
			var msg = {
					targetid:modalMsgTarget.val(),
					sender:modalMsgSender.val(),
					message:modalMsgMsg.val()
			};
			console.log(msg);
			$.ajax({
				url:"/messages/",
				type:'POST',
				beforeSend: function(xhr){
	    			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	    		},
				dataType:'text',
				contentType:'application/json; charset=utf-8',
				data:JSON.stringify(msg),
				success:function(result){
					alert("메시지를 보냈습니다.");
					modal.modal("hide");
					
				}
			});
		
			
		});
		
		
</script>



<%@include file="../includes/footer.jsp" %>    