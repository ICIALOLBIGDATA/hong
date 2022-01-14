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
</head>
<body>

<h1>test.jsp</h1>


</body>

<script type="text/javascript">
$.ajax({
	method:'post',  //get 또는 post(_method:delete,put,patch), type속성이 안되는 경우 있음
	//url: 'member/sales/hong',
	//url:'member/get?num=30',//'member/post?num=30',
	//url:'member/delete?num=40', //'member/patch','member/put','member/delete',
	//url:'member/manager/30',
	url : "member/put",
	data:{_method:'put',num:10},   //크롬은 필요없지만 모든 브라우저에서 사용하기 위해
	dataType: 'json', //xml, json, html
	success: function(data){
		console.log(data);
	},
	error:function(err){
		console.log(err);
	}
});//ajax End 
</script>


</html>