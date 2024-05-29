<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/admin/admin-lib.jsp"%>
<c:choose>
	<c:when test="${source eq 'get-employee.htm'}">
		<c:set var="role" value="Employee" />
	</c:when>
	<c:otherwise>
		<c:set var="role" value="Guest" />
	</c:otherwise>
</c:choose>

<body>
	<c:if test="${not empty mess}">
		<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
			<div class="  alert alert-success alert-dismissible fade show"
				role="alert">
				${mess }
				<button type="button" class="ms-auto btn-close"
					data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</div>

	</c:if>
	<div class="container">
    <div class="row">
        <!-- Sidebar for larger screens -->
        <div class="col-lg-2 d-none d-lg-block">
            <%@include file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%>
        </div>
        <!-- Main content area -->
        <div class="col-lg-10 col-md-12">
            <div id="content-wrapper" class="d-flex flex-column">
                <div class="container">
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <div class="d-md-flex justify-content-between align-items-center">
                                <!-- pageheader -->
                                <div>
                                    <h2>${role}</h2>
                                    <!-- breadcrumb -->
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
                                            <li class="breadcrumb-item"><a href="index.htm" class="text-decoration-none brc-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">${role}</li>
                                        </ol>
                                    </nav>
                                </div>
                                <!-- Button for opening sidebar on smaller screens -->
                                <!-- <button class="btn btn-primary d-lg-none" type="button" data-toggle="offcanvas" data-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                                    <i class="bi bi-list"></i>
                                </button> -->
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4 mt-3">
                        <div class="col-xl-12 col-12 mb-5">
                            <div class="px-6 py-6 p-4">
                                <div class="row justify-content-between">
                                    <div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
                                        <form class="d-flex" role="search" action="admin/user/${source}">
                                            <input class="form-control" type="search" placeholder="Search ${role} by name or email" aria-label="Search" name="search" required>
                                        </form>
                                    </div>
                                    <div class="col-xl-2 col-md-4 col-12">
                                        <!-- button -->
                                        <div>
                                            <a href="admin/user/create-${role.toLowerCase()}.htm" class="btn btn-custom">Add New ${role}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <table class="table table-hover table-striped table-categories">
                        <thead class="position-sticky top-0 bg-white">
                            <tr class="table-success">
                                <th>Avatar</th>
                                <th>Fullname</th>
                                <th>Status</th>
                                <th>Email</th>
                                <th>Enable</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach varStatus="status" var="account" items="${accounts}">
                                <tr>
                                    <td class="align-middle">
                                        <c:choose>
                                            <c:when test="${not empty account.avatar}">
                                                <img style="width: 50px" src="<c:url value='/assets/user/img/account/${account.avatar}'/>">
                                            </c:when>
                                            <c:otherwise>
                                                <img style="width: 50px" src="<c:url value='/assets/user/img/account/defaultavatar.png'/>">
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="align-middle">
                                        <c:set var="fullName" value="${account.lastName} ${account.firstName} " />
                                        <p class="m-0">${fullName}</p>
                                    </td>
                                    <td class="align-middle">
                                        <c:choose>
                                            <c:when test="${account.status eq '1'}">
                                                <span class="badge bg-success">Enable</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Disable</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="align-middle">
                                        <p class="p-3">${account.email}</p>
                                    </td>
                                    <td class="align-middle">
                                        <a href="admin/user/changestatus.htm?id=${account.accountId}">
                                            <button class="btn btn-success" type="button" id="edit_button${status.index}">
                                                <c:choose>
                                                    <c:when test="${account.status eq '1'}">
                                                        <i class="bi bi-lock-fill text-warning"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="bi bi-unlock-fill"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </button>
                                        </a>
                                    </td>
                                    <td class="align-middle">
                                        <a class="link-success" href="admin/user/edit.htm?id=${account.accountId}">
                                            <i class="bi bi-pencil-square"></i>Edit
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- pagination -->
            <div class="d-flex justify-content-center">
                <!-- nav -->
                <nav>
                    <ul class="pagination d-flex justify-content-center ms-2">
                        <li class="page-item ${paginate.currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link mx-1" aria-label="Previous" href="admin/user/${source}?crrPage=${paginate.currentPage - 1}">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${paginate.totalPage}" varStatus="in">
                            <li class="page-item ${paginate.currentPage == in.count ? 'active' : ''}">
                                <a class="page-link mx-1" href="admin/user/${source}?crrPage=${in.count}">${in.count}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${paginate.currentPage == paginate.totalPage ? 'disabled' : ''}">
                            <a class="page-link mx-1" aria-label="Next" href="admin/user/${source}?crrPage=${paginate.currentPage + 1}">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!--End pagination -->
        </div>
    </div>
</div>

<!-- Off-canvas sidebar for smaller screens -->
<%-- <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasSidebarLabel">Menu</h5>
        <button type="button" class="close" data-dismiss="offcanvas" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="offcanvas-body">
        <%@include file="/WEB-INF/views/layouts/admin/admin-headernav.jsp"%>
    </div>
</div> --%>

</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>