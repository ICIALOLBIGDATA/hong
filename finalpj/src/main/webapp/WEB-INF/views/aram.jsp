<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

*, *:before, *:after {-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;margin:0;padding:0}
body{line-height:1.5;font-family:sans-serif;text-transform:uppercase;font-size:16px;color:#fff;overflow: hidden;margin: 0;}
a{text-decoration:none;color:#fff}
#header{background:#1E262D;width:100%;position:relativel}
#header:after{content:"";clear:both;display:block}
.search{float:right;padding:30px}
.logo{float:left;padding:16px 0 16px;font-weight: bold;}
.logo a{font-size:28px;display:block;padding:0 0 0 20px}
nav{float:right;}
nav>ul{float:left;position:relative}
nav li{list-style:none;float:left}
nav li a{float:left;padding:25px}
nav li a:hover{background:#2C3E50}
nav li ul{display:none}
nav li:hover ul{display:inline}
nav li li{float:none}


nav li li a{float:none;color:#333;display:block;padding:8px 10px;border-radius:3px;font-size:13px}
nav li li a:hover{background:#bdc3c7;background:#FAFBFB}
.mega-col{width:25%;float:left}

@media only screen and (max-width: 1170px) {
  nav >ul>li >a{padding:35px 15px}
}
@media only screen and (min-width: 960px) {
  nav{display:block!important}
}
@media only screen and (max-width: 959px) {
  nav{display:none;width:100%;clear:both;float:none;max-height:400px;overflow-y:scroll}
  nav{padding:10px}
  nav ul{float:none}
  nav li{float:none}
  nav ul li a{float:none;padding:8px;display:block}
  #header nav ul ul{display:block;position:static;background:none;border:none;padding:0}
  #header nav a{color:#fff;padding:8px}
  #header nav a:hover{background:#fff;color:#333;border-radius:3px}
  #header nav ul li li a:before{content:"- "}
  .mega-col{width:100%}
}

.logo2 {
  position: absolute;
  width: 100%;
  top: 10%;
  left: 00%;
    padding-top: 100px;
    font-size: 150px;
    font-weight: bold;
    display: flex;
    justify-content: center;
}

#link{
width: 100%; 
height: 50px;
padding-top: 25px;
}

#champion{
color:white;
height:500px;


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
height: 500px;



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
justify-content: center;
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
color: white;
}
.th_rpt{
width:50px;
height: 50px;
text-align: center;

}
.th_rpt img{
width:32px;
height: 32px;
border-radius:18px;
}

.tier {
color:white;
}

table#champ_table th, td {
border-bottom: inset;
}

.cl:hover{transform:translate(-5px,-5px);
}

.cl {
transition:0.5s;
}

#video {
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: 700px;
     height: 800px;
     z-index: -1;
     overflow: hidden;
     
}



.type1::-webkit-scrollbar{
    width: 6px;
}

.type1::-webkit-scrollbar-thumb{
    height: 17%;
    background-color: rgba(255,255,255,1);
    /* 스크롤바 둥글게 설정    */
    border-radius: 10px;    
}

.type1::-webkit-scrollbar-track{
    background-color: rgba(0,0,0,0);
}


 .scroll{
   
    padding: 0px 13px 0px 13px;
    overflow-y: scroll;
    height: 500px;
    box-sizing: border-box;
    color: white;
    font-family: 'Nanum Gothic';
    background-color: rgba(0,0,0,0.5);
    }


.cmplist {
width:50%;

border-radius: 0px 10px 20px 30px;


}

.cmap{
width : 40%;
}

</style>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	

<body>
    
<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="./videos/animated-freljord.mp4">

</video>


   <div id="header">
        <div class="logo">
          <a href="#">DHB.GG</a>
        </div>  
        <nav>
          
          <ul>
            <li>
              <a href="/lol"><img alt="classicicon" src="./image/classicicon.png" width="20px" height="20px">홈</a>
            </li>
            <li>
              <a href="aram"><img alt="aramicon" src="./image/aramicon.png" width="20px" height="20px">칼바람</a>
            </li>
            <li class="dropdown">
              <a href="aram"><img alt="tfticon" src="./image/tfticon.png" width="20px" height="20px">박제게시판</a>
            </li>
            <li>
              <a href="aram"><img alt="tfticon" src="./image/gg.png" width="20px" height="20px">M.L</a>
            </li>
            <li>
              <a href="login"><img alt="tfticon" src="./image/gg.png" width="20px" height="20px">LOGIN</a>
            </li>
          </ul>
          
        </nav>
       
      </div>
      
      <div class="tbox">

      </div>
      
<div id="main"> 
	
	<div class="cmplist">
	<h1>Champion List</h1>
	<div class = "scroll type1">
	<div id="champlst"></div>
	</div>
	</div>
	
	<div class="cmap" >
		<h1>Champion Tier</h1>
	
	<div class = "scroll type1">
	<div id="champion">
		
		<table id="champ_table">
			<tr class="tier">
				<th class="th_champ">챔피언</th>
				<th class="th_rpt">승률</th>
				<th class="th_rpt">픽률</th>
				<th class="th_rpt">티어</th>
			</tr>
		</table>
		
		
	</div>
	</div>
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
	str = "<tr class='cl'>"
	str += "<td class='th_champ'>"
	str += "<a href=./champinfo?champ_code="+champtierlst[i].champ_code+">";
	str += "<img class='cpimg' alt="+champtierlst[i].champname+" src="+champtierlst[i].champ_img+">";
	str += "<span style='color: white;'>"+champtierlst[i].champname+"</span></td>";
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