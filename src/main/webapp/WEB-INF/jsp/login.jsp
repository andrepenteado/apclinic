<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/erro"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="dandelion" uri="http://github.com/dandelion" %>

<dandelion:bundle includes="font-awesome5,jquery.validation"/>

<html>

<head>
  <title>Login</title>
  <meta name="header" content="Login" />
</head>

<body>
  <script type="text/javascript">
      $(document).ready(function() {
          var form = $("#form-login").validate({
              rules : {
                  username : { required : true },
                  password : { required : true }
              }
          });
          $("#username").focus();
      });
  </script>

  <form name="form-login" id="form-login" method="POST" action="<c:url value='/home'/>">

    <div class="col-12 col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body border border-primary rounded shadow-lg">
          <c:if test="${param.error != null}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
              <i class="fas fa-exclamation-triangle"></i> Usuário e/ou senha inválidos
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </c:if>
          <h3 class="card-title">Digite seu usuário e senha para entrar</h3>
          <hr>
          <div class="form-group">
            <div class="input-group input-group-lg">
              <input type="text" class="form-control border-right-0" placeholder="Nome de usuário" name="username" id="username"/>
              <div class="invalid-feedback">
                Please choose a username.
              </div>
              <div class="input-group-prepend">
                <span class="input-group-text bg-white border-left-0"><i class="far fa-envelope form-control-feedback"></i></span>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="input-group input-group-lg">
              <input type="password" class="form-control border-right-0" placeholder="Senha" name="password" id="password"/>
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

  </form>

</body>

</html>