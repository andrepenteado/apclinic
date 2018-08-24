<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" errorPage="/erro"%>
<%@taglib uri="http://github.com/dandelion" prefix="dandelion"%>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="header" content="Página inicial" />
  <title>Página inicial</title>
  <dandelion:bundle includes="font-awesome5"/>
</head>
<body>

<div class="text-center">
  <i class="fa fa-home fa-4x"></i>
  <h2>Página Inicial</h2>
  <p>Você está conectado em <strong><%=application.getServletContextName()%></strong> através do IP <strong><%=request.getRemoteAddr()%></strong></p>
</div>

</body>
</html>