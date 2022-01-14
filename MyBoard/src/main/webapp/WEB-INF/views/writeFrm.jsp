<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h3>글쓰기</h3>
	<form action="boardwrite" id="frm" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" id="b_title" name="b_title" required></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="60" id="b_contents" name="b_contents" required></textarea>
				</td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td><input type="file" name="files" id="files" multiple>
					<!-- <input type="hidden" id="fileCheck" name="fileCheck" value="0"> -->
				 </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="formData()" value="FormData">
					
					<input type="submit" value="글작성">
					<input type="reset" id="reset" value="취소">
					<input type="button" onclick="location.href='./boardlist'" value="글목록"> 
				</td>
			</tr>

		</table>
	</form>
	
</body>

<script type="text/javascript">
		//js FormData객체 사용 목적
		//1.multipart/form-data를 비동기통신(Ajax)시 무조건 FormData객체 사용(파일업로드)
		//2.FormData객체는 form의 일부 데이터만 서버로 전송할 때 좋다.
		//--서버가 restFul인경우는 ajax를 이용해서 서버로 넘긴다-->json반환
		function formData() {
			let $obj = $("#files");
			/*console.log($obj); //jQ객체
			console.dir($obj[0]); //js 객체-->배열로 반환
			console.log($obj[0].files); //첨부된 파일리스트
			console.log($obj[0].files.length); //리스트 개수
			console.log($obj[0].files[0]);//1번째 파일 정보
			console.log($obj[0].files[1]);//2번째 파일 정보
 */
			//let formData=new FormData($("#frm")); //js지원 객체 ,에러		
			//let formData=new FormData(document.getElementById("frm")); //js지원 객체 ,ok		
			//console.log(formData.get("b_title"));
			//console.log(formData.getAll("files")); //key는 name속성명, 파일리스트 출력
			//폼의 일부데이터 저장
			let formData = new FormData();
			formData.append("b_title", $('#b_title').val());
			formData.append("b_contents", $('#b_contents').val());
			//formData.append("fileCheck", $('#fileCheck').val());  //필요없음

			let files = $obj[0].files;
			for (let i = 0; i < files.length; i++) {
				formData.append("files", files[i]); //Map과 달리 속성(키) 같아도 쌓여서 모두 저장
			}
			console.log(formData.get("b_title"));
			console.log(formData.getAll("files"));  //key는 name속성명, 파일리스트 출력

			$.ajax({
				type : 'post', //반드시 post
				url : 'rest/boardwrite',
				data : formData,
				processData : false, //urlencoded(쿼리스트링 형식)처리 금지
				contentType : false, //multipart의 경우 false
	
				dataType : 'json', //rest컨트롤러 이용
				success : function(data) {
					console.log(data);
				},
				error : function(err) {
					console.log(err);
				}
			});
		}//End formData
	</script>


</html>








