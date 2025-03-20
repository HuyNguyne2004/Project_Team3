<%-- 
    Document   : PublicSpeakingMastery
    Created on : Mar 9, 2025, 8:50:40 PM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Public Speaking Mastery</title>
        <style>
/* menu */            
        body {
            margin: 0;
	        padding: 0;
	        font-family: Arial, sans-serif;
	        background: linear-gradient(to bottom, #b1a6a4 0%, #d8cfd0 20%, #f2f1ef 50%, #d8cfd0 90%, #b1a6a4 100%);
            max-width: 100vw; /* Giới hạn chiều rộng tối đa bằng khung màn hình */
            overflow-x: hidden; /* Ngăn cuộn ngang nếu có phần tử vượt quá khung */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
            max-width: 100vw; /* Giới hạn chiều rộng tối đa bằng khung màn hình */
            overflow-x: hidden; /* Ngăn cuộn ngang nếu có phần tử vượt quá khung */
                
        }
    .header  {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: rgba(177, 166, 164, 0.98);
    display: flex;
    align-items: center; 
    justify-content: space-between; 
    padding: 20px 10px; 
    z-index: 1000; 
}
.site-logo img {
    height: 50px; 
}
.site-logo {
    position: fixed;  
    top: 20px;       
    left: 20px;      
    z-index: 999;    
}
.main-menu {
    text-align: center; /* cÄn giá»¯a menu tá»ng thá» */
    margin-top: 20px; /* Äáº©y cáº£ menu xuá»ng phÃ­a dÆ°á»i */
    flex-grow: 1;
    display: flex;
    justify-content: center;
    justify-content: flex-start; 
    padding-left: 630px; 
    }


.main-menu ul {
    display: flex;
    align-items: center;
    list-style-type: none; 
    padding: 0;
    margin: 0;
    
}
        

.main-menu ul li {
    display: inline-block; 
    margin: 0 15px; 
}

.main-menu ul li a {
    color: #fff; 
    text-decoration: none; 
    transition: color 0.3s ease;
    font-size: 18px;
}
.main-menu ul li a:hover,
.main-menu ul li a.active {
    color: #cc204c; 
}
/* banner */
.banner-section {
    text-align: center;
    padding: 60px 0px 5px;
   
}

.banner-section .section-title h2 {
    font-size: 36px;
    color: #fff;
    margin-bottom: 15px;
    text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
}

.banner-section .section-title p {
    text-align: center;
    font-size: 16px;
    color: #666;
    max-width: 600px;
    margin: 10px auto;
}
.text-center {
    padding-top: 40px;
}

.text-center .site-btn {
    display: center;
    margin-top: 30px;
    background: var(--secondary-color);
    color: #828080;
    text-decoration: none;
    text-align: justify;
    font-weight: bold;
    border: 1px solid var(--border-color);
    box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
    padding: 12px 24px;
    display: inline-block;
    background-color: #fff;
}
.text-center .site-btn:hover {
    background-color: #fff;
}

/* Footer */
.widget-item {
    padding: 10px -10px;
    border-top: 2px solid #24243e;
    display: flex;
    justify-content: flex-end;
    flex-wrap: wrap;
    
}

.widget-item .contact-list {
    list-style: none;
    text-align: right;
    padding-right: 50px;
}

.widget-item .contact-list li {
    margin-bottom: 10px;
    font-size: 14px;
    padding-left: 30px;
    color: #fff;
}

/* Newsletter */
.newsletter {
    text-align: center;
}

.newsletter input {
    width: 200px;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-top: 10px;
    font-size: 14px;
    text-align: center;
}

.newsletter .site-btn {
    display: block;
    margin: 15px auto;
    padding: 10px 20px;
    background: #c62839;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    transition: 0.3s;
}

.newsletter .site-btn:hover {
    background: #a21b29;
}
/*gioi thieu*/
.hero img {
    width: 95%;
    max-height: 500px; /* Giới hạn chiều cao */
    object-fit: cover; /* Giữ nguyên tỷ lệ mà không méo ảnh */
    object-position: bottom; /* Hiển thị phần dưới của ảnh */
    display: block;
    margin: 120px auto;
        }
        
        .content h2 {
            color: #ddd;
            text-align: center;
            max-width: 800px;
            margin: 0px auto;
            font-size: 40px;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);

        }

h2::after {
    content: ""; /* Tạo phần tử giả để làm gạch chân */
    display: block;
    width: 10%; /* Điều chỉnh độ dài của gạch chân */
    height: 4px; /* Độ dày của gạch chân */
    background-color: #697184; /* Màu của gạch chân */
    position: absolute;
    left: 50%;
    bottom: 124px; /* Khoảng cách giữa chữ và gạch chân */
    transform: translateX(-50%); /* Căn giữa gạch chân */
}

.content p {
            color: #b1a6a4;
            max-width: 800px;
            margin: 40px auto;
            font-size: 18px;
            text-align: justify;
        }
.content h2 {
            color: #697184;
            text-align: center;
            max-width: 800px;
            margin: 0px auto;
            font-size: 40px;
            text-shadow: 0 0 10px rgba(177, 166, 164, 0.8);

        } 
.roles {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            color: #fff;
            font-size: 18px;
            padding: 20px 34px;
        }
        .role-item {
            width: 48%;
            background: rgba(105, 113, 131, 0.5);
            padding: 20px;
            border-radius: 10px;
        }
        .content h4 {
            color: #697184;
            text-align: center;
            max-width: 800px;
            margin: 0px auto;
            font-size: 40px;
            text-shadow: 0 0 10px rgba(177, 166, 164, 0.8);

        }
        h4 {
    position: relative;
    text-align: center;
    font-size: 40px;
    color: #697184;
    text-shadow: 0 0 10px rgba(177, 166, 164, 0.8);
    padding-top: 20px; /* Thêm khoảng cách từ trên xuống */
}

h4::before {
    content: "";
    display: block;
    width: 20%; /* Độ dài của gạch */
    height: 4px; /* Độ dày của gạch */
    background-color: #697184; /* Màu của gạch */
    position: absolute;
    top: -10px; /* Điều chỉnh vị trí gạch */
    left: 50%;
    transform: translateX(-50%);
}
/* Popup */
/* Popup */
/* Popup */
.popup {
    display: none; /* Ẩn ban đầu */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: linear-gradient(to bottom, #3a345e, #e05b82, #4a4b6a); /* Gradient nhẹ hơn */
    color: white;
    padding: 25px 50px; /* Tăng kích thước hộp */
    border-radius: 15px; /* Bo góc mềm mại */
    font-size: 20px; /* Chữ to hơn */
    font-weight: bold; /* Làm chữ đậm hơn */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* Đổ bóng nhẹ hơn */
    z-index: 9999;
    text-align: center; /* Căn giữa chữ */
    width: 300px; /* Chiều rộng hộp */
    opacity: 0.9; /* Làm màu nhẹ hơn một chút */
}




    </style>  
    </head>
    <body>
        <header class="header">
        <div class="container logo">
            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="site-logo">
                        <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
                    </div>
                    <div class="nav-switch">
                        <i class="fa fa-bars"></i>
                    </div>
                </div>
                <div class="col-lg-10 col-md-10">
                    <nav class="main-menu">
                        <ul>
                            <li><strong><a href="${pageContext.request.contextPath}/authen?action=home">Home</a></strong></li>
                        <li><strong><a href="${pageContext.request.contextPath}/view/courses/courses.jsp">Courses</a></strong></li>
                        <li><strong><a href="${pageContext.request.contextPath}/view/Contact/Contact.jsp">Contact</a></strong></li>
                        </ul>
                    </nav>
                </div>    
            </div>
        </div>
    </header>  
    <section class="hero">
        <img src="${pageContext.request.contextPath}/img/courses/16.jpg">
    </section>
    <section id="about" class="content">
        <h2>Introduction to Public Speaking Mastery</h2>
        <p>Python is one of the most widely used programming languages today, known for its simplicity, readability, and versatility. Whether you are an absolute beginner or someone looking to enhance your coding skills, learning Python is a great starting point.</p>
        <p>This course, Introduction to Python for Beginners, is designed to provide a strong foundation in programming concepts while keeping things engaging and practical. You will start with the basics, such as variables, data types, operators, and control flow structures like loops and conditional statements. As you progress, you will explore functions, modules, file handling, and error handling-key components that help you build robust programs.</p>
        <p>One of Python’s biggest advantages is its extensive ecosystem, with libraries and frameworks that support a variety of fields, including web development, data science, automation, and artificial intelligence. By the end of this course, you will have the skills to write clean, efficient Python scripts and solve real-world problems.</p>
        <p>This course is structured with hands-on coding exercises, real-world projects, and interactive learning resources to help you grasp concepts effectively. Whether your goal is to automate tasks, analyze data, or develop applications, this course will serve as the perfect stepping stone into the world of programming.</p>
        <p>Python’s beginner-friendly nature, combined with its powerful capabilities, makes it an ideal choice for new programmers. So, let's embark on this exciting journey into coding with Python!</p>
    </section>
    <section id="role" class="content">
        <h4>Role of Uni</h4>
        <div class="roles">
            <div class="role-item">
                <h3>For Schools & Teachers</h3>
                <ul>
                    <li>Enhancing Digital Literacy: This course equips educators with a structured approach to teaching Python, making it easier to integrate programming into the curriculum.</li>
                    <li>Providing Quality Learning Resources: Teachers can utilize interactive exercises and real-world coding examples to engage students effectively.</li>
                    <li>Tracking Student Progress: The course includes assessments and coding challenges that allow teachers to monitor student performance and guide them accordingly.</li>
                </ul>
            </div>
            <div class="role-item">
                <h3>For Students & Learners</h3>
                <ul>
                    <li>Building Strong Coding Foundations: Beginners gain a solid understanding of Python programming, from fundamental concepts to practical applications.</li>
                    <li>Developing Problem-Solving Skills: The course encourages logical thinking and hands-on practice, preparing students for real-world programming challenges.</li>
                    <li>Exploring Career Opportunities: Python is widely used in web development, data science, artificial intelligence, and automation, opening doors to various career paths.</li>
                </ul>
            </div>
        </div>
    </section>
    <section class="banner-section spad">
            <div class="container">
                <div class="section-title mb-0 pb-2">
                    <h2>Join Our Community Now!</h2>
                    <p>"If you want to go fast, go alone. If you want to go far, go together."</p>

                    <p>Success is better when shared! Become part of a thriving community where you can learn, grow, and achieve more—together.</p>
                </div>
                
            </div>
                <div class="widget-item">
                            <ul class="contact-list">
                                <li>Đại Học FPT Hà Nội<br>Group 2_SE1907</li>
                                <li>+84 969045182</li>
                                <li>yourmail@gmail.com</li>
                            </ul>
                        </div>
        </section>
<!-- Popup Dang ky thanh cong -->
<div id="successPopup" class="popup">
    <p>Registration successful</p>
    <p>Thank you for trusting us</p>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Lấy nút Register Now
        var registerBtn = document.querySelector(".site-btn");
        var popup = document.getElementById("successPopup");

        // Gắn sự kiện click vào nút
        registerBtn.addEventListener("click", function(event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

            // Hiển thị popup
            popup.style.display = "block";

            // Ẩn popup sau 2 giây
            setTimeout(function() {
                popup.style.display = "none";
            }, 2000);
        });
    });
</script>

    </body>
</html>

