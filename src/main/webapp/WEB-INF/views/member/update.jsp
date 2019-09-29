<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function memberUpdate() {
		updateForm.submit();
	}
	//ajax로 비밀번호 입력 확인하기
	function passwordCheck() {
		$.ajax({
			type : "post",
			url : "passwordCheck",
			data : {
				"password" : updateForm.password.value,
				"userId" : updateForm.userId.value
			},
			dataType : "text",
			success : function(data) {
				if (data == "1") {
					alert("비밀번호가 일치합니다.");
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error : function() {
				alert("ajax 실패");
			}
		});
	}
</script>
</head>
<body>
	<h1>회원 정보 수정</h1>
	<form action="updateProcess" id="up" name="updateForm" method="post">
		<table>
			<tr>
				<td>이름 : <input type="text" id="name" name="name"
					required="required">
				</td>
			</tr>
			<tr>
				<td>주소 :<input type="text" id="address" name="address"
					required="required">
				</td>
			</tr>
			<tr>
				<td>이메일 :<input type="text" id="email" name="email"
					required="required">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호 :<input type="text" id="phone" name="phone"
					required="required">
				</td>
			</tr>
			<td><input type="submit" value="수정하기">
				<input type="button" onclick="back()" value="뒤로"></td>
			</tr>
		</table>
	</form>
	<script>
		function back() {
			history.back();
		}
	</script>
</body>
</html>