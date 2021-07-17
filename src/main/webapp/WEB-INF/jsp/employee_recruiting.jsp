<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Employee</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${contextPath}/resources/css5/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css5/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css5/templatemo-style.css" rel="stylesheet">
      <link href="${contextPath}/resources/vendors/bower_components/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>



      <script src="${contextPath}/resources/js/js-fluid-meter.js"></script>
    

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>Employee</h1>
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
            <li><a href="/worker" ><i class="fa fa-home fa-fw"></i>Главная</a></li>
            <li><a href="/worker/diagram"><i class="fa fa-bar-chart fa-fw"></i>Диаграммы</a></li>
            <li><a href="/worker/event" ><i class="fa  fa-calendar fa-fw"></i>Календарь</a></li>
              <li><a href="#" class="active"><i class="fa fa-file-text-o fa-fw"></i>Подбор кандидатов</a></li>
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
                <li><a href="" class="active">Сотрудник</a></li>
                              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="square"></div>
              <h2 class="templatemo-inline-block">Инструкция для пользователя</h2><hr>
                <p>Добро пожаловать в ваш аккаунт сотрудника. </p><p>
                В аккаунте содержится ваша личная информация. Так же здесь размещается календарь событий, который включает в себя расписание встреч, больничных и отпусков. При помощи вашей странички вы можете подбирать кандидатов, отслеживать их успехи.</p>
                <p>Если вы ознакомились со справочной информацией и она вам больше не нужна, нажмите на крестик в правом верхнем углу</p>>
            </div>

            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
                      <h2 class="templatemo-inline-block">Рекомендация кандидата</h2><hr>
              <div class="container" style="width: 130px;margin-left: 150px;">
    <div class="row">
      <div class="col text-center">
        <div id="fluid-meter" class="mx-auto"></div>
          <form method="post" enctype="multipart/form-data">
              <ul class="list_download">
                  <input type="file" name="file" id="file" />
                  <button type="button" id="submit-vacancy" class="login100-form-btn" style="margin-left: 80px;">Порекомендовать</button>
              </ul>
          </form>
      </div>

    </div>
  </div>

</div>           
          </div>
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
                                                                                <td><p>${candidate.surname} ${candidate.name}<p></p></td>
                                                                                <td><input type="text" id="vacancy" name="vacancy" style=" width: 300px; background-color: transparent; border: none; outline: none;" value="${candidate.vacancy.name}" readonly></td>
                                                                                <td><input type="number" step="0.1" min="0" max="10" id="testScope" name="testScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.testScope}" readonly></td>
                                                                                <td><input type="number" step="0.1" min="0" max="10" id="langScope" name="langScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.langScope}" readonly></td>
                                                                                <td><input type="number" step="0.1" min="0" max="10" id="socialScope" name="socialScope" style="width: 50px; background-color: transparent; border: none; outline: none;" value="${candidate.raiting.socialScope}" readonly></td>
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

          </div> <!-- Second row ends -->
          
          <footer class="text-right">
            <p>КП &copy; 2020 БГУИР
            | Developers: Городецкая А.М.</p>
          </footer>         
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="${contextPath}/resources/js3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->

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