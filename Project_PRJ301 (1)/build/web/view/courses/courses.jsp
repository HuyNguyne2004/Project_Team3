<%-- 
    Document   : courses
<<<<<<< Updated upstream
    Created on : Mar 7, 2025, 1:01:07 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="courses/html; charset=UTF-8">
    <title>WebUni - Coures</title>
    <style>
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
        .site-logo img {
            height: 50px; /* Chiá»u cao logo, tÃ¹y chá»nh theo Ã½ muá»n */
        }
        .site-logo {
            position: fixed;  /* Giá»¯ cá» Äá»nh khi cuá»n */
            top: 20px;        /* CÃ¡ch mÃ©p trÃªn 20px */
            left: 20px;       /* CÃ¡ch mÃ©p trÃ¡i 20px */
            z-index: 999;     /* Æ¯u tiÃªn hiá»n thá» trÃªn cÃ¡c pháº§n tá»­ khÃ¡c */
        }

        .course-filter {
            display: flex;
            justify-content: flex-end; /* Căn phần All sang phải */
            margin-top: 10px;
            padding-right: 540px; /* Tạo khoảng cách từ lề phải */


        }

        .control:first-child {
            margin-left: auto;  /* CÄn "All" sang trÃ¡i */
            margin-right: auto; /* CÄn "All" sang pháº£i */
        }
        .control {
            background-color: transparent;
            border: none;
            color: #333;
            font-size: 20px;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none; /* Loáº¡i bá» gáº¡ch chÃ¢n máº·c Äá»nh */
            transition: color 0.3s;
        }
        .control.active {
            color: #cc204c; /* MÃ u chá»¯ khi chá»n */
            text-decoration: underline; /* Gáº¡ch chÃ¢n khi ÄÆ°á»£c chá»n */
        }
        .control:hover {
            color: #cc204c; /* MÃ u chá»¯ khi hover */
            text-decoration: underline; /* Gáº¡ch chÃ¢n khi hover */
        }
        .control:not(.active) {
            color:#fff;
        }
        .container {
            width: 100vw; /* Chiáº¿m toÃ n bá» chiá»u ngang */
            max-width: none; /* KhÃ´ng giá»i háº¡n kÃ­ch thÆ°á»c */
            padding: 0; /* Loáº¡i bá» padding */
            margin: 0; /* Loáº¡i bá» margin */
        }
        .header-container {
            position: relative;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between; /* Logo trÃ¡i, search pháº£i, menu giá»¯a */
            padding: 0px -10px;
            z-index: 999;
            margin-top: 5px;
        }
        .search-container {
            color: white;
            text-align: center;
            padding: 0;
            margin-right: 20px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-top: -25px;
        }
        .search-fields {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .search-input {
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            margin-right: 10px;
        }
        .search-btn {
            padding: 8px 15px;
            background-color: #697184;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-btn:hover {
            background-color: #b71c1c;
        }
        h1 {
            text-align:inherit;
            color: var(--text-color);
            font-weight: bold;
            color: #697184;
            margin-left: 20px;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
        }
        .course-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            align-items: stretch;
        }
        .course-card {
            display: flex;
            flex-direction: column; /* Xáº¿p cÃ¡c pháº§n tá»­ theo chiá»u dá»c */
            justify-content: space-between; /* CÄn Äá»u ná»i dung */
            width: 320px; /* Äáº£m báº£o chiá»u rá»ng cá» Äá»nh */

            padding: 20px; /* Khoáº£ng cÃ¡ch bÃªn trong */
            border-radius: 10px; /* Bo gÃ³c */
            border: 0.5px solid #000; /* Viá»n */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Äá» bÃ³ng */
            background: linear-gradient(to bottom, #cc204c); /* Ná»n gradient */
            color: #fff; /* MÃ u chá»¯ */
            font-size: 20px; /* Cá»¡ chá»¯ */
            font-weight: bold; /* Äá» Äáº­m */
            transition: all 0.3s ease-in-out; /* Hiá»u á»©ng chuyá»n Äá»ng */
            overflow: hidden; /* áº¨n pháº§n trÃ n */
        }

        .course-card:hover {
            transform: translateY(-5px);
            background: var(--hover-bg);
        }
        .course-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }
        .course-content {
            padding: 20px;
            color:#fff;
            margin: 10px 0;
            gap: 10px;
        }
        .course-title {
            font-size: 18px;
            font-weight: normal;
            color: var(--text-color);
            text-align:justify;
            margin: 5px 0;
            padding: 10px;
            color: #697184;
            text-shadow: 5px 5px 10px rgba(242, 241, 239, 1.8);
        }
        .course-desc {
            font-size: 14px;
            color: #333;
            margin: 10px 0;
            color:#fff;
        }
        .btn-course {
            display: flex;
            padding: 10px 0px 10px 10px;
            background: var(--secondary-color);
            color:#fff;
            text-decoration: none;
            border-radius: 5px;
            text-align:justify;
            width: 100%;
            font-weight: bold;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
            background-color: #697184;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        .btn-course:hover {
            background: var(--primary-color);
        }
        .btn-success {
            display: flex;
            padding: 10px 15px 10px 10px;
            background: var(--secondary-color);
            color:#828080;
            text-decoration: none;
            border-radius: 5px;
            text-align:justify;
            width: 100%;
            font-weight: bold;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
            background-color: #fff;
            font-family: Arial, sans-serif;
            font-size: 20px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        .btn-success:hover {
            background: var(--primary-color);
        }
        .main-menu {
            text-align: center; /* cÄn giá»¯a menu tá»ng thá» */
            margin-top: 20px; /* Äáº©y cáº£ menu xuá»ng phÃ­a dÆ°á»i */
            flex-grow: 1;
            display: flex;
            justify-content: center;
            padding-right: 105px;
        }


        .main-menu ul {
            display: flex;
            align-items: center;
            list-style-type: none; /* loáº¡i bá» dáº¥u cháº¥m cá»§a danh sÃ¡ch */
            padding: 0;
            margin: 0;

        }


        .main-menu ul li {
            display: inline-block; /* menu náº±m ngang */
            margin: 0 15px; /* khoáº£ng cÃ¡ch giá»¯a cÃ¡c má»¥c menu */
        }

        .main-menu ul li a {
            color: #fff; /* mÃ u chá»¯ máº·c Äá»nh */
            text-decoration: none; /* bá» gáº¡ch chÃ¢n */
            transition: color 0.3s ease;
            font-size: 18px;
        }
        .main-menu ul li a:hover,
        .main-menu ul li a.active {
            color: #cc204c; /* mÃ u khi hover hoáº·c active */
        }
        .header  {
            position: fixed; /* Cá» Äá»nh header khi cuá»n */
            top: 0;
            left: 0;
            width: 100%;
            background-color: rgba(177, 166, 164, 0.98); /* ná»n Äáº­m Äá» ná»i báº­t trÃªn cÃ¡c pháº§n khÃ¡c */
            display: flex;
            align-items: center; /* Canh logo vÃ  menu theo chiá»u dá»c */
            justify-content: space-between; /* Logo trÃ¡i, menu pháº£i */
            padding: 20px 10px; /* Khoáº£ng cÃ¡ch bÃªn trong header */
            z-index: 1000; /* LuÃ´n ná»i trÃªn cÃ¹ng */

        }
        .container logo{
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .thanh ngang {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            max-width: 100vw; /* Giới hạn chiều rộng tối đa bằng khung màn hình */
            overflow-x: hidden; /* Ngăn cuộn ngang nếu có phần tử vượt quá khung */
        }


        /* Phần banner */
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
            margin: 0 auto;
        }
        .text-center {
            padding-top: 40px;
        }

        .text-center .site-btn {
            display: center;
            margin-top: 30px;
            background: var(--secondary-color);
            color: #fff;
            text-decoration: none;
            text-align: justify;
            font-weight: bold;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 8px 4px rgba(0, 0, 0, 0.2);
            padding: 12px 24px;
            display: inline-block;
            background-color: #697184;
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
            background: #697184;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .newsletter .site-btn:hover {
            background: #697184;
        }



    </style>
</head>

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
<div style="height: 80px;"></div> <!-- Giữ khoảng trống để tránh nội dung bị che khuất bởi header cố định -->                     
</body>  
<body>
    <div class="container">
        <div class="header-container">
            <h1><strong>COURSES</strong></h1>
                         
        </div>        
        <div class="course-container">

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/1.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Python for Beginners</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/PythonForBeginners.jsp" class="btn-course">View courses</a>
                    <!-- Chuyển hướng đến trang xác nhận đăng ký -->
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="1011">
                        <button type="submit" class="btn-success">Register</button>
                    </form>

                </div>
            </div>


            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/2.jpg" class="course-image" >
                <div class="course-content">
                    <div class="course-title">HTML & CSS</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/html-css.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="1022">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/3.jpg" class="course-image" >
                <div class="course-content">
                    <div class="course-title">JavaScript Essentials</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/JavaScriptEssentials.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="1033">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/4.jpg" class="course-image" >
                <div class="course-content">
                    <div class="course-title">ReactJS Advanced</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/ReactjsAdvanced.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="1044">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>
            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/5.jpg" class="course-image" >
                <div class="course-content">
                    <div class="course-title">Full-Stack Web Development</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/FullStackWebDevelopment.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="1055">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/6.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Machine Learning Basics</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/MachineLearningBasics.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="1066">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/9.jpg" class="course-image" >
                <div class="course-content">
                    <div class="course-title">Financial Analysis and Modeling</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/FinancialAnalysisAndModeling.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="2011">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/10.jpg" class="course-image" >
                <div class="course-content">
                    <div class="course-title">Digital Marketing Mastery</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/DigitalMarketingMastery.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="2022">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/11.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Business Strategy and Management</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/BusinessStrategyAndManagement.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="2033">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/12.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Stock Market Investment</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/FStockMarketInvestment.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="2044">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/13.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Graphic Design with Adobe Photoshop</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/GraphicDesignWithAdobePhotoshop.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="3011">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/14.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">UI/UX Design Essentials</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/UiUxDesignEssentials.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="3022">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/15.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Photography and Editing</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/PhotographyAndEditing.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="3033">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/16.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Public Speaking Mastery</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/PublicSpeakingMastery.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="4011">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/17.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Project Management Essentials</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/ProjectManagementEssentials.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="4022">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/18.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Data Science with Python</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/DataScienceWithPython.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="4033">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/19.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Artificial Intelligence Basics</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/ArtificialIntelligenceBasics.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="4044">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

            <div class="course-card">
                <img src="${pageContext.request.contextPath}/img/courses/20.jpg" class="course-image">
                <div class="course-content">
                    <div class="course-title">Video Editing</div>
                    <a href="${pageContext.request.contextPath}/view/courses/register/VideoEditing.jsp" class="btn-course">View courses</a>
                    <form action="${pageContext.request.contextPath}/view/user/register_user/registerConfirm.jsp" method="GET">
                        <input type="hidden" name="courseId" value="4055">
                        <button type="submit" class="btn-success">Register</button>
                    </form>
                </div>
            </div>

        </div>
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
                    <li>1481 Creekside Lane <br>Avila Beach, CA 931</li>
                    <li>+53 345 7953 32453</li>
                    <li>yourmail@gmail.com</li>
                </ul>
            </div>
        </section>
    </div> 
</body>
</html>
