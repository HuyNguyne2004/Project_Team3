<%-- 
    Document   : register_error
    Created on : Mar 19, 2025, 12:28:54 AM
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Lấy thông báo lỗi từ session
    HttpSession sessionObj = request.getSession();
    String errorMessage = (String) sessionObj.getAttribute("error");

    // Xóa lỗi khỏi session sau khi hiển thị
    if (errorMessage != null) {
        sessionObj.removeAttribute("error");
    }
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký khóa học thất bại</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            body {
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                font-family: 'Jost', sans-serif;
                background: linear-gradient(to bottom, #b1a6a4 0%, #d8cfd0 20%, #f2f1ef 50%, #d8cfd0 90%, #b1a6a4 100%);
            }
            .container {
                width: 500px;
                background: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                box-shadow: 5px 20px 50px #000;
                padding: 20px;
                text-align: center;
            }
            h2 {
                color: red;
                font-size: 2em;
                font-weight: bold;
            }
            p {
                color: #413F3D;
                font-size: 18px;
                margin-top: 20px;
            }
            .btn-back {
                margin-top: 20px;
                padding: 10px 20px;
                background: #697184;
                color: #fff;
                font-size: 1em;
                font-weight: bold;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
            }
            .btn-back:hover {
                background: #5a6473;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Đăng ký khóa học thất bại</h2>
            <p><%= (errorMessage != null) ? errorMessage : "Có lỗi xảy ra khi đăng ký khóa học." %></p>
            <a class="btn-back" href="${pageContext.request.contextPath}/view/courses/courses.jsp">Quay lại danh sách khóa học</a>
        </div>
    </body>
</html>
