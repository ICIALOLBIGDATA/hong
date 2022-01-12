<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="js/jquery.serializeObject.js"></script> -->

<style>
body{
height : 100vh;
background-image: url("./image/2021010807598021218_1.jpg");
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

a{
text-decoration: none; 
}

#autoMaker{
position: absolute; width: 407px;
height: auto; background: white;
cursor:pointer;
}
#autoMaker > div{
width: 407px;
}
#autoMaker > div:hover{
background : #e6d1ff;
}
#search_area{
width: 400px;
}
#search_div{

}

</style>

<body>

<div id="link">
	<a href="/lol"><span class="s_link"><img alt="classicicon" src="./image/classicicon.png" width="30px" height="30px">홈</span></a>
	<a href="aram"><span class="s_link"><img alt="aramicon" src="./image/aramicon.png" width="30px" height="30px">칼바람</span></a>
	<a href=""><span class="s_link"><img alt="tfticon" src="./image/tfticon.png" width="30px" height="30px">박제게시판</span></a>
</div>

<div id="search_div">
    <!-- <input type="text" id='insert_target' readonly style='background: #cacaca'> -->
    <input type="text" id='search_area' placeholder="챔피언 이름을 적어주세요 !"/>
    <input type="button" id="search_champ" value="찾기">
    <div id='autoMaker'></div>
</div>
</body>

<script type="text/javascript">
$("span").hover(function(){
	$((this)).css("background-color","black")},
	
	function(){
	$((this)).css("background-color","transparent");
})

var ref = ${champ};

var isComplete = false;  //autoMaker 자식이 선택 되었는지 여부
$('#search_area').keyup(function(){
    var txt = $(this).val();
    if(txt != ''){  //빈줄이 들어오면
        $('#autoMaker').children().remove();

        ref.forEach(function(arg){
            if(arg.champname.indexOf(txt) > -1 ){
                $('#autoMaker').append(
                    $('<div>').text(arg.champname).attr({'key':arg.key})
                );		
            }
        });
        $('#autoMaker').children().each(function(){
            $(this).click(function(){
                $('#search_area').val($(this).text());
                $('#autoMaker').children().remove();	
                isComplete = true;
            });
        });			
    } else {
        $('#autoMaker').children().remove();
    }  
});
$('#search_area').keydown(function(event){
    if(isComplete) {  //autoMaker 자식이 선택 되었으면 초기화
        $('#insert_target').val('')	
    }
})

$("#search_champ").click(function(){
	let champname = $("#search_area").val()
	console.log(champname);
	location.href = "./champinfo?champname="+champname;
})

</script>

</html>