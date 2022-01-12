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

<body>
 
 


<h1>test222</h1>	

<form action="http://127.0.0.1:5000/tospring" method="GET"  target="param">
1.자신팀의 총 킬:<input type="text" name="myteam_Kills"><br>
2.자신팀의 총 데스:<input type="text" name="myteam_Deaths" ><br>
3.자신팀의 총 어시스트:<input type="text" name="myteam_Assists" ><br>
4.자신팀의 총 골드:<input type="text" name="myteam_Golds" ><br>
5.상대팀의 총 킬:<input type="text" name="vsteam_Kills" ><br>
6.상대팀의 총 데스:<input type="text" name="vsteam_Deaths" ><br>
7.상대팀의 총 어시스트:<input type="text" name="vsteam_Assists" ><br>
8.상대팀의 총 골드:<input type="text" name="vsteam_Golds"><br>
9.자신의 골드:<input type="text" name="my_golds"><br>
<input id=test type="submit" value="확인">
</form> 

<iframe id="if" name="param"></iframe>
<script>
    function ifun(msg){
        alert(msg);
    }
</script>
	

</body>
</html>