<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#headerBtn").click(function(){
		location.href="productList.do";
	});
});
	function mysubmit(sub){
		if(sub==1){
		 document.join.action="loginProcess.do";
		 }
		if(sub==2){
	 	document.join.action="join.do";
		}
		document.join.submit();
	};
</script>
    <!-- Bootstrap CSS -->
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.control-group{
	margin-left: 41%;
}
html{
	padding-top : 10%;
}
</style>
</head>
<body class="container">
<div class="jumbotron">
		<form id="join" name="join" method="post" onsubmit="return validate();" runat="server" class="form-horizontal">
  			<div><h1 align="center" id="headerBtn">한솔이네 야채 가게</h1></div>
  			<div class="control-group" name="control-group">
    			<label for="userId">아이디 : </label>
    			<div class="controls">	
    				<input type="text" id="userId" name="userId" placeholder="ID입력" ><br>
 				</div>   		
    		</div>
    		<div class="control-group" name="control-group">
    			<label for="password">비밀번호 :</label>
    			<div class="controls">	
    				<input type="password" id="password" name="password" placeholder="password입력" >
 				</div>		  
 		   </div>
 		 <hr>  
  	<div class="control-group" name="control-group">
  		<input type="button" value="로그인" onclick=mysubmit(1)>
  		<input type="button" value="회원가입" onclick=mysubmit(2)>
  	</div>
</div>		
</form>
</body>
</html>