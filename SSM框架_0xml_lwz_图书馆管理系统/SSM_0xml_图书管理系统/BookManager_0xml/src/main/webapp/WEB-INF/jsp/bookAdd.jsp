<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>
        <spring:message code="bookAdd"/>
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/s/css/bootstrap.min.css" rel="stylesheet">
<%--    <script src="${pageContext.request.contextPath}/s/js/cancel.js"></script>--%>
    <script>
        function concel() {
            window.location.href="${pageContext.request.contextPath}/book/list";
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">
                        <spring:message code="bookManager"/>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link disabled" aria-current="page" href="${pageContext.request.contextPath}/book/list">
                                    <spring:message code="bookManagerHome"/>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
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
                    <spring:message code="bookAdd"/>
                </div>
                <div class="card-body">
                    <form:form enctype="multipart/form-data" modelAttribute="book">
                    <%--不用再写method因为默认是post,此标签库的作用是解决回填的value过多时代码重复问题--%>
<%--                  <form method="post" enctype="multipart/form-data">--%>
                      <div class="mb-3 row">
                          <form:label  path="name" cssClass="col-sm-2 col-form-label" >
                              <spring:message code="book.name"/>
                          </form:label>
                          <div class="col-sm-10">
<%--                              is-invaild应该是动态改变的，而不是固定不变的--%>
                              <form:input cssClass="form-control" path="name" />
                              <div class="invalid-feedback" >
                                  <form:errors path="name" />
                              </div>
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <form:label  path="author" cssClass="col-sm-2 col-form-label" >
                              <spring:message code="book.author"/>
                          </form:label>
                          <div class="col-sm-10">
                              <form:input cssClass="form-control" path="author" />
                              <div class="invalid-feedback" >
                                  <form:errors path="author" />
                              </div>
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <form:label  path="tid" cssClass="col-sm-2 col-form-label" >
                              <spring:message code="book.tid"/>
                          </form:label>
                          <div class="col-sm-10">
                              <form:select path="tid" cssClass="form-control" items="${types}" itemValue="id" itemLabel="name"/>
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <form:label  path="price" cssClass="col-sm-2 col-form-label" >
                              <spring:message code="book.price"/>
                          </form:label>
                          <div class="col-sm-10">
                              <form:input cssClass="form-control" path="price" />
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <form:label  path="descri" cssClass="col-sm-2 col-form-label" >
                              <spring:message code="book.descri"/>
                          </form:label>
                          <div class="col-sm-10">
                              <form:textarea  path="descri" cssClass="form-control" />
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <label for="inputPhoto" class="col-sm-2 col-form-label">
                              <spring:message code="book.photo"/>
                          </label>
                          <div class="col-sm-10">
                              <input type="file" class="form-control" id="inputPhoto" name="photox">
                              <%--此处不能回填 type类型value赋值没用，来源W3cSchool用法说明--%>
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <form:label  path="pubdate" cssClass="col-sm-2 col-form-label" >
                              <spring:message code="book.pubdate"/>
                          </form:label>
                          <div class="col-sm-10">
                              <form:input cssClass="form-control" path="pubdate" />
                              <div class="invalid-feedback" >
                                  <form:errors path="pubdate" />
                              </div>
                          </div>
                      </div>
                      <div class="mb-3 row">
                          <label class="col-sm-2 col-form-label"></label>
                          <div class="col-sm-10">
                              <button type="submit">
                                  <spring:message code="book.add"/>
                              </button>
                              <button type="button" onclick="concel()">
                                  <spring:message code="book.cancel"/>
                              </button>
                          </div>
                      </div>
                    </form:form>
                </div>
                <div class="card-footer">

                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                <p class="text-center">
                    <spring:message code="rights"/>
                </p>
            </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/s/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<%--线上课4>16:54,实现对未填信息的框爆红提示，有填的不爆红--%>
<script>
<c:forEach items="${requestScope['org.springframework.validation.BindingResult.book'].fieldErrors}" var="err">
    document.querySelector('[name="${err.field}"]').classList.add("is-invalid");
</c:forEach>
</script>
</body>
</html>
