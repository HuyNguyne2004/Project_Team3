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

                                <!-- Seach -->
                                <div class="col-md-5 col-lg-3 order-3 order-md-2">
                                    <div class="xp-searchbar">
                                        <form id="searchForm" action="${pageContext.request.contextPath}/admin/room?action=search" method="post">
                                        
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
                                            <h2 class="ml-lg-2">Manage Room</h2>
                                        </div>

                                        <!-- Nút Add Room -->
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
                                            <button class="btn btn-success add-room-btn" data-bs-toggle="modal" data-bs-target="#addRoomModal">
                                                <i class="material-icons">&#xE147;</i> <span>Add Room</span>
                                            </button>
                                        </div>


                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Room ID</th>
                                            <th>Room Name</th>
                                            <th>Capacity</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="room" items="${listRoom}">
                                            <tr>
                                                <td>${room.room_id}</td>
                                                <td>${room.room_name}</td>
                                                <td>${room.capacity}</td>
                                                <td>
                                                    <button class="btn btn-warning btn-sm edit-btn"
                                                            data-roomid="${room.room_id}" 
                                                            data-roomname="${room.room_name}" 
                                                            data-capacity="${room.capacity}">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </button>
                                                    <button class="btn btn-danger btn-sm delete-btn"
                                                            data-roomid="${room.room_id}">
                                                        <i class="fas fa-trash"></i> Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Nút thêm phòng -->
                                <div class="text-end mt-3">
                                    <button class="btn btn-success add-room-btn">
                                        <i class="material-icons">&#xE147;</i> Add Room
                                    </button>
                                </div>

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
                        <!-- Modal Add Room -->
                        <div class="modal fade" id="addRoomModal" tabindex="-1" aria-labelledby="addRoomModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addRoomModalLabel">Add Room</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addRoomForm" action="${pageContext.request.contextPath}/admin/room?action=add" method="post">
                                            <div class="mb-3">
                                                <label for="addRoomName" class="form-label">Room Name</label>
                                                <input type="text" class="form-control" id="addRoomName" name="room_name" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="addCapacity" class="form-label">Capacity</label>
                                                <input type="number" class="form-control" id="addCapacity" name="capacity" min="1" required>
                                            </div>

                                            <div class="mb-3 text-center">
                                                <button type="submit" class="btn btn-primary">Add Room</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Edit Room -->
                        <div class="modal fade" id="editRoomModal" tabindex="-1" aria-labelledby="editRoomModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editRoomModalLabel">Edit Room</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editRoomForm" action="${pageContext.request.contextPath}/admin/room?action=edit" method="post">
                                            <input type="hidden" id="editRoomId" name="room_id">

                                            <div class="mb-3">
                                                <label for="editRoomName" class="form-label">Room Name</label>
                                                <input type="text" class="form-control" id="editRoomName" name="room_name" required>
                                            </div>

                                            <div class="mb-3">
                                                <label for="editCapacity" class="form-label">Capacity</label>
                                                <input type="number" class="form-control" id="editCapacity" name="capacity" min="1" required>
                                            </div>

                                            <div class="mb-3 text-center">
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
            document.addEventListener("DOMContentLoaded", function () {
                // Khi nh?n nút "Edit Room"
                document.querySelectorAll(".edit-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let roomId = this.getAttribute("data-roomid");
                        let roomName = this.getAttribute("data-roomname");
                        let capacity = this.getAttribute("data-capacity");

                        // Debug log (ki?m tra d? li?u có ?úng không)
                        console.log("Edit Room Clicked:", {roomId, roomName, capacity});

                        // Gán giá tr? vào form ch?nh s?a
                        document.getElementById("editRoomId").value = roomId;
                        document.getElementById("editRoomName").value = roomName;
                        document.getElementById("editCapacity").value = capacity;

                        // Hi?n th? modal Edit Room
                        let modal = new bootstrap.Modal(document.getElementById("editRoomModal"));
                        modal.show();
                    });
                });

                // Khi nh?n nút "Add Room"
                let addRoomBtn = document.querySelector(".add-room-btn");
                if (addRoomBtn) {
                    addRoomBtn.addEventListener("click", function () {
                        document.getElementById("addRoomName").value = "";
                        document.getElementById("addCapacity").value = "";

                        // Hi?n th? modal Add Room
                        let modal = new bootstrap.Modal(document.getElementById("addRoomModal"));
                        modal.show();
                    });
                }

                // Ki?m tra form tr??c khi submit ?? tránh d? li?u tr?ng (Add Room)
                let addRoomForm = document.getElementById("addRoomForm");
                if (addRoomForm) {
                    addRoomForm.addEventListener("submit", function (event) {
                        let roomName = document.getElementById("addRoomName").value.trim();
                        let capacity = document.getElementById("addCapacity").value.trim();

                        if (roomName === "" || capacity === "") {
                            alert("?? Vui lòng nh?p ??y ?? thông tin!");
                            event.preventDefault();
                        }
                    });
                }

                // Ki?m tra form tr??c khi submit ?? tránh d? li?u tr?ng (Edit Room)
                let editRoomForm = document.getElementById("editRoomForm");
                if (editRoomForm) {
                    editRoomForm.addEventListener("submit", function (event) {
                        let roomName = document.getElementById("editRoomName").value.trim();
                        let capacity = document.getElementById("editCapacity").value.trim();

                        if (roomName === "" || capacity === "") {
                            alert("?? Vui lòng nh?p ??y ?? thông tin!");
                            event.preventDefault();
                        }
                    });
                }
            });

        </script>

    </body>

</html>


