<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/erro"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="dandelion" uri="http://github.com/dandelion" %>

<dandelion:bundle includes="font-awesome5"/>

<html>

<head>
  <title>Login</title>
  <meta name="header" content="Login" />
</head>

<body>
<style>
  body { background-color: #ccc; }
</style>

<form name="form-login" method="POST" action="<c:url value='/home'/>">
  <div class="row">
    <div class="col-12 col-md-6 offset-md-3">
      <div class="card">
        <div class="card-header">
          <c:if test="${param.error != null}">
            <div class="alert alert-danger" role="alert"><i class="fas fa-exclamation-triangle"></i> Usuário e/ou senha inválidos</div>
          </c:if>
          <h3>Digite seu usuário e senha para entrar</h3>
        </div>
        <div class="card-body">
          <div class="form-group">
            <div class="input-group input-group-lg has-feedback">
              <input type="text" class="form-control border-right-0" placeholder="Nome de usuário" name="username"/>
              <div class="input-group-prepend">
                <span class="input-group-text bg-white border-left-0"><i class="far fa-envelope form-control-feedback"></i></span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="input-group input-group-lg has-feedback">
              <input type="password" class="form-control border-right-0" placeholder="Senha" name="password"/>
              <div class="input-group-prepend">
                <span class="input-group-text bg-white border-left-0"><i class="fas fa-lock form-control-feedback" ></i></span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg"><i class="fas fa-user"></i> Entrar</button>
          </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </div>
    </div>
  </div>
</form>

</body>

</html>