<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/jquery.serializeObject.js"></script>

<body>
	<h1>joinFrm.jsp-회원가입</h1>
	<form action="memberjoin" name="joinFrm" method="post">
		<table>
			<tr>
				<td colspan="2" class="subject">회원가입</td>
			</tr>
			<tr>
				<td width="100">ID</td>
				<td><input type="text" id="id" name="m_id"> <!-- bean에 써있는거랑 맞춰줘야함  -->
				<input type="button" id="checkId" value="중복검사"/>
					<div id="result"></div>
				</td>
			</tr>
			<tr>
				<td width="100">PW</td>
				<td><input type="text" id="pw" name="m_pwd"></td>
			</tr>
			<tr>
				<td width="100">NAME</td>
				<td><input type="text" id="name" name="m_name"></td>
			</tr>
			<tr>
				<td width="100">BIRTH</td>
				<td><input type="text" id="birth" name="m_birth"></td>
			</tr>
			<tr>
				<td width="100">ADDR</td>
				<td><input type="text" id="addr" name="m_addr"></td>
			</tr>
			<tr>
				<td colspan="2" class="subject"><input type="submit"
					value="회원가입"></td>
			</tr>
		</table>
	</form>

</body>

<script>
$("#checkId").on('click', function(){
	if($('#id').val()!=''){
		$.ajax({
			type:'get', //post가능
			url:'member/userid',
			data: 'm_id='+$('#id').val(), //{m_id:$('#id').val(),,,,}
		    dataType:'json',//'html', //사용할수 있는 아이디 입니다.
			success: function(data){
				$('#result').html(data).css('color','blue');
			},
			error:function(err){
				console.log(err);
				$('#result').html(err.responseText).css('color','red');
				console.log("err.status:", err.status);
			}
		});//ajax End
	}
}); //on End
</script>

</html>