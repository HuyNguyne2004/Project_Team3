<!doctype html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                        <form action="${pageContext.request.contextPath}/admin/course?action=search" method="post">

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
                <c:if test="${not empty sessionScope.errorMessage}">
                    <div class="alert alert-danger">${sessionScope.errorMessage}</div>
                    <c:remove var="errorMessage" scope="session"/>
                </c:if>


                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">Manage Course</h2>
                                        </div>
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
                                            <a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCourseModal">
                                                <i class="material-icons">&#xE147;</i> <span>Add Course</span>
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
                                            <th>Course ID</th>
                                            <th>Title</th>
                                            <th>Description</th>
                                            <th>Instructor ID</th>
                                            <th>Schedule</th>
                                            <th>Max Students</th>
                                            <th>Room ID</th>
                                            <th>Image</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="course" items="${listCourse}">
                                            <tr>
                                                <td>
                                                    <span class="custom-checkbox">
                                                        <input type="checkbox" id="checkbox${course.course_id}">
                                                        <label for="checkbox${course.course_id}"></label>
                                                    </span>
                                                </td>
                                                <td>${course.course_id}</td>
                                                <td>${course.title}</td>
                                                <td>${course.description}</td>
                                                <td>${course.instructor_id}</td>
                                                <td>${course.schedule}</td>
                                                <td>${course.max_students}</td>
                                                <td>${course.room_id != null ? course.room_id : 'Not Assigned'}</td>
                                                <td>
                                                    <!-- Nút Edit -->
                                                    <button class="btn btn-warning btn-sm edit-btn"
                                                            data-courseid="${course.course_id}" 
                                                            data-title="${course.title}" 
                                                            data-description="${course.description}"
                                                            data-instructorid="${course.instructor_id}"
                                                            data-schedule="${course.schedule}"
                                                            data-maxstudents="${course.max_students}"
                                                            data-roomid="${course.room_id != null ? course.room_id : ''}">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </button>
                                                    <!-- Nút Delete -->
                                                    <button class="btn btn-danger btn-sm delete-btn"
                                                            data-courseid="${course.course_id}">
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
                        <!-- Modal Add Course -->
                        <div class="modal fade" id="addCourseModal" tabindex="-1" aria-labelledby="addCourseModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addCourseModalLabel">Add Course</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addCourseForm" action="${pageContext.request.contextPath}/admin/course?action=add" method="post">
                                            <div class="mb-3">
                                                <label for="title" class="form-label">Title</label>
                                                <input type="text" class="form-control" id="addTitle" name="title" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Description</label>
                                                <textarea class="form-control" id="addDescription" name="description" rows="3" required></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="instructorId" class="form-label">Instructor ID</label>
                                                <input type="number" class="form-control" id="addInstructorId" name="instructor_id" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="schedule" class="form-label">Schedule</label>
                                                <input type="text" class="form-control" id="addSchedule" name="schedule" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="maxStudents" class="form-label">Max Students</label>
                                                <input type="number" class="form-control" id="addMaxStudents" name="max_students" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="roomId" class="form-label">Room ID</label>
                                                <input type="number" class="form-control" id="addRoomId" name="room_id">
                                            </div>
                                            <div class="mb-3">
                                                <label for="image" class="form-label">Image URL</label>
                                                <input type="text" class="form-control" id="addImage" name="image">
                                            </div>
                                            <div class="mb-3">
                                                <button type="submit" class="btn btn-primary">Add Course</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal Edit -->
                        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel">Edit Course</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editForm" action="${pageContext.request.contextPath}/admin/course?action=edit" method="post">
                                            <input type="hidden" id="courseId" name="course_id">

                                            <div class="mb-3">
                                                <label for="title" class="form-label">Title</label>
                                                <input type="text" class="form-control" id="title" name="title">
                                            </div>
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Description</label>
                                                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="instructorId" class="form-label">Instructor ID</label>
                                                <input type="number" class="form-control" id="instructorId" name="instructor_id">
                                            </div>
                                            <div class="mb-3">
                                                <label for="schedule" class="form-label">Schedule</label>
                                                <input type="text" class="form-control" id="schedule" name="schedule">
                                            </div>
                                            <div class="mb-3">
                                                <label for="maxStudents" class="form-label">Max Students</label>
                                                <input type="number" class="form-control" id="maxStudents" name="max_students">
                                            </div>
                                            <div class="mb-3">
                                                <label for="roomId" class="form-label">Room ID</label>
                                                <input type="number" class="form-control" id="roomId" name="room_id">
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
                        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to delete this course?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form id="deleteForm" action="${pageContext.request.contextPath}/admin/course?action=delete" method="post">
                                            <input type="hidden" id="deleteCourseId" name="course_id">
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
                // Khi b?m vào nút "Edit", l?y d? li?u và hi?n th? vào modal
                $('body').on('click', '.edit-btn', function () {
                    var courseData = $(this).data();

                    // Gán d? li?u vào các tr??ng trong modal
                    $('#courseId').val(courseData.courseid);
                    $('#title').val(courseData.title);
                    $('#description').val(courseData.description);
                    $('#instructorId').val(courseData.instructorid);
                    $('#schedule').val(courseData.schedule);
                    $('#maxStudents').val(courseData.maxstudents);
                    $('#roomId').val(courseData.roomid);
                    $('#image').val(courseData.image);

                    // Hi?n th? modal
                    var modal = new bootstrap.Modal(document.getElementById('editModal'));
                    modal.show();
                });

                // Khi b?m vào nút "Delete", l?y course_id và truy?n vào form modal
                $('body').on('click', '.delete-btn', function () {
                    var courseId = $(this).data('courseid');
                    $('#deleteCourseId').val(courseId);

                    // Hi?n th? modal
                    var modal = new bootstrap.Modal(document.getElementById('deleteModal'));
                    modal.show();
                });

                // Khi b?m vào nút "Add Course", m? modal
                $('body').on('click', '.add-btn', function () {
                    var modal = new bootstrap.Modal(document.getElementById('addCourseModal'));
                    modal.show();
                });
            });


        </script>

    </body>

</html>


