<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Board * Reply Contents</h3>
	
	<div>${delBtn}</div>
	
	<table>
		<tr height="30">
			<td width="100" bgcolor="powderblue" align="center">NUM</td>
			<td colspan="5">${board.b_num}</td>
		</tr>
		<tr height="30">
			<td width="80" bgcolor="powderblue" align="center">WRITER</td>
			<td>${board.b_id}</td>
			<td width="80" bgcolor="powderblue" align="center">DATE</td>
			<td>${board.b_date}</td>
			<td width="80" bgcolor="powderblue" align="center">VIEWS</td>
			<td>${board.b_views}</td>
		</tr>
		<tr height="30">
			<td width="100" bgcolor="powderblue" align="center">TITLE</td>
			<td colspan="5">${board.b_title}</td>
		</tr>
		<tr height="30">
			<td width="100" bgcolor="powderblue" align="center">CONTENTS</td>
			<td colspan="5">${board.b_contents}</td>
		</tr>
		
		<tr>
			<th colspan="6">첨부파일</th>
		</tr>
		<tr>
			<td colspan="6"><c:set var="files" value="${bfList}" />
			 	<c:if test="${empty files}">
					첨부된 파일이 없습니다.
				</c:if>
				<c:if test="${!empty files}">
					<c:forEach var="file" items="${files}">
						<a	href="./download?sysFileName=${file.bf_sysName}&oriFileName=${file.bf_oriName}">
							<i class="fa fa-file" style="font-size:12px"></i>&nbsp;&nbsp;${file.bf_oriName}</a><br>
					</c:forEach>
				</c:if>
			</td>
		</tr>


		
		
	</table>

	<!-- 댓글 입력 -->
	<form id="rFrm" name="rFrm" action="replyInsert">
		<table>
			<tr>
				<td><textarea rows="3" cols="50" name="r_contents" id="r_contents">
				
				    </textarea>
				</td>
				<td><input type="button" value="댓글전송"
					onclick="replyInsert(${board.b_num})"
					style="width: 80px; height: 50px">
				</td>
			</tr>
		</table>

	</form>
	<!-- 댓글 리스트 출력 -->
	<table id="rTable">
		<c:forEach var="reply" items="${rList}">
			<tr height="20" align="center">
				<td width="100">${reply.r_id}</td>
				<td width="100">${reply.r_contents}</td>
				<td width="200">${reply.r_date}</td>
			</tr>
		</c:forEach>
	</table>

<script type="text/javascript">

function replyInsert(bNum){
	console.log("b_Num= "+bNum);
	//text = $("#r_contents").val()
	let obj=$("#rFrm").serializeObject(); // 폼의 모든 데이터를 js객체로 변환
	// 폼데이터 --> js객체 --> json --> 서버 --> 자바객체
	// 단, file태그로 받아오는건 변환하지 못한다.
	obj.r_bnum = bNum;
	
	let json = JSON.stringify(obj); // <--> JSON.parse(json)
	
	$.ajax({
		type:"post",
		url:"rest/replyinsert", // 'list/member/10' , 'list/board/10'
		//urlencoded 방식
		
		//data: {r_bnum:bNum, r_contents:$('#r_contents').val()},
		//data: $('#rFrm').serialize(), --> form태그 안의 내용을 전부 넘긴다는 뜻이다. 
		//단, 여기서는 bNum이 없어서 위의 방식대로 한다.
		data : json,
		//urlencoded 방식이 아닌 json형태의 데이터를 서버에 넘긴다.
		contentType:"application/json; charset=UTF-8",
		
		dataType:"json",
		success: function(data){
			console.log(data);
 			$("#rTable").empty();
			for (let i in data){
				str = "<tr height='20' align='center'>";
				str += "<td width='100'>"+data[i].r_id+"</td>";
				str += "<td width='100'>"+data[i].r_contents+"</td>";
				str += "<td width='200'>"+data[i].r_date+"</td></tr>";
				$("#rTable").append(str);
			}
			$('#r_contents').val("");
			$('#r_contents').focusin();

		},
		error: function(error){
			console.log(error);
		}
	});
	
}
</script>
</body>
</html>
