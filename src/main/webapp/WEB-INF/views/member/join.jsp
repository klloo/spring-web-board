<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file = "../includes/header.jsp" %>
<%@include file = "../includes/top_menu.jsp" %>

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css?after">
<!--===============================================================================================-->
<style>
	.btn {
        display: flex;
        justify-content: center;
        padding-top:0%;
        margin-left:15%;
    }
    .btn > a {
       	margin: 20%;
        color: grey;
        text-decoration=none;
    }
    .btn > div {
        margin: 20%;
    }
    .chk_btn {
        cursor:pointer;
    }
    .read_only{ display: none;}
</style>
</head>
<body>

		<!-- Page Header-->
        <header class="masthead" style="background-image: url('/resources/images/cafe_image.jpeg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>JOIN</h1>
                        </div>
                    </div>
                </div>
            </div>
        </header>
		<div class="container" style="display: flex;justify-content: center;">
			<br/><br/><br/><br/><br/>
			<div class="wrap-login100">
			
	    			<form class="login100-form validate-form" id="loginForm" action="/login" method="post">
	    				<input type="hidden" id="isCheckID" value="0">
	        			<div class="wrap-input100 validate-input m-b-26">
	          				<span class="label-input100">ID</span>
	            			<input type="text" class="input100" id="id">
	            			<span class="focus-input100"></span>
	        			</div>
	        			<div class="chk_btn m-b-26">
							<div class="txt1" id="btn-chk">
								<span>&nbsp;&nbsp;</span>ID 중복 체크
							</div>
						</div>
	        			<div class="wrap-input100 validate-input m-b-26">
	            				<span class="label-input100">Password</span>
	            				<input type="password" class="input100" id="password">
	            				<span class="focus-input100"></span>
	        			</div>
	        			<div class="wrap-input100 validate-input m-b-100">
	          				<span class="label-input100">Name</span>
	            			<input type="text" class="input100" id="name">
	            			<span class="focus-input100"></span>
	        			</div>
	        			<div class="btn validate-input">
            				<a href="/board/list" class="cancel_btn" role="button" >CANCEL</a>
           		 			<div class="join_btn" id="btn-join">JOIN</div>
        				</div>
	    			</form>

	    			
        			<br/><br/><br/><br/><br/>
			</div>
		</div>

<%@include file = "../includes/footer.jsp" %>

        

        