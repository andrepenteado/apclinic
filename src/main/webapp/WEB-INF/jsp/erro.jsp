<%@page isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<html>
<head>
  <title>Erro no processamento</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></link>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>
</head>
<body>

<div style="background-color: #337ab7; overflow:hidden; position: fixed; top: 0; left: 0; width: 100%">
  <p style="float: left; font-size: 24px; font-weight: bold; color: #fff; margin-top: 10px; height: 31px;">&nbsp;&nbsp;APClinic</p>
</div>

<div style="text-align: center; margin-top: 100px;">
  <i class="fa fa-exclamation-triangle fa-4x"></i>
  <h2>Erro no processamento</h2>
  <p>Sua requisição não foi processada corretamente pelo servidor.</p>
  <br/>
  <a href="<%=request.getContextPath()%>/" class="btn btn-primary"><i class="fa fa-home"></i> Página Inicial</a>
</div>

<!--
    <%if (exception != null) exception.printStackTrace(new java.io.PrintWriter(out));%>
-->
</body>
</html>