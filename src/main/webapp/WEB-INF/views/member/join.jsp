<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>회원가입</title>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script >
	function validate() {
		var re = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;//아이디와 패스워드 가 적합한지 검사할 정규식
		var re2 = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // 이메일 정규식
		var re3 = /^[가-힣]{2,4}$/; // 이름 정규식
		var re4 = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰 번호 정규식
		var re5 =/^(19[0-9][0-9]|20\d{2}).(0[0-9]|1[0-2]).(0[0-9]|[1-2][0-9]|3[0-1])$/; //생년월일 정규식

		var userId = document.getElementById("userId");
		var password = document.getElementById("password");
		var email = document.getElementById("email");
		
		if (!join.userId.value.match(re)) {
			alert("아이디를 정확하게 입력해 주세요");
			return false;
		}
		if (join.userId.value == "") {
			alert("아이디를 입력해 주세요")
			return false;
		}
		if (!join.userId.value.match(re)) {
			alert("비밀번호를 정확하게 입력해 주세요");
			return false;
		}
		if (!join.userId.value.match(re)) {
			alert("비밀번호를 정확하게 입력해 주세요");
			return false;
		}
		if (join.password.value != join.repassword.value) {
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			join.password.value = "";
			join.repassword.value = "";
			join.password.focus();
			return false;
		}
		if (join.password.value == "") {
			alert("password 를 입력해 주세요!");
			return false;
		}

		if (join.email.value == "") {
			alert("이메일을 입력해 주세요")
			return false;
		}

		if (!join.email.value.match(re2)) {
			alert("이메일을 정확하게 입력해 주세요.")
			return false;
		}

		if (join.name.value == "") {
			alert("이름은 입력해 주세요");
			return false;
		}
		if (!join.name.value.match(re3)) {
			alert("이름을 정확하게 입력해 주세요.");
			return false;
		}
		
		if (!join.phone.value.match(re4)) {
			alert("핸드폰 번호를 정확하게 입력해 주세요.");
			return false;
		}

		if (!join.birth.value.match(re5)) {
			alert("생년월일 을 정확하게 입력해 주세요.");
			return false;
		}
	}
	
	function idCheck(){
			console.log("idCheck 호출")
			console.log("아이디 입력 값 : "+join.userId.value)
		$.ajax({
			type :"post",
			url :"idCheck.do",
			data : {"userId" : join.userId.value},
			dataType : "text",	
			success : function(data){	
				if(data=="1"){
					alert("이 아이디는 사용 가능합니다.");
				}else if(data=="0"){	
					alert("이 아이디는 사용  불가능합니다.");
				}else if(data=="."){
					alert("아이디를 입력해 주세요")
				}
			},
			error : function(){     //ajax가 제대로 안됐을 때 .
				alert("아이디 중복 확인 ajax 실행 실패");
			}
		});
	}
</script>
 <!-- Bootstrap CSS -->
    <link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">  
<style>
.control-group{
	margin-left: 44%;
}
</style>

<div class="jumbotron">
<form action="joinProcess.do" name="join" method="post" role="form" autocomplete="off" onsubmit="return validate();" runat="server" class="form-horizontal">
		
		<h1 align="center">회원 가입 </h1><br>
	<div>	
		<div class="control-group" name="control-group">	
				<label for="userId" class="control-label">아이디 :</label>
			<div class="controls">		
				<input type="text" class="input-medium" id="userId" name="userId" value="${memberDto.userId }" placeholder="닉네임을 쓰세요"/>
				 	<button type="button" class="idCheck" onclick="idCheck()" >중복 확인</button>
			</div>
		</div>		
   </div>	
		<div class="control-group" name="control-group">
			<label for="password" class="control-label">비밀번호 :</label>
			<div class="controls">
				<input type="password" class="input-medium"  id="password" name="password" placeholder="비밀 번호"/>
			</div>
		</div>
		
		<div class="control-group" name="control-group">			
			<label for="repassword" class="control-label">비밀번호 확인 :</label>
			
			<div class="controls">
				<input type="password" class="input-medium"  id="repassword" name="repassword"/>
			</div>
		</div>	
		
		<div class="control-group" name="control-group">			
			<label for="name" class="control-label">이름 :</label>
			<div class="controls">
				<input type="text" class="input-medium"  id="name" name="name"/>
			</div>	
		</div>
		
		<div class="control-group" name="control-group">			
			<label for="address" class="control-label">주소 :</label>
			<div class="controls">
				<input type="text" class="input-large"  id="address" name="address"/>
		    </div>
		</div>	
		
		<div class="control-group" name="control-group">		
			<label for="phone" class="control-label">전화번호 :</label>
			<div class="controls">
				<input type="text" class="input-medium"  id="phone" name="phone" placeholder="EX) 010-(xxx/xxxx)-xxxx"/>
			</div>	
		</div>	
		
		<div class="control-group" name="control-group">		
			<label for="email" class="control-label">이메일 :</label>
			<div class="controls">
				<input type="text" class="input-large"  id="email" name="email"/>
			</div>
		</div>	
		
		<div class="control-group" name="control-group">	
			<label for="birth" class="control-label">생년월일 :</label>
			<div class="controls">
				<input type="text" class="input-medium"  id="birth" name="birth" placeholder="EX) YYYY-MM-DD"/>
			</div>
		</div>		
		
		<div class="control-group" name="control-group">
		<input type="submit" value="가입"/>
		</div>
	
	</form>
</div>
</body>
</html>