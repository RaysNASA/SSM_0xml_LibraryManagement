<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<script>
    window.location.href="${pageContext.request.contextPath}/book/list"
</script>
<body>
<h2>Hello World!</h2>

<%--固定路径访问--%>

<%--<%response.sendRedirect("http://localhost:8080/BookManager_upload_war/book/list");%>--%>

<%--会通过相对路径访问    不能访问--%>

<%--<input id="PageContext" type="text" value="${pageContext.request.contextPath}" hidden/>--%>
<%--<%response.sendRedirect("${pageContext.request.contextPath}/book/list");%>--%>

</body>
</html>
