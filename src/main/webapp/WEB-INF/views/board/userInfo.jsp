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
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                	<label>아이디</label>
                                    <input class="form-control" value="${pinfo.username}"  type="text" readonly="readonly">
                                </div>

                                
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>






<%@include file="../includes/footer.jsp" %> 