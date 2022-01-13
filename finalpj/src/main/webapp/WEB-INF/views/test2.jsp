<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
table{
 border-collapse:collapse;
 margin:auto;
 
}
.s_link{
color: white;
padding: 25px;
font-size: 30px;
}

#link{
width: 100%; 
height: 50px;
padding-top: 25px;
}

#if{
width: 50%; 
height: 50px;
padding-top: 25px;
}
#btn{
    width:100px;
    margin:auto;
    display:block;
}
</style>

<body>

 <div id="link">
	<a href="/lol"><span class="s_link"><img alt="classicicon" src="./image/classicicon.png" width="30px" height="30px">홈</span></a>
	<a href="aram"><span class="s_link"><img alt="aramicon" src="./image/aramicon.png" width="30px" height="30px">칼바람</span></a>
	<a href=""><span class="s_link"><img alt="tfticon" src="./image/tfticon.png" width="30px" height="30px">박제게시판</span></a>
</div>
 	


<h1>승리기여도 측정기</h1>	


<form action="http://127.0.0.1:5000/tospring" method="GET"  target="param">
<table border="1">
<tr>
	<td>1.자신팀의 총 킬:</td>
	<td><input type="text" name="myteam_Kills"></td>
</tr>
<tr>
	<td>2.자신팀의 총 데스:</td>
	<td><input type="text" name="myteam_Deaths" ></td>
</tr>
<tr>
	<td>3.자신팀의 총 어시스트:</td>
	<td><input type="text" name="myteam_Assists" ></td>
</tr>
<tr>
	<td>4.자신팀의 총 골드:</td>
	<td><input type="text" name="myteam_Golds" ></td>
</tr>
<tr>
	<td>5.상대팀의 총 킬:</td>
	<td><input type="text" name="vsteam_Kills" ></td>
</tr>
<tr>
	<td>6.상대팀의 총 데스:</td>
	<td><input type="text" name="vsteam_Deaths" ></td>
</tr>
<tr>
	<td>7.상대팀의 총 어시스트:</td>
	<td><input type="text" name="vsteam_Assists" ></td>
</tr>
<tr>
	<td>8.상대팀의 총 골드:</td>
	<td><input type="text" name="vsteam_Golds" ></td>
</tr>
<tr>
	<td>9.자신의 골드:</td>
	<td><input type="text" name="my_golds" ></td>
</tr>
</table>
<input type='submit' value="알아보기",id='btn'>
</form> 


<iframe id="if" name="param"></iframe>
<script>
    function ifun(msg){
        alert(msg);
    }
</script>
	

</body>
</html>