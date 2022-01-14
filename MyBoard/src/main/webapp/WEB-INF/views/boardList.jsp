<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/jquery.serializeObject.js"></script>


<style>
#one_table tr, #one-table td{
height:10px;
width:10px;
}
#articleView_layer {
	position: fixed;
	top: 0px;
	left: 0px;
	right: 0px;
	height: 100%;
	display: none;
}

#articleView_layer.open {
	display: block;
}

#articleView_layer #bg_layer {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	z-index: 100
}

#contents_layer {
	position: relative;
	width: 400px;
	height: 400px;
	margin: 0px auto;
	padding: 20px;
	border: 2px solid #555;
	background: #fff;
	font-size: 12px;
	z-index: 200;
	color: #767676;
	overflow: scroll
}

#grid {
display: grid;
      grid-template-columns: 300px 1fr;
      display:flex;

}
</style>

</head>
<body>
	<h1>boardList.jsp</h1>

	<c:if test="${!empty id}">
		<div align="right">
			<form name="logoutFrm" action="logout" method="post">
				<a href="javascript:document.logoutFrm.submit()">로그아웃</a>
			</form>
		</div>
	</c:if>

	<!-- 회원정보 출력:MINFO view -->
	<div id = "grid">
	
	<table id="one_table">
		<tr height="20px">
			<td width=auto bgcolor="royalblue" align="center">ID</td>
			<td>${mb.m_id}</td>
		
			<td width=auto bgcolor="royalblue" align="center">NAME</td>
			<td>${mb.m_name}</td>
		</tr>
		<tr height="30">
			<td width=auto bgcolor="royalblue" align="center">GNAME</td>
			<td>${mb.g_name}</td>
		
			<td width=auto bgcolor="royalblue" align="center">POINT</td>
			<td>${mb.m_point}</td>
		</tr>
	</table>
<div>


	<!-- 모달(Modal) 박스 -->
	<div id="articleView_layer">
		<div id="bg_layer"></div>
		<div id="contents_layer"></div>
	</div>

	<form action="testmap">
		검색: <input type="text" name="search"><br>
		<button>검색</button>
	</form>
	<!-- 글쓰기 -->
	<form action='writefrm'>
		<button>글쓰기</button>
	</form>
	<table>
		<tr bgcolor="red" height="30">
			<th width="100">번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="100">조회수</th>
			<th width="100">추천수</th>
		</tr>
		<c:forEach var="board" items="${top3List}">
			<tr height="20">
				<td align="center">${board.b_num}</td>
				<td align="center"><a href="./contents?b_num=${board.b_num}&m_id=${mb.m_id}">
						${board.b_title}</a></td>
				<td align="center">${board.b_id}</td>
				<td align="center">${board.b_date}</td>
				<td align="center">${board.b_views}</td>
				<td align="center">${board.b_thumbs}</td>
			</tr>
		</c:forEach>
	</table>

	<table>
		<tr bgcolor="royalblue" height="30">
			<th width="100">번호</th>
			<th width="100">제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="100">조회수</th>
			<th width="100">추천수</th>
		</tr>
		<c:forEach var="board" items="${bList}">
			<tr height="20">
				<td align="center">${board.b_num}</td>
				<!-- href="#" 페이지 맨위로 이동뒤 이벤트 발생
				     href="#;" 페이지 현재위치에서 이벤트 발생 -->
				<%-- <td align="center"><a href="#" data-b_num="${board.b_num}">
						${board.b_title}</a></td> --%>
				<td align="center"><a href="./contents?b_num=${board.b_num}">
						${board.b_title}</a></td>
				<td align="center">${board.b_id}</td>
				<td align="center">${board.b_date}</td>
				<td align="center">${board.b_views}</td>
				<td align="center">${board.b_thumbs}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div align="center">${paging}</div>
	
	</div>
</div>
<script type="text/javascript">
$(window).bind('pageshow', function(event){
	if ( event.originalEvent.persisted){
		location.reload();
	}
	else{
	}
})	
</script>
<%--
	<script>
	
	
	function articleView(num){
		//console.log("2=",num);	
		//console.log("2=",$(this).data("b_num"));	
		$("#articleView_layer").addClass('open');
			
			 $.ajax({
				type:'get',
				url: 'contents',
				data: {bNum: num},
				dataType: 'html' //ajaxContents.jsp에 상세 내용을 출력후 리턴 
				}).done((data)=>$('#contents_layer').html(data))
				.fail((err)=>console.log(err)); //ajax End
				
	}//articleView
	
	$(function(){
		//$("a[href='#']").click(articleView);
		
		
		const $window=$("#articleView_layer");
		$window.find("#bg_layer").on('mousedown',function(evt){
			console.log(evt);
			$window.removeClass('open');
		})
		//esc 키 눌러 모달창 닫기
		$(document).keydown(function(evt){
			console.log(evt);
			if(evt.keyCode!=27) return;
			else if($window.hasClass('open')){
				$window.removeClass('open');
			}
		});//keydown End
		
		//삭제된 글번호 출력
		if('${bNum}'===''){   //1=='1'  true
			return;
		}else if(parseInt('${bNum}')>0){
			alert('${bNum}번 글을 삭제했습니다.');
		}
				
	}); */ //ready end

	</script>
  --%>
</body>
</html>