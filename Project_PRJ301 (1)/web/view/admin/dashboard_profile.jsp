<!doctype html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="model.Users" %>
<%
    // L?y user t? session
    Users user = (Users) session.getAttribute("user");
%>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>crud dashboard</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!----css3---->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">


        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">


        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">
        
        <style>
            .profile-info {
                padding: 50px;
            }
        </style>

    </head>
    <body>


        <div class="wrapper">


            <div class="body-overlay"></div>

            <!-------------------------sidebar------------>
            <!-- Sidebar  -->
            <jsp:include page="../common/admin/sideBar.jsp"></jsp:include>




                <!--------page-content---------------->

                <div id="content">



                    <div class="top-navbar">
                        <div class="xp-topbar">

                            <!-- Start XP Row -->
                            <div class="row"> 
                                <!-- Start XP Col -->
                                <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                                    <div class="xp-menubar">
                                        <span class="material-icons text-white">signal_cellular_alt
                                        </span>
                                    </div>
                                </div> 
                                <!-- End XP Col -->

                                <!-- Start XP Col -->
                                <div class="col-md-5 col-lg-3 order-3 order-md-2">
                                    <div class="xp-searchbar">
                                        <form id="searchForm" action="${pageContext.request.contextPath}/admin/user?action=search" method="post">
                                        
                                    </form>

                                </div>
                            </div>
                            <!-- End XP Col -->

                            <!-- Start XP Col -->
                            <div class="col-10 col-md-6 col-lg-8 order-1 order-md-3">
                                <div class="xp-profilebar text-right">
                                    <nav class="navbar p-0">
                                        <ul class="nav navbar-nav flex-row ml-auto">   
                                            <li class="dropdown nav-item active">
                                                
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a href="#">You have 5 new messages</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">You're now friend with Mike</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Wish Mary on her birthday!</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">5 warnings in Server Console</a>
                                                    </li>

                                                </ul>
                                            </li>
                                            <li class="nav-item">
                                                
                                            </li>
                                            <li class="nav-item dropdown">
                                                <a class="nav-link" href="#" data-toggle="dropdown">
                                                    <img src="img/user.jpg" style="width:40px; border-radius:50%;"/>
                                                    <span class="xp-user-live"></span>
                                                </a>
                                                <ul class="dropdown-menu small-menu">
                                                    <li>
                                                        
                                                    </li>
                                                    <li>
                                                        
                                                    </li>
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/authen?action=logout"><span class="material-icons">
                                                                logout</span>Logout</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>


                                    </nav>

                                </div>
                            </div>
                            <!-- End XP Col -->

                        </div> 
                        <!-- End XP Row -->

                    </div>
                    <div class="xp-breadcrumbbar text-center">
                        <h4 class="page-title">Dashboard</h4>  
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Booster</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                        </ol>                
                    </div>

                </div>



                <!--------main-content------------->

                <%-- Hi?n th? thông báo thành công --%>
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sessionScope.successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%-- Xóa thông báo sau khi hi?n th? ?? tránh b? hi?n th? l?i khi t?i l?i trang --%>
                    <c:remove var="successMessage" scope="session"/>
                </c:if>

                <%-- Hi?n th? thông báo l?i --%>
                <c:if test="${not empty sessionScope.errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${sessionScope.errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <c:remove var="errorMessage" scope="session"/>
                </c:if>


                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">Manage Users</h2>
                                        </div>

                                        <!-- add-->
    <!--                                    <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
                                            <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addUserModal">
                                                <i class="material-icons">&#xE147;</i> <span>Add User</span>
                                            </a>
                                        </div>   -->


                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    
                                    
                                <div class="profile-info">
                                        <p><strong>Name:</strong> <span><%= user != null ? user.getFull_name() : "N/A" %></span></p>
                                    <p><strong>Email:</strong> <a href="#"><%= user != null ? user.getEmail() : "N/A" %></a></p>
                                    <p><strong>Admin ID:</strong> <span><%= user != null ? user.getUser_id() : "N/A" %></span></p>
                                    <p><strong>Role:</strong> <span><%= user != null ? user.getRole() : "N/A" %></span></p>
                                    <p><strong>Status:</strong> <span><%= user != null ? user.getStatus() : "N/A" %></span></p>
                                </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Add User -->
                        <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addUserForm" action="${pageContext.request.contextPath}/admin/user?action=add" method="post">
                                            <div class="mb-3">
                                                <label for="addFullName" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="addFullName" name="full_name" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="addEmail" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="addEmail" name="email" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="addPassword" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="addPassword" name="password" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="addRole" class="form-label">Role</label>
                                                <select class="form-control" id="addRole" name="role" required>
                                                    <option value="ADMIN">Admin</option>
                                                    <option value="INSTRUCTOR">Instructor</option>
                                                    <option value="STUDENT">Student</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <label for="addStatus" class="form-label">Status</label>
                                                <select class="form-control" id="addStatus" name="status" required>
                                                    <option value="ACTIVE">Active</option>
                                                    <option value="BLOCKED">Inactive</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <button type="submit" class="btn btn-primary">Add User</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <!-- Modal Edit User -->
                        <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editUserForm" action="${pageContext.request.contextPath}/admin/user?action=edit" method="post">
                                            <input type="hidden" id="editUserId" name="user_id">

                                            <div class="mb-3">
                                                <label for="editFullName" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="editFullName" name="full_name" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editEmail" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="editEmail" name="email" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editPassword" class="form-label">Password (leave blank to keep current password)</label>
                                                <input type="password" class="form-control" id="editPassword" name="password" placeholder="Enter new password (optional)">
                                            </div>

                                            <div class="mb-3">
                                                <label for="editRole" class="form-label">Role</label>
                                                <select class="form-control" id="editRole" name="role" required>
                                                    <option value="STUDENT">STUDENT</option>
                                                    <option value="INSTRUCTOR">INSTRUCTOR</option>
                                                    <option value="ADMIN">ADMIN</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editStatus" class="form-label">Status</label>
                                                <select class="form-control" id="editStatus" name="status" required>
                                                    <option value="ACTIVE">ACTIVE</option>
                                                    <option value="INACTIVE">Inactive</option>
                                                </select>
                                            </div>

                                            <div class="mb-3">
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>







                        <!-- Modal Delete -->
                        <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteUserModalLabel">Confirm Delete</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to delete this user?</p>
                                        <p><strong>User ID:</strong> <span id="deleteUserIdText"></span></p>
                                        <p><strong>Full Name:</strong> <span id="deleteUserName"></span></p>
                                    </div>
                                    <div class="modal-footer">
                                        <form id="deleteUserForm" action="${pageContext.request.contextPath}/admin/user?action=delete" method="post">
                                            <input type="hidden" id="deleteUserId" name="user_id">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>




                    </div>


                    <!---footer---->


                </div>

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="footer-in">
                            <p class="mb-0">&copy; 2025 FPT University. All Rights Reserved.</p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>


        <!----------html code compleate----------->









        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.slim.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


        <script>
            $(document).ready(function () {
                // Khi nh?n nút "Edit", l?y d? li?u và hi?n th? vào modal
                $('body').on('click', '.edit-btn', function () {
                    var userData = $(this).data();

                    // Gán d? li?u vào các input trong modal ch?nh s?a
                    $('#editUserId').val(userData.userid);
                    $('#editFullName').val(userData.fullname);
                    $('#editEmail').val(userData.email);
                    $('#editRole').val(userData.role);
                    $('#editStatus').val(userData.status);

                    $('#editPassword').val('');


                    // Hi?n th? modal ch?nh s?a
                    var modal = new bootstrap.Modal(document.getElementById('editUserModal'));
                    modal.show();
                });


                // Khi nh?n nút "Add User", m? modal và ??t giá tr? m?c ??nh
                $('body').on('click', '.add-btn', function () {
                    // Reset các input tr??c khi m? modal
                    $('#addFullName').val('');
                    $('#addEmail').val('');
                    $('#addPassword').val('');
                    $('#addRole').val('Admin'); // Giá tr? m?c ??nh
                    $('#addStatus').val('Active'); // Giá tr? m?c ??nh

                    // Hi?n th? modal thêm user
                    var modal = new bootstrap.Modal(document.getElementById('addUserModal'));
                    modal.show();
                });

                // Ki?m tra form tr??c khi submit (?? tránh g?i d? li?u tr?ng)
                $('#addUserForm').submit(function (event) {
                    var fullName = $('#addFullName').val().trim();
                    var email = $('#addEmail').val().trim();
                    var password = $('#addPassword').val().trim();
                    var role = $('#addRole').val();
                    var status = $('#addStatus').val();

                    if (fullName === '' || email === '' || password === '' || role === '' || status === '') {
                        alert('Vui lòng nh?p ??y ?? thông tin!');
                        event.preventDefault();
                    }
                });

                // Ki?m tra form tr??c khi submit ch?nh s?a user
                $('#editUserForm').submit(function (event) {
                    var fullName = $('#editFullName').val().trim();
                    var email = $('#editEmail').val().trim();
                    var role = $('#editRole').val();
                    var status = $('#editStatus').val();

                    if (fullName === '' || email === '' || role === '' || status === '') {
                        alert('Vui lòng nh?p l?i thông tin ');
                        event.preventDefault();
                    }
                });
            });
            
            $(document).ready(function () {
                // Khi click vào nút Delete
                $('body').on('click', '.delete-btn', function () {
                    var userId = $(this).data('userid');
                    var fullName = $(this).data('fullname');

                    // Gán d? li?u vào modal
                    $('#deleteUserIdText').text(userId);
                    $('#deleteUserName').text(fullName);
                    $('#deleteUserId').val(userId);

                    // Hi?n th? modal
                    var deleteModal = new bootstrap.Modal(document.getElementById('deleteUserModal'));
                    deleteModal.show();
                });
            });




        </script>

    </body>

</html>


