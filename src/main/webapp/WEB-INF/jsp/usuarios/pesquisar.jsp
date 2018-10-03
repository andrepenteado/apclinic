<%--
  User: André Penteado
  Date: 25/08/18
  Time: 14:04
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/erro" %>
<%@taglib prefix="dandelion" uri="http://github.com/dandelion" %>
<%@taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>

<dandelion:bundle includes="datatables.extended.bs4"/>

<html>
<head>
  <meta name="header" content="Usuários do Sistema"/>
  <title>Usuários do Sistema</title>
</head>
<body>

  <datatables:table data="${listagemUsuarios}" row="usuario" id="GridDatatable">
    <datatables:column title="Nome" property="nome"/>
    <datatables:column title="Login" property="login"/>
    <datatables:column title="Opções" filterable="false" searchable="false" cssCellClass="text-center" cssStyle="width: 1%">
      <a href="${linkController}/editar/${categoria.id}" class="btn btn-success btn-sm" title="Editar"><i class='fas fa-pencil-alt'></i></a>
      <a href="#" class="btn btn-danger btn-sm" title="Excluir" onclick="confirmarExclusao('Deseja realmente excluir o usuário ${categoria.descricao}?', '${linkController}/excluir/${categoria.id}'); return false;">
        <i class='fas fa-trash-alt'></i>
      </a>
    </datatables:column>
    <datatables:extraJs bundles="datatables.extended.bs4.config" placeholder="before_start_document_ready" />
  </datatables:table>

</body>
</html>