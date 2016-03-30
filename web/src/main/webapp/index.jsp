<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Document</title>

    <style>
        .error{
            color:red;
        }
        .hide{
            display: none;
        }
    </style>

</head>
<body>

    <h1>hello,maven</h1>
    <input type="text" id="username"><span class="error hide" id="helpText">该账号已被占用</span>
    <button id="btn">button</button>


   <%-- <form action="" enctype="application/x-www-form-urlencoded"></form>--%>
    <script>
        (function(){
            function createXmlHttp(){
                var xmlHttp = null;

                if(Window.ActiveXObject){
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }else{
                    xmlHttp = new XMLHttpRequest();
                }
                return xmlHttp;
            }

            document.querySelector("#username").onchange = function(){
                var xmlHttp = createXmlHttp();

               /* doget请求
               var msg = document.querySelector("#msg").value;
                msg = encodeURIComponent(msg);
                xmlHttp.open("get","/home.do?msg="+msg+"&_="+new Date().getTime(),true);*/

                xmlHttp.open("post","/home.do",true);
                xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

                xmlHttp.onreadystatechange = function(){

                    var readyState = xmlHttp.readyState;

                    if(readyState == 4){
                        var httpCode = xmlHttp.status;

                        if(httpCode == 200){
                            var value = xmlHttp.responseText;
                            if(value == 0){
                                document.querySelector("#helpText").style.display="inline";
                            }
                        }else{
                            alert("服务器错误:" + httpCode);
                        }
                    }
                };

                var username = document.querySelector("#username").value;
                xmlHttp.send("username="+username);
            }
        })();
    </script>
</body>
</html>
