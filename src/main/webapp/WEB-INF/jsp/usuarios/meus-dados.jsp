<%--
  User: André Penteado
  Date: 27/08/18
  Time: 10:02
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/erro"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://github.com/dandelion" prefix="dandelion"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<dandelion:bundle includes="font-awesome5,jquery.validation"/>

<c:set var="actionGravar"><c:url value="/usuarios/meusdados/gravar"/></c:set>

<html>
<head>
  <meta name="header" content="Meus Dados"/>
  <title>Meus Dados</title>
</head>
<body>
  <script type="text/javascript">
      $(document).ready(function() {
          var form = $("#usuario").validate({
              rules : {
                  txt_confirme_senha : { equalTo : "#txt_nova_senha" },
                  nome : { required : true }
              }
          });
          $("#txt_nova_senha").focus();
      });
  </script>

  <form:form action="${actionGravar}" modelAttribute="usuario">
    <form:hidden path="id"/>
    <form:hidden path="login"/>
    <form:hidden path="senha"/>
    <div class="col-12 col-md-6 offset-md-3">
      <div class="card">
        <div class="card-body border border-primary rounded shadow-lg">
          <jsp:include page="/layouts/modal-mensagens.jsp"><jsp:param name="model" value="usuario"/></jsp:include>
          <h3 class="card-title">Meus dados de acesso</h3>
          <hr>
          <div class="form-group">
            <label>Login</label>
            <input type="text" class="form-control" value="${usuario.login}" disabled/>
          </div>
          <div class="form-group">
            <label for="txt_nova_senha">Senha</label>
            <input type="password" class="form-control" name="txt_nova_senha" id="txt_nova_senha"/>
            <small class="form-text text-muted">Deixe em branco caso não queira mudar sua senha.</small>
          </div>
          <div class="form-group">
            <label for="txt_confirme_senha">Confirme sua senha</label>
            <input type="password" class="form-control" name="txt_confirme_senha" id="txt_confirme_senha">
          </div>
          <div class="form-group">
            <label for="nome">Nome completo</label>
            <form:input class="form-control" path="nome"/>
          </div>
          <p class="text-center">
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Gravar</button>
          </p>
        </div>
      </div>
    </div>
  </form:form>
</body>
</html>