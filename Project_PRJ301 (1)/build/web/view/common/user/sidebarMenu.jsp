<%-- 
    Document   : sidebarMenu
    Created on : Mar 11, 2025, 1:33:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URL"%>
<%
    String currentURL = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .nav-link.active {
                font-weight: bold;
                color: #ffffff !important;
                background-color: #697184 !important;
                border-radius: 8px;
                padding: 10px;
            }

        </style>
    </head>
    <body>
        <div class="position-sticky py-4 px-3 sidebar-sticky">
            <ul class="nav flex-column h-100">

                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("/dashboard_user_course.jsp") ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/view/user/dashboar_user/dashboard_user_course.jsp">
                        <i class="bi-wallet me-2"></i>
                        Course
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("/dashboard_profile.jsp") ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/view/user/dashboar_user/dashboard_profile.jsp">
                        <i class="bi-person me-2"></i>
                        Profile
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("/dashboard_setting.jsp") ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/view/user/dashboar_user/dashboard_setting.jsp">
                        <i class="bi-gear me-2"></i>
                        Settings
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("/dashboard_help.jsp") ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/view/user/dashboar_user/dashboard_help.jsp">
                        <i class="bi-question-circle me-2"></i>
                        Help Center
                    </a>
                </li>

                <li class="nav-item border-top mt-auto pt-2">
                    <a class="nav-link <%= currentURL.contains("/authen?action=home") ? "active" : "" %>" 
                       href="${pageContext.request.contextPath}/authen?action=home">
                        <i class="bi-box-arrow-left me-2"></i>
                        Home
                    </a>
                </li>

            </ul>
        </div>
    </body>
</html>