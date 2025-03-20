<%-- 
    Document   : home
    Created on : Mar 2, 2025, 11:02:42 AM
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>WebUni - Education Template</title>
        <meta charset="UTF-8">
        <meta name="description" content="WebUni Education Template">
        <meta name="keywords" content="webuni, education, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Favicon -->   
        <link href="img/favicon.ico" rel="shortcut icon"/>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">

        <!-- Stylesheets -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>


        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header section -->
        <jsp:include page="../common/homePage/headerSection.jsp"></jsp:include>
        <!-- Header section end -->


        <!-- Hero section -->
        <jsp:include page="../common/homePage/heroSection.jsp"></jsp:include>
        <!-- Hero section end -->


        <!-- categories section -->
        <jsp:include page="../common/homePage/categoriesSection.jsp"></jsp:include>
        <!-- categories section end -->


        <!-- search section -->
        <jsp:include page="../common/homePage/searchSection.jsp"></jsp:include>
        <!-- search section end -->


        <!-- course section -->
        <jsp:include page="../common/homePage/courseSection.jsp"></jsp:include>
        <!-- course section end -->


        <!-- signup section -->
        <jsp:include page="../common/homePage/sigupSection.jsp"></jsp:include>
        <!-- signup section end -->


        <!-- banner section -->
        <jsp:include page="../common/homePage/bannerSection.jsp"></jsp:include>
        <!-- banner section end -->


        <!-- footer section -->
        <jsp:include page="../common/homePage/footerSection.jsp"></jsp:include>
        <!-- footer section end -->


        <!--====== Javascripts & Jquery ======-->
        <script <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
        <script <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
        <script <script src="${pageContext.request.contextPath}/js/circle-progress.min.js"></script>
        <script <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script <script src="${pageContext.request.contextPath}/js/main.js"></script>
</html>