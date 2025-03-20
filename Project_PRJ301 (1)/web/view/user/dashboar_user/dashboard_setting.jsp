<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Users" %>
<%
    // Lấy user từ session
    Users user = (Users) session.getAttribute("user");
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mini Finance - Settings</title>

        <!-- CSS FILES -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/tooplate-mini-finance.css" rel="stylesheet">

        <style>
           :root {
  --white-color:                  #ffffff;
  --primary-color:                #697184;
  --secondary-color:              #F1FAEE;
  --section-bg-color:             #ececec;
  --primary-bg-color:             #697184;
 
  --custom-btn-bg-hover-color:    #1D3557;
  --heading-color:                #1D3557;
  --dark-color:                   #000000;
  --p-color:                      #717275;
  --border-color:                 #e0e0e5;
  --link-hover-color:             #697184;

  --body-font-family:             'Unbounded';

  --h1-font-size:                 74px;
  --h2-font-size:                 46px;
  --h3-font-size:                 32px;
  --h4-font-size:                 28px;
  --h5-font-size:                 24px;
  --h6-font-size:                 22px;
  --p-font-size:                  18px;
  --menu-font-size:               14px;
  --btn-font-size:                12px;
  --copyright-font-size:          10px;

  --border-radius-large:          100px;
  --border-radius-medium:         20px;
  --border-radius-small:          10px;

  --font-weight-light:            300;
  --font-weight-normal:           400;
  --font-weight-bold:             700;
} 
            /* Điều chỉnh sidebar */
            #sidebarMenu {
                width: 240px;
                min-width: 240px;
                max-width: 240px;
            }
            /* Điều chỉnh nội dung chính */
            .main-wrapper {
                margin-left: 240px;
                padding: 30px;
                overflow-x: hidden;
            }
            /* Chỉnh sửa khoảng cách form */
            .profile-form .form-control, .password-form .form-control {
                margin-bottom: 15px;
            }
            /* Căn chỉnh nút Reset & Update */
            .d-flex button {
                padding: 10px;
                font-size: 1em;
            }
            /* Chỉnh sửa dropdown notifications */
            .dropdown .notifications-block-wrap {
                max-width: 300px;
                word-wrap: break-word;
            }
            
.body {
  background-color: var(--white-color);
  font-family: var(--body-font-family); 
}

       
#sidebarMenu .nav {
  flex-wrap: inherit;
}

#sidebarMenu .nav-link {
  border-radius: var(--border-radius-small);
  color: var(--p-color);
  font-size: var(--menu-font-size);
  display: inline-block;
  position: relative;
  margin-top: 5px;
}

#sidebarMenu .nav-link.active, 
#sidebarMenu .nav-link:hover {
  background: #697184;
  color: var(--white-color);
}     
 .btn-danger {
    color: #fff;
    background-color: #697184;
    border-color: #697184;
}
:root {
 
  --custom-btn-bg-color:          #B1A6A4;
;
}
.navbar {
  background: #413F3D;
  border-bottom: 1px solid var(--border-color);
  padding-top: 8px;
  padding-bottom: 8px;
}

.navbar .nav-link {
  position: relative;
}

.navbar .header-form {
  width: 35%;
}

.navbar .header-form .form-control {
  margin-bottom: 0;
}

.navbar .dropdown-toggle::after {
  display: none;
}
.tab-content {
  background-color: var(--white-color);
  border-radius: var(--border-radius-medium);
}

.nav-tabs {
  border-bottom: 1px solid var(--border-color);
  margin-bottom: 35px;
}

.nav-tabs .nav-link {
  border-radius: 0;
  border-top: 0;
  border-right: 0;
  border-left: 0;
  color: var(--p-color);
  font-size: var(--menu-font-size);
  font-weight: var(--font-weight-normal);
  padding: 15px 25px;
  transition: all 0.3s;
}

.nav-tabs .nav-item.show .nav-link, 
.nav-tabs .nav-link.active,
.nav-tabs .nav-link:focus, 
.nav-tabs .nav-link:hover {
  border-bottom-color: #B1A6A4;
  color: #FFF;
}
.nav-tabs .nav-item.show .nav-link,.nav-tabs .nav-link.active {
    color: #495057;
    background-color: #B1A6A4;
    border-color: #dee2e6 #dee2e6 #fff
}
        </style>
    </head>

    <body>
        <header class="navbar sticky-top flex-md-nowrap">
            <div class="col-md-3 col-lg-3 me-0 px-3 fs-6">
                <div class="site-logo">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo">
                </div>
            </div>

            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button"
                    data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-nav me-lg-2">
                <div class="nav-item text-nowrap d-flex align-items-center">
                    <div class="dropdown px-3">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://www.caythuocdangian.com/wp-content/uploads/anh-dai-dien-47.jpg" class="profile-image img-fluid" alt="">
                        </a>
                        <ul class="dropdown-menu bg-white shadow">
                            <li>
                                <div class="dropdown-menu-profile-thumb d-flex">
                

                                    <div class="d-flex flex-column">
                                        <small><span><%= user != null ? user.getFull_name() : "N/A" %></span></small>
                                        <a href="#"><%= user != null ? user.getEmail() : "N/A" %></a>
                                    </div>
                                </div>
                            </li>
                            <li class="border-top mt-3 pt-2 mx-4">
                                <a class="dropdown-item ms-0 me-0" href="${pageContext.request.contextPath}/authen?action=logout">
                                    <i class="bi-box-arrow-left me-2"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-3 d-md-block sidebar collapse">
                    <jsp:include page="../../common/user/sidebarMenu.jsp"></jsp:include>
                </nav>

                <main class="main-wrapper col-md-9 ms-sm-auto py-4 col-lg-9 px-md-4 border-start">
                    <div class="title-group mb-3">
                        <h1 class="h2 mb-0">Settings</h1>
                    </div>

                    <div class="row my-4">
                        <div class="col-lg-12 col-12">
                            <div class="custom-block bg-white">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab">Profile</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="password-tab" data-bs-toggle="tab" data-bs-target="#password-tab-pane" type="button" role="tab">Password</button>
                                    </li>
                                </ul>

                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="profile-tab-pane">
                                        <h6 class="mb-4">User Profile</h6>

                                        <c:if test="${not empty message}">
                                            <div class="alert alert-success" role="alert">
                                                ${message}
                                            </div>
                                            <c:remove var="message" scope="session"/>
                                        </c:if>

                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger" role="alert">
                                                ${error}
                                            </div>
                                            <c:remove var="error" scope="session"/>
                                        </c:if>

                                        <form class="custom-form profile-form" action="${pageContext.request.contextPath}/user/settings?action=account" method="post">
                                            <input class="form-control" type="text" name="profile-name" value="${user.full_name}" placeholder="Enter your name">
                                            <input class="form-control" type="email" name="profile-email" value="${user.email}" placeholder="Enter your email">

                                            <div class="d-flex">
                                                <button type="reset" class="form-control me-3">Reset</button>
                                                <button type="submit" class="form-control ms-2">Update</button>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="tab-pane fade" id="password-tab-pane">
                                        <h6 class="mb-4">Password</h6>

                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger" role="alert">
                                                ${errorMessage}
                                            </div>
                                            <c:remove var="errorMessage" scope="session"/>
                                        </c:if>

                                        <c:if test="${not empty successMessage}">
                                            <div class="alert alert-success" role="alert">
                                                ${successMessage}
                                            </div>
                                            <c:remove var="successMessage" scope="session"/>
                                        </c:if>

                                        <form class="custom-form password-form" action="${pageContext.request.contextPath}/user/settings?action=pass" method="post">
                                            <input type="password" name="password" class="form-control" placeholder="Current Password" required>
                                            <input type="password" name="new_password" class="form-control" placeholder="New Password" required>
                                            <input type="password" name="confirm_password" class="form-control" placeholder="Confirm Password" required>

                                            <div class="d-flex">
                                                <button type="button" class="form-control me-3">Reset</button>
                                                <button type="submit" class="form-control ms-2">Update Password</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/custom.js"></script>
    </body>
</html>
