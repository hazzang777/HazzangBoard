<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HAZZANG</title>
    
    <!-- chart.js -->
     <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">
		<sec:authentication property="principal" var="pinfo"/>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/board/list">HAZZANG</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                       <span id="count" class="badge bg-theme"></span>
                       <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    	<sec:authorize access="isAuthenticated()">
	                        <li><a href="/member/info"><i class="fa fa-user fa-fw"></i> User Profile</a>
	                        </li>
	                        <li class="divider"></li>
	                        <li><a href="/messages/msgList?targetid=${pinfo.username}"><i class="fa fa-user fa-fw"></i> Message</a>
	                        </li>
	                        <li><a href="/customLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
	                        </li>
                        </sec:authorize>
                        
                        <sec:authorize access="isAnonymous()">
                        	<li><a href="/customLogin"><i class="fa fa-sign-out fa-fw"></i>Login</a></li>
                        	<li><a href="/member/join"><i class="fa fa-sign-out fa-fw"></i>Join</a></li>
                        </sec:authorize>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                		
                    <ul class="nav" id="side-menu">
                    	<li>
                            <a href="/board/list"><i class="fa fa-dashboard fa-fw"></i>자유게시판</a>
                        </li>
                        <li>
                            <a href="/chat/page"><i class="fa fa-dashboard fa-fw"></i>실시간채팅방</a>
                        </li>
                        
                        <sec:authorize access="isAuthenticated()">
                        <c:if test="${pinfo.username eq 'admin90'}">
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 통계<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/admin/pages">월별 게시글 수</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </c:if>
                        </sec:authorize>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

       <div id="page-wrapper">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      
      <sec:authorize access="isAuthenticated()">
        <script>
        <script type="text/javascript">

        var wsUri = "ws://localhost:8090/cnt";
		var targetid = "${pinfo.username}"
        function send_message() {

            websocket = new WebSocket(wsUri);

            websocket.onopen = function(evt) {

                onOpen(evt);

            };

            websocket.onmessage = function(evt) {

                onMessage(evt);

            };

            websocket.onerror = function(evt) {

                onError(evt);

            };

        }

       

        function onOpen(evt) 

        {

           websocket.send("targetid");

        }

        function onMessage(evt) {

        		$('#count').append(evt.data);

        }

        function onError(evt) {

        }

        $(document).ready(function(){

        		send_message();

        });

        		

        

            </script>

</sec:authorize>

  