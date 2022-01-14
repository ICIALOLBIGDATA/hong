<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>test.jsp</h1>


<!-- var.대문자를 쓰는 경우는 myBatis에서 resultType가 Map일때 사용.-->
<c:forEach var="mb" items="${mList}">
	${mb.M_ID},${mb.M_NAME},${mb.M_POINT}<br>
</c:forEach>

</body>
</html>