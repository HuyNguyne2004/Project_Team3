<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.Users" %>  <%-- Đảm bảo đường dẫn chính xác --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Lấy thông tin user từ session
    HttpSession sessionObj = request.getSession();
    Object userObj = sessionObj.getAttribute("user"); 
    Users user = null;
    if (userObj instanceof Users) {
        user = (Users) userObj;
    }

    // Lấy courseId từ request và chuyển thành số nguyên
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
        <title>Confirm Registration</title>
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
            .container{
                width: 500px;
                height: 600px;
                background: url("https://your-image-url.com") no-repeat center/cover;
                border-radius: 10px;
                box-shadow: 5px 20px 50px #000;
                padding: 20px;


            }
            .container h2{
                color: #697184;
                font-size: 2em;
                font-weight: bold;
                text-align: center;
                text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);

            }
            .container p{
                color: #B1A6A4;
                max-width: 800px;
                margin: 40px auto;
                font-size: 20px;
                text-align: justify;
            }
            .container ul{
                color: #969896;
                max-width: 800px;
                margin: 40px auto;
                font-size: 18px;
                text-align: justify;

            }

            .container li{
                color: #413F3D;
                max-width: 800px;
                margin: 40px auto;
                font-size: 16px;
                text-align: justify;
            }
            .cf {
                width: 70%;
                height: 40px;
                background: #697184;
                color: #fff;
                font-size: 1em;
                font-weight: bold;
                border: none;
                border-radius: 2px;
                cursor: pointer;
                margin-top: 15px;
            }
            .cf:hover{
                background: #697184;
            }



            .cancel {
                display: inline-block; /* Thêm để thẻ <a> có thể có kích thước giống như button */
                width: 29%; /* Đảm bảo chiều rộng giống như nút Confirm */
                height: 40px; /* Đảm bảo chiều cao giống như nút Confirm */
                background: #969896;
                color: #fff;
                font-size: 1em;
                font-weight: bold;
                text-align: center;
                line-height: 40px; /* Canh giữa chữ theo chiều dọc */
                border-radius: 2px;
                cursor: pointer;
                margin-top: 15px;
                text-decoration: none; /* Loại bỏ gạch chân của thẻ <a> */
            }

            .cancel:hover {
                background: #B1A6A4;
            }


        </style>
    </head>
    <body>

        <div class="container">
            <h2>Course Registration Confirmation</h2>
            <p>Are you sure you want to register for course <strong><%= (courseId > 0) ? courseId : "Không xác định" %></strong> ?</p>

            <p class="thong tin"><strong>Your information:</strong></p>
            <ul>
                <% if (user != null) { %>
                <li>Full Name: <%= user.getFull_name() %></li>
                <li>Email: <%= user.getEmail() %></li>
                <li>Role: <%= user.getRole() %></li>
                <li>Status: <%= user.getStatus() %></li>
                    <% } else { %>
                <li class="not log"><strong>Not logged in!</strong></li>
                    <% } %>
            </ul>

            <!-- Form gửi dữ liệu đến Servlet để xử lý đăng ký -->
            <form action="${pageContext.request.contextPath}/user/registerCourse" method="POST">
                <input type="hidden" name="courseId" value="<%= courseId %>">
                <button class="cf" type="submit" >Confirm Registration</button>
                <a class="cancel" href="${pageContext.request.contextPath}/view/courses/courses.jsp">Cancel</a>
            </form>
        </div>

    </body>
</html>
