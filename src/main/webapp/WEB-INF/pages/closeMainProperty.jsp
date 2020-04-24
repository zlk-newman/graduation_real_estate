<%--
  Created by IntelliJ IDEA.
  User: 17612
  Date: 2020/4/14
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    var node = window.parent.document.getElementById("close_main");
    function closeit()
    {
        setTimeout("node.click()", 3000);
    }
    closeit();
</script>
<body>
修改成功，五秒后回到系统主页面！！！
</body>
</html>
