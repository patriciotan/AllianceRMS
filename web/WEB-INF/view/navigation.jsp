<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%      response.setDateHeader("Expires", 0);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link href='<c:url value="/res/css/bootstrap.css"/>' type="text/css" rel="stylesheet">
        <link href='<c:url value="/res/sweetalert-master/lib/sweet-alert.css"/>' type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href='<c:url value="/res/css/dataTables.css"/>'>
        <link type="text/css" rel="stylesheet" href='<c:url value="/res/css/view.css"/>'>
        <link rel="shortcut icon" href='<c:url value="/res/images/mini_alliance.png"/>'>
        <link type="text/css" rel="stylesheet" href='<c:url value="/res/css/sweet-alert.css"/>'>
        
        <script src='<c:url value="/res/js/jquery.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/bootstrap.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/canvasjs.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/tableExport.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/jquery.base64.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/sprintf.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/jspdf.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/base64.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/sweetalert-master/lib/sweet-alert.js"/>' type="text/javascript"></script>
        <script src='<c:url value="/res/js/jquery.dataTables.js"/>' type="text/javascript"></script>    
        <script src='<c:url value="/res/js/sweet-alert.js"/>' type="text/javascript"></script>    
    </head>
    <body>
        
        <div class="outer">
        <div class="middle">
        <div class="inner">

<div class="navbar navbar-custom navbar-inverse navbar-fixed-top">
    <div class="containernav">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <form id="logoutform" action='<c:url value="logoutSubmit"/>' method="post">
        <div class="collapse navbar-collapse">
            <a class="pull-left" style=" margin-top: 6px;" href="#"><img src="<c:url value="/res/images/asi_logo_white.png"/>" height="40px" alt="alliance logo" /></a>
            <ol class="nav navbar-nav">
                <li id="0"><a href="dashboard">Dashboard</a></li>
                <li id="1"><a href="outlook">Project Outlook</a></li>
                <li id="2"><a href="pSummary">Project Summary</a></li>
                <li id="3"><a href="rSummary">Resource Summary</a></li>
            </ol>
            <ol class="nav navbar-nav navbar-right" style="margin-right: -124px">
                <li class="dropdown navbar-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${sessVar} <b class="caret"></b></a>
                    <ol class="dropdown-menu">
                        <li><a id="logoutlink" href="#" style="color: graytext">Sign out</a></li>
                    </ol>
                </li>
            </ol>
        </div><!--/.nav-collapse -->
        </form>
    </div><!--/.container -->
</div>
                    
<script type="text/javascript">
    $("a#logoutlink").click(function()
    {
        $("#logoutform").submit();
        return false;
    });
</script>
