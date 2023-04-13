<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>
        <spring:message code="bookList"/>
    </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/s/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/book/list">
                        <spring:message code="bookManager"/>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/book/list">
                                    <spring:message code="bookManagerHome"/>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/book/add">
                                    <spring:message code="bookAdd"/>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <spring:message code="more"/>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled">Disabled</a>
                            </li>
                        </ul>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <spring:message code="bookList"/>
                </div>
                <div class="card-body">
                    <table class="table table-hover table-bordered">
                        <tr>
                            <td>Id</td>
                            <td><spring:message code="book.name"/></td>
                            <td><spring:message code="book.author"/></td>
                            <td><spring:message code="book.tid"/></td>
                            <td><spring:message code="book.price"/></td>
                            <td><spring:message code="book.descri"/></td>
                            <td><spring:message code="book.photo"/></td>
                            <td><spring:message code="book.pubdate"/></td>
                            <td><spring:message code="book.operation"/></td>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="book">
                            <tr>
                                <td>${book.id}</td>
                                <td>${book.name}</td>
                                <td>${book.author}</td>
                                <td>${book.type.name}</td>
                                <td>${book.price}</td>
                                <%-- <td>${book.descri}</td> --%>
                                <%--使用JSTL语言堵上XSS攻击--%>
                                <td><c:out value="${book.descri}" escapeXml="true"></c:out></td>
                                <td>
<%--                                    <a class="a" href="${pageContext.request.contextPath}/s/upload/${book.photo}"  ><img src="${pageContext.request.contextPath}/s/upload/${book.photo}" style="max-width: 200px;" alt="请插入图片"></a>--%>
                                    <img src="${pageContext.request.contextPath}/s/upload/${book.photo}" style="max-width: 200px;" alt="请插入图片">
                                </td>
                                <td>
                                    <fmt:formatDate value="${book.pubdate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/book/del?id=${book.id}">
                                        <spring:message code="book.delete"/>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/book/toEdit?id=${book.id}">
                                        <spring:message code="book.editor"/>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="card-footer">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${pageInfo.isFirstPage}">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="${pageContext.request.contextPath}/book/list?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/book/list?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>


                            <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                                <c:choose>
                                    <c:when test="${pageInfo.pageNum==i}">
                                        <li class="page-item active" ><a class="page-link" href="${pageContext.request.contextPath}/book/list?pageNum=${i}">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item" ><a class="page-link" href="${pageContext.request.contextPath}/book/list?pageNum=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${pageInfo.isLastPage}">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="${pageContext.request.contextPath}/book/list?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="${pageContext.request.contextPath}/book/list?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <p class="text-center align-middle">
                        <spring:message code="rights"/>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--模态确认框 开始-->
<div id="myModal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <spring:message code="confirm_model"/>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><spring:message code="dialogue_yes_or_no"/> </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><spring:message code="close"/> </button>
                <button type="button" class="btn btn-primary" id="dlgBtn"><spring:message code="continue"/></button>
            </div>
        </div>
    </div>
</div>
<!--模态确认框 结束-->
<script src="${pageContext.request.contextPath}/s/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script>

    (function () {
        var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
            keyboard: false
        })

        var herf;

        for (const x of document.querySelectorAll('a[href^="${pageContext.request.contextPath}/book/del?id="]')) {
            x.addEventListener("click",function (event) {
                event.preventDefault();  //阻止默认行为

                myModal.show();

                herf=event.target.href;
            });
        };

        document.getElementById("dlgBtn").addEventListener("click",function () {
            window.location.href=herf;
        });

    })();

    // function checkPhoto() {
    //     if ()
    //
    // }
</script>
</body>
</html>