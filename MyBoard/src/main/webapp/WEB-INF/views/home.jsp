<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- IE 사용하기 위해선 -->
<% response.setStatus(200); %>

<html>
<head>
<title>Home</title>

</head>

<script type="text/javascript">
	window.onload = function() {
		let chk = '${check}';
		if (chk === '1') {
			alert('회원가입 성공');
		} else if (chk === '2') {
			alert('로그인 실패');
		}
	};
</script>

<body>

<h1>Home.jsp -로그인 페이지--</h1>
	<form action="access" method="post">
		<table border="1">
			<tr>
				<td colspan="2" align="center" bgcolor="skyblue">로그인</td>
			</tr>
			<tr>
				<td><input type="text" name="m_id"></td>
				<td rowspan="2"><button>로그인</button></td>
			</tr>
			<tr>
				<td><input type="text" name="m_pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="skyblue">com.board.icia</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="joinform">회원가입</a></td>
			</tr>
		</table>
	</form>
	
</body>


</html>
