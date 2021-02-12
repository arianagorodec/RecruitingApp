<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Admin</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${contextPath}/resources/css6/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css6/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css6/templatemo-style.css" rel="stylesheet">
   <link href="${contextPath}/resources/css61/templatemo-style.css" rel="stylesheet">

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>Admin</h1>
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
            <li><a href="/admin"><i class="fa fa-bar-chart fa-fw"></i>Статистика</a></li>
              <li><a href="/admin/employee"><i class="fa fa-users fa-fw"></i>Управление сотрудниками</a></li>
              <li><a href="/admin/user"><i class="fa fa-users fa-fw"></i>Управление соискателями</a></li>
              <li><a href="#"><i class="fa fa-users fa-fw"></i>Управление администратарами</a></li>
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
                <li><a href="" class="active">Админка</a></li>
                              </ul>  
            </nav> 
          </div>
        </div>
        <div class="templatemo-content-container">
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="square"></div>
              <h2 class="templatemo-inline-block">Руководство пользователя</h2><hr>
              <p>Вы перешли в аккаунт администратора. Он позволяет вам проматривать статистику посещения ситстемы, а итак же её производительность, мониторить основные показатели и управлять пользователями системы. Только через данную страницу в всистему можно добавлять новый системных администраторов.
              </p>  
              <p>Если вам больше не нужна данная справка, то вы можете её закрыть, нажап на соответствующий значёк в верхнем правом углу
              </p>              
            </div>
            
          </div>
          
            <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Таблица пользователей</h2></div>
             <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              
              <table class="table table-striped table-bordered templatemo-user-table" id="myTable">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by"># <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Почта <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Пароль <span class="caret"></span></a></td>
                    <td>Изменить запись</td>
                    <td>Удалить запись</td>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${admins}" var = "admin" >
                      <form  method="post" action="/admin/2/delete">
                          <tr>
                              <td>${admin.id}</td>
                              <td>${admin.username}</td>
                              <td>${admin.password}</td>
                              <td>
                                  <a href="#openModal-${admin.id}" class="templatemo-edit-btn">Изменить</a></td>
                              <td><button type="submit" class="templatemo-edit-btn">Удалить</button>
                              </td>
                          </tr>
                      </form>
                      <form method="post" action="/admin/2/edit">
                          <div id="openModal-${admin.id}"  class="modalDialog300"  >
                              <div>
                                  <a href="#close" title="Закрыть" class="close">X</a>
                                  <div class="modal-body">
                                      <input name="id" style="outline: none; border: none; background: #f9f9f9;" value="${admin.id}" class="hidden" readonly>
                                      <div class="form-group required">
                                          <label for="username" class="col-sm-3 control-label">Логин</label>
                                          <div class="col-sm-9">
                                              <input type="text" class="form-control" id="username" name="username" placeholder="Введите новый логин" value="${admin.username}" required="">
                                          </div>
                                      </div>
                                      <div class="form-group required">
                                          <label for="password" class="col-sm-3 control-label">Пароль</label>
                                          <div class="col-sm-9">
                                              <input type="text" class="form-control" id="password" name="password" placeholder="Введите новый пароль" >
                                          </div>
                                      </div>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="submit" class="login100-form-btn">Сохранить</button>
<%--                                      <button class="login100-form-btn">--%>

<%--                                          <a href="#close" title="Закрыть" >Отмена</a>--%>
<%--                                      </button>--%>

                                  </div>
                              </div>
                          </div>
                      </form>
                  </c:forEach>
                </tbody>

              </table>  

            </div>   
            <button class="login100-form-btn" id="table_button"><a href="#openModal" title="Добавить нового администратора" >Добавить нового администратора</a></button>
          </div>
                  <form method="post" action="/admin/2/add">
                  <div id="openModal"  class="modalDialog300"  >
                      <div>
                          <a href="#close" title="Закрыть" class="close">X</a>
                          <div class="modal-body">
                              <div class="form-group required">
                                  <label for="username" class="col-sm-3 control-label">Логин</label>
                                  <div class="col-sm-9">
                                      <input type="text" class="form-control" id="username1" name="username" placeholder="Введите логин" required="">
                                  </div>
                              </div>
                              <div class="form-group required">
                                  <label for="password" class="col-sm-3 control-label">Пароль</label>
                                  <div class="col-sm-9">
                                      <input type="text" class="form-control" id="password1" name="password" placeholder="Введите  пароль"  required="">
                                  </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="submit" class="login100-form-btn">Сохранить</button>
                              <%--                                      <button class="login100-form-btn">--%>

                              <%--                                          <a href="#close" title="Закрыть" >Отмена</a>--%>
                              <%--                                      </button>--%>

                          </div>
                      </div>
                  </div>
                  </form>
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
    
    <script type="text/javascript" src="${contextPath}/resources/js5/templatemo-script.js"></script>


  </body>
</html>