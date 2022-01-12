<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
height : 100vh;
background-image: url("./image/aram.jpg");
background-repeat : no-repeat;
background-size : cover;
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

#champion{
background-color:white;
height:680px;
overflow: scroll;
}

.cpimg{
border-radius : 30%;
width:30px;
object-fit: cover;
}

a{
text-decoration: none; 
}

.cp{
width:300px;
height:35px;
}

.cpinfoimg{
padding-right: 70px;
}
#champlst{
width: 525px;
height: 680px;
overflow: scroll;
}
}
.cpinfo{
padding-right: 10px;
padding-left: 10px;
}
.champ{
width: 84px;
height: 120px;
padding: 5px;
font-size: small;
color : white;
}
.champ span {
color: white;
}
.champimg{
width: 82px;
height: 82px;
}
#main {
width: 1250px;
display: flex;
justify-content: space-around;
}
div#main div {
display: inline-flex;
flex-direction: row;
flex-wrap: wrap;
align-content: flex-start;
justify-content: flex-start;
}
.th_champ{
width: 225px;
height: 50px;
}
.th_rpt{
width:50px;
height: 50px;
text-align: center;
}
.th_rpt img{
width:32px;
height: 32px;
}
table#champ_table th, td {
border-bottom: inset;
}

</style>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	

<body>
<div id="link">
	<a href="/lol"><span class="s_link"><img alt="classicicon" src="./image/classicicon.png" width="30px" height="30px">홈</span></a>
	<a href="aram"><span class="s_link"><img alt="aramicon" src="./image/aramicon.png" width="30px" height="30px">칼바람</span></a>
	<a href=""><span class="s_link"><img alt="tfticon" src="./image/tfticon.png" width="30px" height="30px">박제게시판</span></a>
</div>

<div id="main"> 
	<div id="champlst"></div>
	
	<div id="champion">
		<table id="champ_table">
			<tr>
				<th class="th_champ">챔피언</th>
				<th class="th_rpt">승률</th>
				<th class="th_rpt">픽률</th>
				<th class="th_rpt">티어</th>
			</tr>	
		</table>
		
		
	</div>
</div>


</body>
<script type="text/javascript">

let champlst = ${champlst}
let champtierlst = ${champtierlst}

for (let i in champlst){
	str = "<div class = 'champ'>"
	str += "<a href=./champinfo?champ_code="+champlst[i].champ_code+">";
	str += "<img class='champimg' alt="+champlst[i].champname+" src="+champlst[i].champ_img+"></a>";
	str += "<span>"+champlst[i].champname+"</span>";
	str += "</div>";
	$("#champlst").append(str);
}

for (let i in champtierlst){
	str = "<tr>"
	str += "<td class='th_champ'>"
	str += "<a href=./champinfo?champ_code="+champtierlst[i].champ_code+">";
	str += "<img class='cpimg' alt="+champtierlst[i].champname+" src="+champtierlst[i].champ_img+">";
	str += "<span style='color: black;'>"+champtierlst[i].champname+"</span></td>";
	str += "<td class='th_rpt'>"+champtierlst[i].pick+"%</td>";
	str += "<td class='th_rpt'>"+champtierlst[i].win+"%</td>";
	var num = champtierlst[i].tier
	switch (num){
		case "1": 
			str += "<td class='th_rpt'><img src='./image/1.jpg'></td>";
			break;
		case "2":
			str += "<td class='th_rpt'><img src='./image/2.jpg'></td>";
			break;
		case "3": 
			str += "<td class='th_rpt'><img src='./image/3.jpg'></td>";
			break;
		case "4":
			str += "<td class='th_rpt'><img src='./image/4.jpg'></td>";
			break;
		case "5":
			str += "<td class='th_rpt'><img src='./image/5.jpg'></td>";
			break;
		}
	str += "</tr>";
	$("#champ_table").append(str);
}

</script>

</html>