<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
    <link href="${contextPath}/resources/css61/templatemo-style.css" rel="stylesheet">
    

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
            <li><a href="#"  class="active" ><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
            <li><a href="/hr/message" ><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
              <li><a href="/hr/test" ><i class="fa fa-comments fa-fw"></i>Конструктор тестов</a></li>
              <li><a  href="/hr/vacancy"><i class="fa fa-database fa-fw"></i>Вакансии</a></li>
              <li><a href="/hr/assesment" ><i class="fa fa-file-text-o fa-fw"></i>Результаты кандидатов</a></li>
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
                <li><a href="#" class="active">HR</a></li>
                
              </ul>  
            </nav> 
          </div>
        </div>
          <div class="templatemo-flex-row flex-content-row">
            
            <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Таблица собеседований</h2></div>

                  <div class= "a_calendare">
                  <button class="login100-form-btn" style="
    margin-top: 30px;
    margin-left: 605px;
">

                      <a href="#openModal" title="Добавить собеседование" >Добавить собеседование</a>

                  </button>

                      <div id="openModal" class="modalDialog">
                          <div>
                              <a href="#close" title="Закрыть" class="close">X</a>

                              <form  method="post" action="/hr/interviewer/add">
                                  <div class="modal-body">
                                      <input type="number" id="id" name="id2" class="hidden">
                                      <div class="form-group required">
                                          <label for="vacancy" class="col-sm-3 control-label">Вакансия</label>
                                          <div class="col-sm-9">
                                              <select class="form-control" id="vacancy" name="vacancy">
                                                  <c:forEach items="${vacancyList}" var = "vacancy" >
                                                      <option value="${vacancy.id}">${vacancy.name}-${vacancy.post.department}/${vacancy.post.post}</option>
                                                  </c:forEach>
                                              </select>
                                          </div>
                                      </div>
                                      <div class="form-group required">
                                          <label for="Email сотрудника" class="col-sm-3 control-label">Email сотрудника</label>
                                          <div class="col-sm-9">
                                              <input type="text" class="form-control" id="EmailE" name="EmailE" placeholder="Введите Email сотрудника" required="">
                                          </div>
                                      </div>
                                      <div class="form-group required">
                                          <label for="Email соискателя" class="col-sm-3 control-label">Email соискателя</label>
                                          <div class="col-sm-9">
                                              <input type="text" class="form-control" id="EmailC" name="EmailC" placeholder="Введите Email соискателя" required="">
                                          </div>
                                      </div>


                                      <div class="form-group required">
                                          <label for="Время" class="col-sm-3 control-label">Время</label>
                                          <div class="col-sm-9">
                                              <input type="text" class="form-control" id="startedOn" name="startedOn" placeholder="Введите время" required="">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label for="Дата" class="col-sm-3 control-label">Дата</label>
                                          <div class="col-sm-9">
                                              <input type="text" class="form-control" id="dob" name="dob" placeholder="Введите дату">
                                          </div>
                                      </div>
                                  </div>

                                  <div class="modal-footer">
                                      <button type="submit" class="login100-form-btn">Сохранить</button>
                                      <button class="login100-form-btn">
                                          <a href="#close" title="Закрыть" >Отмена</a>
                                      </button>

                                  </div>
                              </form>

                          </div>
                      </div>
                  </div>



                <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by"># <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Сотрудник <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Соискатель <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Дата <span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">Время <span class="caret"></span></a></td>
                    <td>Изменить запись</td>
                    <td>Удалить запись</td>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${resumeForm}" var = "resume" >
                <form method="post" action="/hr/interviewer/delete">
                  <tr>
                    <td><input type="number" name="id" style="outline: none; border: none; background: #f9f9f9;" value="${resume.id}" readonly></td>
                    <td>${resume.employee.surname} ${resume.employee.name}</td>
                    <td>${resume.candidate.surname} ${resume.candidate.name}</td>
                    <td>${resume.startDate}</td>
                    <td>${resume.startTime}</td>
                    <td>
                     <a href="#openModal-${resume.id}" class="templatemo-edit-btn">Изменить</a></td>
                    <td><button type="submit" class="login100-form-btn" >Удалить</button></td>
                  </tr>
                </form>
                <form  method="post" action="/hr/interviewer/edit">
                    <div id="openModal-${resume.id}" class="modalDialog">
                        <div>
                            <a href="#close" title="Закрыть" class="close">X</a>
                                <div class="modal-body">
                                    <input type="number" name="id" style="outline: none; border: none; background: #f9f9f9;" value="${resume.id}" class="hidden" readonly>
                                    <div class="form-group required">
                                        <label for="ФИО сотрудника" class="col-sm-3 control-label">Email сотрудника</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="EmailE" name="EmailE" placeholder="Введите Email сотрудника" required="">
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label for="ФИО соискателя" class="col-sm-3 control-label">Email соискателя</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="EmailC" name="EmailC" placeholder="Введите Email соискателя" required="">
                                        </div>
                                    </div>


                                    <div class="form-group required">
                                        <label for="Время" class="col-sm-3 control-label">Время</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="startedOn" name="startedOn" placeholder="Введите время" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="Дата" class="col-sm-3 control-label">Дата</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="dob" name="dob" placeholder="Введите дату">
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="login100-form-btn">Сохранить</button>
                                    <button class="login100-form-btn">

                                        <a href="#close" title="Закрыть" >Отмена</a>
                                    </button>

                                </div>
                        </div>
                    </div>
                </form>
                </c:forEach>
                </tbody>
              </table>    
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
    </div>
    
   

  </body>
</html>