<%-- 
    Document   : signup
    Created on : Mar 11, 2025, 1:11:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                font-family: 'Jost', sans-serif;
                background: linear-gradient(to bottom, #b1a6a4 0%, #d8cfd0 20%, #f2f1ef 50%, #d8cfd0 90%, #b1a6a4 100%);
            }
            .container{
                width: 350px;
                height: 450px;
                background: url("https://your-image-url.com") no-repeat center/cover;
                border-radius: 10px;
                box-shadow: 5px 20px 50px #000;
                padding: 20px;
                text-align: center;
            }
            label{
                color: #697184;
                font-size: 2em;
                font-weight: bold;
            }
            input{
                width: 80%;
                height: 35px;
                margin: 10px auto;
                padding: 10px;
                border: none;
                outline: none;
                border-radius: 5px;
                display: block;
            }
            button{
                width: 80%;
                height: 40px;
                background: #697184;
                color: #fff;
                font-size: 1em;
                font-weight: bold;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 15px;
            }
            button:hover{
                background: #697184;
            }
            span{
                color: black;
                display: block;
                margin-top: 10px;
            }
        </style>
        <title>Sign Up</title>
    </head>
    <body>
        <div class="container">
            <label>Sign Up</label>
            <form action="${pageContext.request.contextPath}/authen?action=sign_up" method="POST">
                <input type="text" name="txt" placeholder="User name" required>
                <span>${error}</span>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="pswd" placeholder="Password" required>
                <button type="submit">Sign Up</button>
            </form>
            <p>Already have an account? <a href="${pageContext.request.contextPath}/view/authen/login.jsp" style="color: white;">Login</a></p>
        </div>
    </body>
</html>

