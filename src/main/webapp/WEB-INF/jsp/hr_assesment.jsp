<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%--<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HR</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${contextPath}/resources/css6/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css6/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css6/templatemo-style.css" rel="stylesheet">
    <link href="${contextPath}/resources/vendors/bower_components/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1>HR</h1>
        </header>
        <div class="profile-photo-container">
            <img src="${contextPath}/resources/images3/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
            <div class="input-group">
                <button type="submit" class="fa fa-search"></button>
                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
            </div>
        </form>

        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="/hr" ><i class="fa fa-home fa-fw"></i>Главная</a></li>
                <li><a href="/hr/diagram"><i class="fa fa-bar-chart fa-fw"></i>Диаграммы</a></li>
                <li><a href="/hr/statistics"><i class="fa fa-area-chart"></i>Статистика</a></li>
                <li><a href="/hr/profile" ><i class="fa  fa-list-alt"></i>Досье</a></li>
                <li><a href="/hr/event" ><i class="fa  fa-calendar fa-fw"></i>Календарь</a></li>
                <li><a href="/hr/interviewer"><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
                <li><a href="/hr/message" ><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
                <li><a href="/hr/test" ><i class="fa fa-comments fa-fw"></i>Конструктор тестов</a></li>
                <li><a  href="/hr/vacancy"><i class="fa fa-database fa-fw"></i>Вакансии</a></li>
                <li><a href="#"  class="active" ><i class="fa fa-file-text-o fa-fw"></i>Результаты кандидатов</a></li>
                <li><a href="/hr/analysis" ><i class="fa fa-file-text-o fa-fw"></i>Анализ кандидатов</a></li>
                <li><a href="/logout"><i class="fa fa-times-circle fa-fw"></i>Выход</a></li>
            </ul>
        </nav>
    </div>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">HR</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="templatemo-content-container">

            <div class="templatemo-flex-row flex-content-row">
                <div class="col-1">
                    <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                        <i class="fa fa-times"></i>
                        <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Таблица оценок кандидатов</h2></div>
                        <div class="table-responsive">


                            <!-- Main Content -->
                            <div class="page-wrapper">
                                <div class="container-fluid">

                                    <!-- Row -->
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="panel panel-default card-view">
                                                <div class="panel-wrapper collapse in">
                                                    <div class="panel-body">
                                                        <div class="table-wrap">
                                                            <div class="table-responsive">
                                                                <table id="example" class="table table-hover display  pb-30" >

                                                                    <thead>
                                                                    <tr>
                                                                        <th>id</th>
                                                                        <th>Кто</th>
                                                                        <th>Вакансия</th>
                                                                        <th>Тест</th>
                                                                        <th>Иностранный язык</th>
                                                                        <th>Навыки общения</th>
                                                                        <th>Техническая часть</th>
                                                                        <th>Сохранить</th>
                                                                    </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                    <c:forEach items="${candidateList}" var = "candidate" >
                                                                        <tr>
                                                                            <form method="post" action="/hr/assesment/save">
                                                                            <td><input type="text" id="id" name="id" value="${candidate.id}" style="width: 50px; background-color: transparent; border: none; outline: none;" readonly></td>
                                                                            <td>${candidate.surname} ${candidate.name}</td>
                                                                            <td><input type="text" id="vacancy" name="vacancy" style=" width: 300px; background-color: transparent; border: none; outline: none;" value="${candidate.vacancy.name}" readonly></td>
                                                                            <td><input type="number" step="0.1" min="0" max="10" id="testScope" name="testScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.testScope}" ></td>
                                                                            <td><select class="form-control" id="langScope" name="langScope" >
                                                                                    <c:if test="${candidate.raiting.langScope=='A1'}">
                                                                                        <option value="A1" selected>A1</option>
                                                                                    </c:if>
                                                                                    <c:if test="${candidate.raiting.langScope!='A1'}">
                                                                                        <option value="A1">A1</option>
                                                                                    </c:if>

                                                                                <c:if test="${candidate.raiting.langScope=='A2'}">
                                                                                    <option value="A2" selected>A2</option>
                                                                                </c:if>
                                                                                <c:if test="${candidate.raiting.langScope!='A2'}">
                                                                                    <option value="A2">A2</option>
                                                                                </c:if>

                                                                                <c:if test="${candidate.raiting.langScope=='B1'}">
                                                                                    <option value="B1" selected>B1</option>
                                                                                </c:if>
                                                                                <c:if test="${candidate.raiting.langScope!='B1'}">
                                                                                    <option value="B1">B1</option>
                                                                                </c:if>

                                                                                <c:if test="${candidate.raiting.langScope=='B2'}">
                                                                                    <option value="B2" selected>B2</option>
                                                                                </c:if>
                                                                                <c:if test="${candidate.raiting.langScope!='B2'}">
                                                                                    <option value="B2">B2</option>
                                                                                </c:if>

                                                                                <c:if test="${candidate.raiting.langScope=='C1'}">
                                                                                    <option value="C1" selected>C1</option>
                                                                                </c:if>
                                                                                <c:if test="${candidate.raiting.langScope!='C1'}">
                                                                                    <option value="C1">C1</option>
                                                                                </c:if>

                                                                                <c:if test="${candidate.raiting.langScope=='C2'}">
                                                                                    <option value="C2" selected>C2</option>
                                                                                </c:if>
                                                                                <c:if test="${candidate.raiting.langScope!='C2'}">
                                                                                    <option value="C2">C2</option>
                                                                                </c:if>
                                                                            </select>
<%--                                                                                <input type="number" step="0.1" min="0" max="10" id="langScope" name="langScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.langScope}" >--%>
                                                                            </td>
                                                                            <td><input type="number" step="0.1" min="0" max="10" id="socialScope" name="socialScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.socialScope}" ></td>
                                                                            <td><input type="number" step="0.1" min="0" max="10" id="techScope" name="techScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.techScope}"></td>
                                                                            <td><button type="submit" class="login100-form-btn">Сохранить</button></td>
                                                                            </form>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Row -->
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="text-right">
            <p>КП &copy; 2020 БГУИР
                | Developers: Городецкая А.М.</p>
        </footer>
    </div>
</div>
<!-- JS -->
<script src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script src="${contextPath}/resources/js3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->
<!-- /#wrapper -->

<!-- JavaScript -->

<!-- jQuery -->
<script src="${contextPath}/resources/vendors/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${contextPath}/resources/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Data table JavaScript -->
<script src="${contextPath}/resources/vendors/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="${contextPath}/resources/vendors/bower_components/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${contextPath}/resources/vendors/bower_components/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${contextPath}/resources/vendors/bower_components/jszip/dist/jszip.min.js"></script>
<script src="${contextPath}/resources/vendors/bower_components/pdfmake/build/pdfmake.min.js"></script>
<script src="${contextPath}/resources/vendors/bower_components/pdfmake/build/vfs_fonts.js"></script>
<!-- кнопки -->
<script src="${contextPath}/resources/vendors/bower_components/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${contextPath}/resources/vendors/bower_components/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${contextPath}/resources/export-table-data.js"></script>



</body>
</html>