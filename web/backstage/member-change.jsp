<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2019/11/2
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="upload.do" enctype="multipart/form-data" name="form0" id="form0" >
        <input type="file" name="file0" id="file0" multiple="multiple" /><br>
        <img src="" id="img0" style="width: 20rem;height: 15rem;">
        <input type="submit" value="上传">
    </form>
    <script>
        $("#file0").change(function(){
            var objUrl = getObjectURL(this.files[0]) ;//获取文件信息
            console.log("objUrl = "+objUrl);
            if (objUrl) {
                $("#img0").attr("src", objUrl);
            }
        }) ;
        function getObjectURL(file) {
            var url = null;
            if (window.createObjectURL!=undefined) {
                url = window.createObjectURL(file) ;
            } else if (window.URL!=undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file) ;
            } else if (window.webkitURL!=undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file) ;
            }
            return url ;
        }
    </script>
</body>
</html>
