<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.Users" %>

<%
    // Lấy thông tin user từ session
    HttpSession sessionObj = request.getSession();
    Object userObj = sessionObj.getAttribute("user"); 
    Users user = null;
    if (userObj instanceof Users) {
        user = (Users) userObj;
    }

    // Lấy courseId từ request
    int courseId = 0;
    try {
        courseId = Integer.parseInt(request.getParameter("courseId"));
    } catch (NumberFormatException e) {
        courseId = 0; // Nếu lỗi, đặt về 0
    }
%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký thành công</title>
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
            .hoanho {
                width: 1300px;
                height: 150px;
                background: url("https://your-image-url.com") no-repeat center/cover;
                border-radius: 10px;
                box-shadow: 5px 20px 50px #000;
                padding: 40px;
                color: #fff;
                font-size: 2em;
                font-weight: bold;
                text-align: center;
                text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
                
            }
            .thongtin{
                color: #697184;
                max-width: 800px;
                margin: 40px auto;
                font-size: 20px;
                text-align: justify;
            }
            .container li{
                color: #413F3D;
                max-width: 900px;
                margin: 10px 400px;
                font-size: 18px;
                text-align: justify;
            }
            a {
    display: block; /* Make the anchor a block element so it can be centered */
    width: 300px; /* Set the width for the button */
    height: 80px;
    background: #697184;
    color: #fff;
    font-size: 1.2em; /* Increase the font size */
    font-weight: bold;
    border: 3px solid #fff; /* Add a border with a larger width */
    border-radius: 20px; /* Increase the border-radius for larger rounded corners */
    cursor: pointer;
    margin: 40px auto; /* Center the button horizontally */
    text-align: center;
    line-height: 80px; /* Vertically center the text */
    text-decoration: none; /* Remove underline */
}

a:hover {
    background: #fff;
    border-color: #413F3D; /* Ensure border color stays consistent on hover */
    color: #413F3D;
}
        </style>
    </head>
    <body>

        <div class="container">
            <div class="hoanho">
                <h2>🎉 Registration successful!</h2>
                <p>You have successfully registered for the <strong>#<%= courseId %></strong> course.</p>
            </div>

            <p class="thongtin"><strong>Your information:</strong></p>
            <ul>
                <% if (user != null) { %>
                <li><strong>Full Name:</strong> <%= user.getFull_name() %></li>
                <li><strong>Email:</strong> <%= user.getEmail() %></li>
                <li><strong>Role:</strong> <%= user.getRole() %></li>
                <li><strong>Status:</strong> <%= user.getStatus() %></li>
                    <% } else { %>
                <li><strong>Not logged in!</strong></li>
                    <% } %>
            </ul>

            <div>
                <a href="${pageContext.request.contextPath}/view/courses/courses.jsp">🏫 Back to the course list.</a>
            </div>
        </div>

    </body>
</html>
