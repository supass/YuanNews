<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 16-3-30
  Time: 下午7:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  String projectPath=request.getContextPath();%>
<html>
<head>
    <title>主页</title>
</head>
<body>

    Hi , Yuan ! I 'm test page !<br/>
   <t1>当前工程： <%=projectPath%></t1> <br/>
    <a href="<%=projectPath %>/manager/managerIndex.action"> 后台管理 </a>


</body>
</html>
