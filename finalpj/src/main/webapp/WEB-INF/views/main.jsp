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
*, *:before, *:after {-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;margin:0;padding:0}
body{line-height:1.5;font-family:sans-serif;text-transform:uppercase;font-size:16px;color:#fff;overflow: hidden;margin: 0;}
a{text-decoration:none;color:#fff}
#header{background:#1E262D;width:100%;position:relative}
#header:after{content:"";clear:both;display:block}
.search{float:right;padding:30px}
input{border:none;padding:10px;border-radius:20px}
.logo{float:left;padding:26px 0 26px;font-weight: bold;}
.logo a{font-size:28px;display:block;padding:0 0 0 20px}
nav{float:right;}
nav>ul{float:left;position:relative}
nav li{list-style:none;float:left}
nav li a{float:left;padding:35px}
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
  #menu-icon{display:inline;top:45px;cursor:pointer}
  #menu-icon.active .first{transform:rotate(45deg);-webkit-transform:rotate(45deg);margin-top:10px}
  #menu-icon.active .second{transform:rotate(135deg);-webkit-transform:rotate(135deg);position:relative;top:-9px;}
  #menu-icon.active .third{display:none}
  .search{float:none}
  .search input{width:100%}
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

.wrap {
  position: absolute;
  width: 100%;
  top: 60%;
  left: 00%;
    display: flex;
    justify-content: center;  
}

.rap2 {
	position:relative;
}

.dhb {
    float: left;
    color:#1E262D;
    text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;

}

.gg {
    float: left;
}

    
      #search_champ {
        width: 80px;
        height: 40px;
        font-size:15px;
        font-family: 'Nanum Gothic';
        color: white;
        line-height: 15px;
        text-align: center;
        background: rgb(25, 25, 37);
        border-radius: 15px;
      }
body {
    padding:0;
    margin:0;
    overflow:hidden;
	  height: 600px;
}
canvas {
    padding:0;
    margin:0;
}
div.btnbg {
    position:fixed;
    left:0;
    top:0;
    box-shadow: 0px 0px 15px #ccc;
}
div.btnbg:hover{
    text-shadow: 0px 0px 3px #ccc;
    box-shadow: 0px 0px 20px #ccc;
}



#autoMaker{
    position: absolute; width: 170px;
    height: auto; background: white;
    margin-top: 3px; cursor:pointer;
    color:black;
    
}
#autoMaker > div{
    border : 1px solid #e6e6e6;
    margin-top : 3px;
}
#autoMaker > div:hover{
    background : #e6d1ff;
}

#video {
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>

<body>


         
    <main>
        
        <div id="header">
        <div class="logo">
          <a href="#">DHB.GG</a>
        </div>  
        <nav>
          <form class="search" action="search.php"> 
            <input name="q" placeholder="Search..." type="search">
            
          </form>
          
          <ul>
            <li>
              <a href="aram">홈</a>
            </li>
            <li>
              <a href="aram">칼바람분석</a>

            </li>
            <li class="dropdown">
              <a href="aram">박제 게시판</a>
            </li>
            <li>
              <a href="aram">M.L</a>
            </li>
            <li>
              <a href="login">LOGIN</a>
            </li>
          </ul>
          
        </nav>
       
      </div>
      

<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="./videos/animated-kayle-morgana-login.mp4">

</video>
    
      <div class="a">
      <div class = "logo2">
          <div class="dhb">DHB</div>
          <div class="gg">.GG</div>
      </div>
      
    <div class="wrap">
    	<div class="rap2">
        <input id='search_area' type="text" class="searchTerm" placeholder="챔피언 이름을 검색하세요" autocomplete='on'>
        <button  id="search_champ" type="submit" class="searchButton">Search</button>
        <div class="searchTerm" id='autoMaker' ></div>
        </div>
    </div>
     
</div>


    </main>

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
                //$('#insert_target').val("key : "+$(this).attr('key')+ ", data : " + $(this).text());
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