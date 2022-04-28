<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	로그인(login.jsp)
	
	<c:if test="${not empty pageContext.request.userPrincipal }">	
		<p>
			현재 로그인 상태입니다.<br>
			로그인한 아이디는 ${pageContext.request.userPrincipal.name } 입니다.<br><br>
			<a href="<c:url value="j_spring_security_logout" />">로그아웃</a>					
		</p>
	</c:if>
	
	<s:authorize ifAnyGranted="ROLE_USER">
	
		<p>
			현재 로그인 상태입니다.<br>
			로그인한 아이디는 <s:authentication property="name"/> 입니다.<br><br>
			<a href="<c:url value="j_spring_security_logout" />">로그아웃</a>					
		</p>
	
	</s:authorize>
	
	<c:if test="${empty pageContext.request.userPrincipal }">	
		<p>
			현재 로그인 하지 않으신 상태입니다.<br>
					
		</p>
	</c:if>
	
	<s:authorize ifNotGranted="ROLE_USER">
		<p>
			현재 로그인 하지 않으신 상태입니다.<br>	
		</p>
	</s:authorize>
</body>
</html>