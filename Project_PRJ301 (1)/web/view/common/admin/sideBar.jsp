<%-- 
    Document   : sideBar
    Created on : Mar 8, 2025, 11:52:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .sidebar-link.active, .nav-link.active {
                background-color: #697184;
                color: white !important;
            }
        </style>
    </head>
    <body>
        <nav id="sidebar">

            <!-- Sidebar -->
            <div class="sidebar d-flex flex-column p-3">
                <h4 class="text-center py-3 border-bottom">TicketBox Admin</h4>
                <ul class="list-unstyled components">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/course" class="nav-link sidebar-link" id="course-link">
                            <i class="material-icons">book</i><span>Manage Courses</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/enrollments" class="nav-link sidebar-link" id="enrollments-link">
                            <i class="material-icons">group</i><span>Manage Enrollments</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/user" class="nav-link sidebar-link" id="user-link">
                            <i class="material-icons">person</i><span>Manage Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/room" class="nav-link sidebar-link" id="room-link">
                            <i class="material-icons">meeting_room</i><span>Manage Rooms</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Content Area -->
            <div class="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/view/admin/dashboard_profile.jsp" id="profile-link">Profile</a>
                                </li>
                                <li class="nav-link">
                                    <a href="${pageContext.request.contextPath}/authen?action=home">Home</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- Your page content goes here -->
            </div>

        </nav>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let links = document.querySelectorAll(".sidebar-link, .nav-link"); // Chọn cả sidebar và navbar
                let currentPage = window.location.pathname;

                links.forEach(link => {
                    if (link.getAttribute("href").includes(currentPage)) {
                        link.classList.add("active");
                    }

                    link.addEventListener("click", function () {
                        localStorage.setItem("activeNav", this.getAttribute("href"));
                    });
                });

                let activeNav = localStorage.getItem("activeNav");
                if (activeNav) {
                    links.forEach(link => {
                        if (link.getAttribute("href") === activeNav) {
                            link.classList.add("active");
                        } else {
                            link.classList.remove("active");
                        }
                    });
                }
            });
        </script>
    </body>
</html>


