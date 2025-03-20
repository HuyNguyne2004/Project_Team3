<%-- 
    Document   : Contact
    Created on : Mar 15, 2025, 10:09:55 PM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Artificial Intelligence Basics</title>
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
            position: relative;
            left: 24%;
            transform: translateX(-50%);
            width: auto; /* Không giới hạn chiều rộng */
            white-space: nowrap; /* Không xuống dòng */
            text-align: center;
            color: #ddd;
            justify-content: center;
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
    bottom: 490px; /* Khoảng cách giữa chữ và gạch chân */
    transform: translateX(-50%); /* Căn giữa gạch chân */
}

.content p {
            color: #b1a6a4;
            max-width: 800px;
            margin: 20px auto;
            font-size: 18px;
            text-align: justify;
        }
.content h2 {
            color: #697184;
            text-align: center;
            max-width: 800px;
            margin: 80px auto;
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
    padding-top: 60px; /* Thêm khoảng cách từ trên xuống */
}

h4::before {
    content: "";
    display: block;
    width: 20%; /* Độ dài của gạch */
    height: 4px; /* Độ dày của gạch */
    background-color: #697184; /* Màu của gạch */
    position: absolute;
    top: 35px; /* Điều chỉnh vị trí gạch */
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
.hoanho {
                width: 100%;
                height: 150px;
                background:  #413F3D;
                border-radius: 10px;
                
                padding: 90px 40px 40px 40px;
                color: #fff;
                font-size: 20px;
                font-weight: bold;
                text-align: center;
                text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
                
            }

footer {
            background-color: #413F3D;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        footer p {
            font-size: 16px;
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
    <div class="hoanho">
        <h1>FPT University Courses</h1>
        <p>Contact us for consultation and enrollment in the courses:</p>
    </div>
    <section id="about" class="content">
        <h2>Why Choose Our Courses?</h2>
        <p><strong>Diverse Course Offerings:</strong> Over 1,000 courses in various fields including Programming, Marketing, Design, Business Management, Foreign Languages, etc. Always up-to-date to meet job market needs.</p>
        <p><strong>Dedicated Instructors:</strong> Experienced professionals who inspire and provide high-quality, engaging lessons.</p>
        <p><strong>Modern Learning Methods:</strong> Advanced online learning with engaging video lectures, practical exercises, and skill assessments.</p>
        <p><strong>Learn Anytime, Anywhere:</strong> Study at your own pace, with flexible schedules.</p>
        <p><strong>Affordable Tuition:</strong> Competitive pricing with various discounts and promotions.</p>
        <p><strong>Comprehensive Support:</strong> Our team is available 24/7 to assist you with any questions.</p>
    </section>
    <section id="role" class="content">
        <h4>Role of Uni</h4>
        <div class="roles">
            <div class="role-item">
                <h3>Contact Information</h3>
                <ul>
                    <li><strong>Campus:</strong> FPT University</li>
                    <br>
                    <li><strong>Phone:</strong> 0969045182</li>
                    <br>
                    <li><strong>Email:</strong> yourmail@gmail.com</li>
                    <br>
                    <li><strong>Working Hours:</strong> Monday to Friday, 8:00 AM - 6:00 PM</li>
                    <br>
                    <li><strong>Location on Map:</strong> <a href="https://maps.app.goo.gl/2fCKEApuEHgCGPMS8?g_st=com.google.maps.preview.copy" target="_blank">Google Maps</a></li>
                    
                </ul>
            </div>
            <div class="role-item">
                <h3>Why Choose Our Courses?</h3>
                <ul>
                    <li><strong>Diverse Course Offerings:</strong> Over 1,000 courses in various fields including Programming, Marketing, Design, Business Management, Foreign Languages, etc. Always up-to-date to meet job market needs.</li>
                <li><strong>Dedicated Instructors:</strong> Experienced professionals who inspire and provide high-quality, engaging lessons.</li>
                <li><strong>Modern Learning Methods:</strong> Advanced online learning with engaging video lectures, practical exercises, and skill assessments.</li>
                <li><strong>Learn Anytime, Anywhere:</strong> Study at your own pace, with flexible schedules.</li>
                <li><strong>Affordable Tuition:</strong> Competitive pricing with various discounts and promotions.</li>
                <li><strong>Comprehensive Support:</strong> Our team is available 24/7 to assist you with any questions.</li>
                </ul>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
            <p>&copy; 2025 FPT University. All Rights Reserved.</p>
        </div>
    </footer>

    </body>
</html>

