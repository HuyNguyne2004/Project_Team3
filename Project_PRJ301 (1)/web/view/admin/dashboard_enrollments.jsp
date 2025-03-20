<!doctype html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

                                <!-- Search -->
                                <div class="col-md-5 col-lg-3 order-3 order-md-2">
                                    <div class="xp-searchbar">
                                        <form id="searchForm" action="${pageContext.request.contextPath}/admin/enrollments?action=search" method="post">
                                        
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
                <%-- Hi?n th? thông báo thành công n?u có --%>
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${sessionScope.successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <%-- Xóa thông báo sau khi hi?n th? ?? không hi?n th? l?i khi t?i l?i trang --%>
                    <c:remove var="successMessage" scope="session"/>
                </c:if>

                <%-- Hi?n th? thông báo l?i n?u có --%>
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
                                            <h2 class="ml-lg-2">Manage Enrollments</h2>
                                        </div>
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
                                            <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addEnrollmentModal">
                                                <i class="material-icons">&#xE147;</i> <span>Add Enrollment</span>
                                            </a>

                                        </div>

                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll">
                                                    <label for="selectAll"></label>
                                                </span>
                                            </th>
                                            <th>Enrollment ID</th>
                                            <th>Student ID</th>
                                            <th>Course ID</th>
                                            <th>Enrolled Date</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="enrollment" items="${listEnrollments}">
                                            <tr>
                                                <td>
                                                    <span class="custom-checkbox">
                                                        <input type="checkbox" id="checkbox${enrollment.enrollment_id}">
                                                        <label for="checkbox${enrollment.enrollment_id}"></label>
                                                    </span>
                                                </td>
                                                <td>${enrollment.enrollment_id}</td>
                                                <td>${enrollment.student_id}</td>
                                                <td>${enrollment.course_id}</td>
                                                <td>
                                                    <fmt:formatDate value="${enrollment.enrolled_date}" pattern="yyyy-MM-dd HH:mm" />
                                                </td>
                                                <td>${enrollment.status}</td>
                                                <td>
                                                    <!-- Nút Edit -->
                                                    <button class="btn btn-warning btn-sm edit-btn"
                                                            data-enrollmentid="${enrollment.enrollment_id}" 
                                                            data-studentid="${enrollment.student_id}" 
                                                            data-courseid="${enrollment.course_id}"
                                                            data-enrolleddate="${enrollment.enrolled_date}"
                                                            data-status="${enrollment.status}">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </button>

                                                    <!-- Nút Delete -->
                                                    <button class="btn btn-danger btn-sm delete-btn"
                                                            data-enrollmentid="${enrollment.enrollment_id}"
                                                            data-courseid="${enrollment.course_id}"
                                                            data-toggle="modal"
                                                            data-target="#deleteModal">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Modal Add Enrollment -->
                        <div class="modal fade" id="addEnrollmentModal" tabindex="-1" aria-labelledby="addEnrollmentModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addEnrollmentModalLabel">Add Enrollment</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addEnrollmentForm" action="${pageContext.request.contextPath}/admin/enrollments?action=add" method="post">
                                            <div class="mb-3">
                                                <label for="addStudentId" class="form-label">Student ID</label>
                                                <input type="number" class="form-control" id="addStudentId" name="student_id" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="addCourseId" class="form-label">Course ID</label>
                                                <select class="form-control" id="addCourseId" name="course_id" required>
                                                    <c:forEach var="course" items="${listCourse}">
                                                        <option value="${course.course_id}">${course.title} (ID: ${course.course_id})</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <div class="mb-3">
                                                <label for="addEnrolledDate" class="form-label">Enrolled Date</label>
                                                <input type="datetime-local" class="form-control" id="addEnrolledDate" name="enrolled_date" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="addStatus" class="form-label">Status</label>
                                                <select class="form-control" id="addStatus" name="status" required>
                                                    <option value="ENROLLED">ENROLLED</option>
                                                    <option value="WAITLISTED">WAITLISTED</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <button type="submit" class="btn btn-primary">Add Enrollment</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- Modal Edit Enrollment -->
                        <div class="modal fade" id="editEnrollmentModal" tabindex="-1" aria-labelledby="editEnrollmentModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editEnrollmentModalLabel">Edit Enrollment</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editEnrollmentForm" action="${pageContext.request.contextPath}/admin/enrollments?action=edit" method="post">
                                            <input type="hidden" id="editEnrollmentId" name="enrollment_id">

                                            <div class="mb-3">
                                                <label for="editStudentId" class="form-label">Student ID</label>
                                                <input type="number" class="form-control" id="editStudentId" name="student_id" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editCourseId" class="form-label">Course ID</label>
                                                <input type="number" class="form-control" id="editCourseId" name="course_id" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editEnrolledDate" class="form-label">Enrolled Date</label>
                                                <input type="datetime-local" class="form-control" id="editEnrolledDate" name="enrolled_date" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editStatus" class="form-label">Status</label>
                                                <select class="form-control" id="editStatus" name="status" required>
                                                    <option value="ENROLLED">ENROLLED</option>
                                                    <option value="WAITLISTED">WAITLISTED</option>
                                                    <option value="CANCELLED">CANCELLED</option>

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
                        <!-- Modal Delete -->
                        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to delete this enrollment?</p>
                                        <p><strong>Enrollment ID:</strong> <span id="deleteEnrollmentId"></span></p>
                                        <p><strong>Course ID:</strong> <span id="deleteCourseId"></span></p>
                                    </div>
                                    <div class="modal-footer">
                                        <form id="deleteForm" action="${pageContext.request.contextPath}/admin/enrollments?action=delete" method="post">
                                            <input type="hidden" id="deleteEnrollmentIdInput" name="enrollment_id">
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
                // Khi nh?n nút "Edit", ?i?n d? li?u vào modal
                $('body').on('click', '.edit-btn', function () {
                    var enrollmentData = $(this).data();

                    // Gán d? li?u vào các input trong modal
                    $('#editEnrollmentId').val(enrollmentData.enrollmentid);
                    $('#editStudentId').val(enrollmentData.studentid);
                    $('#editCourseId').val(enrollmentData.courseid);

                    // Chuy?n ??i ngày tháng thành ??nh d?ng datetime-local
                    if (enrollmentData.enrolleddate) {
                        var enrolledDate = new Date(enrollmentData.enrolleddate);
                        var formattedDate = enrolledDate.toISOString().slice(0, 16);
                        $('#editEnrolledDate').val(formattedDate);
                    }

                    $('#editStatus').val(enrollmentData.status);

                    // Hi?n th? modal
                    var modal = new bootstrap.Modal(document.getElementById('editEnrollmentModal'));
                    modal.show();
                });

                // Khi nh?n nút "Add Enrollment", m? modal
                $('body').on('click', '.add-btn', function () {
                    var modal = new bootstrap.Modal(document.getElementById('addEnrollmentModal'));
                    modal.show();
                });
            });

            $(document).ready(function () {
                // Khi click vào nút Delete
                $('body').on('click', '.delete-btn', function () {
                    var enrollmentId = $(this).data('enrollmentid');
                    var courseId = $(this).data('courseid');

                    // Gán d? li?u vào modal
                    $('#deleteEnrollmentId').text(enrollmentId);
                    $('#deleteCourseId').text(courseId);
                    $('#deleteEnrollmentIdInput').val(enrollmentId);

                    // Hi?n th? modal
                    var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
                    deleteModal.show();
                });
            });
        </script>


    </body>

</html>


