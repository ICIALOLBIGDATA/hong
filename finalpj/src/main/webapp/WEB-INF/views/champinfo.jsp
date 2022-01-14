<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">

a{
text-decoration: none; 
color: inherit;
}
h3{
text-align: center;
}
#champimg{
text-align: center;
width: 1000px;
margin: auto;
}
#champimg div img{
width: 20px;
height: 20px;
}
#rune_one, #rune_two{
text-align: center;
}
#rune_two{
display:none;
}
.runeone, .runetwo{
border-radius : 30%;
width:30px;
object-fit: cover;
}


.goodsynergy, .badsynergy{
border-radius : 30%;
width:30px;
object-fit: cover;
}
.goods, .bads{
margin-bottom: 5px;
margin-right: 5px;
display: inline-block;
}
.gs, .bs{
border: solid 1px black;
width: 180px;
height: 75px;
text-align: center;
}
.main, .sub{
display: flex;
flex-wrap: wrap;
width: 1000px;
justify-content: space-between;
margin: auto;
}
.sub_synergy{
width: 1000px;
}
#goodsynergy, #badsynergy{
display: flex;
flex-wrap: wrap;
border: solid 1px;
border-collapse: collapse;
}

</style>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<body>
<h1>테스팅용 DB긁어오기</h1>

<div id="champimg"><h3>챔피언</h3></div>
<div id="rune_title"></div>
<div class = "main">
	<div id="rune_one" ><h3>룬 1</h3></div>
	
	<div id="rune_two" ><h3>룬 2</h3></div>
	
	<div id="spell"><h3>스펠</h3></div>
	
	<div id="starting_item_one"><h3>시작 아이템 1,2</h3></div>
	
	<div id="main_item_build"><h3>메인 아이템</h3></div>
	
	<div id="boots"><h3>신발</h3></div>
	
	<div id="skill"><h3>스킬</h3></div>
</div>

<div class ="sub">
	<div id="goodsynergy"><div class="sub_synergy"><h3>GOOD 팀 조합</h3></div></div>
	<div id="badsynergy"><div class="sub_synergy"><h3>BAD 팀 조합</h3></div></div>
</div>

</body>

<script type="text/javascript">
let champinfo = ${champinfo}

let champimg = champinfo.champ_img;
let tier = champinfo.tier;
let position = champinfo.position;
let champname = champinfo.champname;
let runeone = champinfo.rune_img_one.split("|");
let runetwo = champinfo.rune_img_two.split("|");
let spell = champinfo.spell_img.split("|");
let staringitemone = champinfo.starting_item_img_one.split("|");
let staringitemtwo = champinfo.starting_item_img_two.split("|");
let mainitem = champinfo.main_item_build_img.split("|");
let boots = champinfo.boots_img.split("|");
let skill = champinfo.skill_img.split("|");
let goodsynergy = champinfo.synergy_tier.split(",")[0].split("|");
let badsynergy = champinfo.synergy_tier.split(",")[1].split("|");
let goodcombinationscore = champinfo.combination_score.split(",")[0].split("|");
let badcombinationscore = champinfo.combination_score.split(",")[1].split("|");
let goodksynergy = champinfo.k_synergy.split(",")[0].split("|");
let badksynergy = champinfo.k_synergy.split(",")[1].split("|");

// 챔피언
str = "<img class='champimg' src="+champimg+">";
switch (tier){
	case "1":
		str += "<div>"+champname+"</div><div>티어 : <img src='./image/1.jpg'></div><div>역할군 : "+position+"</div>"
		break;
	case "2":
		str += "<div>"+champname+"</div><div>티어 : <img src='./image/2.jpg'></div><div>역할군 : "+position+"</div>"
		break;
	case "3":
		str += "<div>"+champname+"</div><div>티어 : <img src='./image/3.jpg'></div><div>역할군 : "+position+"</div>"
		break;
	case "4":
		str += "<div>"+champname+"</div><div>티어 : <img src='./image/4.jpg'></div><div>역할군 : "+position+"</div>"
		break;
	case "5":
		str += "<div>"+champname+"</div><div>티어 : <img src='./image/5.jpg'></div><div>역할군 : "+position+"</div>"
		break;
}
$("#champimg").append(str);

// 룬 1
for (let i=0; i<(runeone.length-2); i++){
	if (i == 8){
		str = "<img class='runeone' src="+runeone[10]+">";
		str += "<img class='runeone' src="+runeone[9]+">";
		str += "<img class='runeone' src="+runeone[8]+">";
		$("#rune_one").append(str);
		$("#rune_one").append("<br><span class ='rune_one'>PickRate: "+runeone[11]+" / WinRate:"+runeone[12]+"</span>");
		break;
	}
	if(i==1){
		$("#rune_title").append("<img id='rune_one_main' class='rune_one_title' src="+runeone[1]+">")
	}
	if(i==5){
		$("#rune_title").append("<img id='rune_one_sub' class='rune_title'src="+runeone[5]+">")
	}
	str = "<img class='runeone' src="+runeone[i]+">";
	$("#rune_one").append(str);
	if (i == 0 || i == 1 || i == 4 || i == 5 || i == 7){
		$("#rune_one").append("<br>");	
	}
}
// 룬 2
for (let i=0; i<(runetwo.length-2); i++){
	if (i == 8){
		str = "<img class='runeone' src="+runetwo[10]+">";
		str += "<img class='runeone' src="+runetwo[9]+">";
		str += "<img class='runeone' src="+runetwo[8]+">";
		$("#rune_two").append(str);
		$("#rune_two").append("<br><span class ='rune_two'>PickRate: "+runetwo[11]+" / WinRate:"+runetwo[12]+"</span>");
		break;
	}
	if(i==1){
		$("#rune_title").append("<img id='rune_two_main' class='rune_two_title' src="+runetwo[1]+">")
	}
	if(i==5){
		$("#rune_title").append("<img id='rune_two_sub' class='rune_two_title' src="+runetwo[5]+">")
	}
	str = "<img class='runetwo' src="+runetwo[i]+">";
	$("#rune_two").append(str);
	if (i == 0 || i == 1 || i == 4 || i == 5 || i == 7){
		$("#rune_two").append("<br>");	
	}
}

// 스펠
for (let i=0; i<2; i++){
	str = "<img class='spell' src="+spell[i]+">";
	$("#spell").append(str);
	if (i == 1){
		$("#spell").append("<span class ='spellpw'>PickRate: "+spell[2]+" / WinRate:"+spell[3]+"</span>");
		$("#spell").append("<br>");
		for (let i=4; i<6; i++){
			str = "<img class='spell' src="+spell[i]+">";
			$("#spell").append(str);
			if (i == 5){
				$("#spell").append("<span class ='spellpw'>PickRate: "+spell[6]+" / WinRate:"+spell[7]+"</span>");
				$("#spell").append("<br>");
			}
		}
	}
}

// 시작 아이템 1
for (let i in staringitemone){
	if (staringitemone[i].indexOf("%") == -1){
		str = "<img class='staringitemone' src="+staringitemone[i]+">";
		$("#starting_item_one").append(str);
	}
	else{
		$("#starting_item_one").append("<span class ='siopw'>PickRate: "+staringitemone[i]+" / WinRate:"+staringitemone[staringitemone.length -1]+"</span>");
		$("#starting_item_one").append("<br>");
		break;
	}
}
// 시작 아이템 2
for (let i in staringitemtwo){
	if (staringitemtwo[i].indexOf("%") == -1){
		str = "<img class='staringitemtwo' src="+staringitemtwo[i]+">";
		$("#starting_item_one").append(str);
	}
	else{
		$("#starting_item_one").append("<span class ='siopw'>PickRate: "+staringitemtwo[i]+" / WinRate:"+staringitemtwo[staringitemtwo.length -1]+"</span>");
		break;
	}
}




// 메인 아이템
for (let i=0; i<3; i++){
	str = "<img class='mainitem' src="+mainitem[i]+">";
	$("#main_item_build").append(str);
	if (i == 2){
		$("#main_item_build").append("<span class ='mainitempw'>PickRate: "+mainitem[3]+" / WinRate:"+mainitem[4]+"</span>");
		$("#main_item_build").append("<br>");
		for (let j=5; j<8; j++){
			str = "<img class='mainitem' src="+mainitem[j]+">";
			$("#main_item_build").append(str);
			if (j == 7){
				$("#main_item_build").append("<span class ='mainitempw'>PickRate: "+mainitem[8]+" / WinRate:"+mainitem[9]+"</span>");
				$("#main_item_build").append("<br>");
				for (let k=10; k<13; k++){
					str = "<img class='mainitem' src="+mainitem[k]+">";
					$("#main_item_build").append(str);
					if (k == 12){
						$("#main_item_build").append("<span class ='mainitempw'>PickRate: "+mainitem[13]+" / WinRate:"+mainitem[14]+"</span>");
					}
				}
			}
		}
	}
}

// 신발
if (champname != "카시오페아"){
	if (boots[0].indexOf("NoShoes") == -1){
		str = "<img class='boots' src="+boots[0]+">";
		$("#boots").append(str);
		$("#boots").append("<span class ='bootspw'>PickRate: "+boots[1]+" / WinRate:"+boots[2]+"</span>");
		$("#boots").append("<br>");
		if(boots[3].indexOf("NoShoes") == -1){
			str = "<img class='boots' src="+boots[3]+">";
			$("#boots").append(str);
			$("#boots").append("<span class ='bootspw'>PickRate: "+boots[4]+" / WinRate:"+boots[5]+"</span>");
			$("#boots").append("<br>");
		}else{
			str = boots[3];
			$("#boots").append(str+" - ");
			$("#boots").append("<span class ='bootspw'>PickRate: "+boots[4]+" / WinRate:"+boots[5]+"</span>");
			$("#boots").append("<br>");
		}
	}
	else{
		str = boots[0];
		$("#boots").append(str+" - ");
		$("#boots").append("<span class ='bootspw'>PickRate: "+boots[1]+" / WinRate:"+boots[2]+"</span>");
		$("#boots").append("<br>");
		str = "<img class='boots' src="+boots[3]+">";
		$("#boots").append(str);
		$("#boots").append("<span class ='bootspw'>PickRate: "+boots[4]+" / WinRate:"+boots[5]+"</span>");
		$("#boots").append("<br>");
	}
}
else{
	$("#boots").append("카시오페아는 신발을 신지 않습니다 !")
}

// 스킬
for (let i in skill){
	if (skill[i].indexOf("%") == -1){
		str = "<img class='skill' src="+skill[i]+">";
		if (i != 2){
			$("#skill").append(str+"->");
		}else{
			$("#skill").append(str);
		}
	}
	else{
		$("#skill").append("<span class ='skillpw'>PickRate: "+skill[i]+" / WinRate:"+skill[skill.length -1]+"</span>");
		break;
	}
}

// 팀 조합
for (let i in goodsynergy){
	str = "<div class='goods'>"
	str += "<div class='gs'>"
	str += "<a href=./champinfo?championname="+goodsynergy[i]+">";
	if (goodsynergy[i] != "FiddleSticks"){
		str += "<img class='goodsynergy' src=http://ddragon.leagueoflegends.com/cdn/12.1.1/img/champion/"+goodsynergy[i]+".png><br>";
	}else{
		str += "<img class='goodsynergy' src=http://ddragon.leagueoflegends.com/cdn/12.1.1/img/champion/Fiddlesticks.png><br>";
	}
	str += "<span>"+goodksynergy[i]+"</span><br>";	
	str += "<span>"+goodcombinationscore[i]+"</span>";
	str += "</div>"
	str += "</div>"
	$("#goodsynergy").append(str);
}

for (let i in badsynergy){
	str = "<div class='bads'>"
	str += "<div class='bs'>"
	str += "<a href=./champinfo?championname="+badsynergy[i]+">";
	if (badsynergy[i] != "FiddleSticks"){
		str += "<img class='badsynergy' src=http://ddragon.leagueoflegends.com/cdn/12.1.1/img/champion/"+badsynergy[i]+".png><br>";
	}else{
		str += "<img class='badsynergy' src=http://ddragon.leagueoflegends.com/cdn/12.1.1/img/champion/Fiddlesticks.png><br>";
	}
	str += "<span>"+badksynergy[i]+"</span><br>";
	str += "<span>"+badcombinationscore[i]+"</span>";
	str += "</div>"
	str += "</div>"
	$("#badsynergy").append(str);
}
</script>
<script type="text/javascript">

$('#rune_one_main').click(function(){
	$('#rune_one').attr('style','display:inline');
	$('#rune_two').attr('style','display:none');
})

$('#rune_two_main').click(function(){
	$('#rune_two').attr('style','display:inline');
	$('#rune_one').attr('style','display:none');
})
</script>

</html>