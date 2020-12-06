<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
<%@include file="../includes/header.jsp" %>

<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Message</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           받은 메시지
                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table  class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>보낸사람</th>
                                        <th>보낸날짜</th>
                                        <th>읽은상태</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${rlist}" var="rboard">
                                <tr>
                                	<td><c:out value="${rboard.mid}" /></td>
                                	<td><a class="move" href='/messages/get?mid=${rboard.mid}&&id=${rboard.sender}'>
                                	<b>[<c:out value="${rboard.sender}" />]</b></a></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rboard.senddate}" /></td>
                                	<td><c:out value="${rboard.reads}" /></td>
                                </tr>
                                </c:forEach>
                          
               </table>
               </div>
               </div>
               </div>
               </div>
               
               <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           보낸 메시지
                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table  class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>받은사람</th>
                                        <th>보낸날짜</th>
                                        <th>읽은상태</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${slist}" var="sboard">
                                <tr>
                                	<td><c:out value="${sboard.mid}" /></td>
                                	<td><a class="move" href='<c:out value="${sboard.mid}"/>'>
                                	<b>[<c:out value="${sboard.targetid}" />]</b></a></td>
                                	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${sboard.senddate}" /></td>
                                	<td><c:out value="${sboard.reads}" /></td>
                                	<td><a id="del" class="btn btn-danger" role="button" href="/messages/remove?mid=${sboard.mid}&&id=${sboard.sender}">삭제</a></td>
                                </tr>
                                </c:forEach>
                          
               </table>
               </div>
               </div>
               </div>
               </div>
               
        
        <%@include file="../includes/footer.jsp" %>           