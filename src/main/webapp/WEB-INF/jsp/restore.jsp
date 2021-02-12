<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Forget Password page</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${contextPath}/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<!--<link rel="stylesheet" type="text/css" href="css/util.css">-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="${contextPath}/resources/images/img-01.png" alt="IMG">
				</div>
<%--				<form:form method="POST" class="login100-form validate-form" action="#">--%>
				<form method="post"  class="login100-form validate-form" action="#">
					<span class="login100-form-title">
						Forget Password
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
<%--						<input  class="input100" type="text" name="username" placeholder="Email">--%>
<%--							<form:input type="text" path="username" class="input100" name="username" placeholder="Email" autofocus="true" ></form:input>--%>
						<input name="username" type="text" class="input100"  placeholder="Email" autofocus="true">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<p>${usernameError}</p>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							Get New Password
						</button>
					</div>
					<div class="text-center p-t-12">
						
						<a class="txt2" href="/">
							Выход
						</a>
					</div>
<%--				</form:form>--%>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="${contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>