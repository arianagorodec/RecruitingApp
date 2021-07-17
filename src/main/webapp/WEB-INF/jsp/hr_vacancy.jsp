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
        <li><a href="/hr/interviewer"><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
        <li><a href="/hr/message" ><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
        <li><a href="/hr/test" ><i class="fa fa-comments fa-fw"></i>Конструктор тестов</a></li>
        <li><a href="#"  class="active" ><i class="fa fa-database fa-fw"></i>Вакансии</a></li>
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

          <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Таблица вакансий</h2></div>

          <div class= "a_calendare">
            <button class="login100-form-btn" style="
    margin-top: 30px;
    margin-left: 605px;
">

              <a href="#openModal" title="Добавить вакансию" >Добавить вакансию</a>

            </button>

            <div id="openModal" class="modalDialog">
              <div>
                <a href="#close" title="Закрыть" class="close">X</a>

                <form  method="post" action="/hr/vacancy/add">
<%--                  <div class="modal-body">--%>
                    <input type="number" id="id" name="id2" class="hidden">
                    <div class="form-group required">
                      <label for="vacancy" class="col-sm-3 control-label">Вакансия</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="vacancy" name="nameVacancy" placeholder="Введите название вакансии" required="">
                      </div>
                    </div>
                    <div class="form-group required">
                      <label for="department1" class="col-sm-3 control-label">Отдел</label>
                      <div class="col-sm-9">
                        <select class="form-control" id="department1" name="department" >
                          <c:forEach items="${postList}" var = "post" >
                            <option value="${post.department}">${post.department}</option>
                          </c:forEach>
                        </select>
<%--                        <input type="text" class="form-control" id="department1" name="department" placeholder="Введите отдел" required="">--%>
                      </div>
                    </div>


                    <div class="form-group required">
                      <label for="post1" class="col-sm-3 control-label">Должность</label>
                      <div class="col-sm-9">
                        <select class="form-control" id="post1" name="post" >
                          <c:forEach items="${postList}" var = "post" >
                            <option value="${post.post}">${post.post}</option>
                          </c:forEach>
                        </select>
<%--                        <input type="text" class="form-control" id="post1" name="post" placeholder="Введите должность" required="">--%>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="link1" class="col-sm-3 control-label">Ссылка на тест</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="link1" name="link" placeholder="Введите ссылку на тест">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="link" class="col-sm-3 control-label">Тестовый балл</label>
                      <div class="col-sm-9">
                        <input type="number" class="form-control" min="0" max="10" step="0.1" id="pass_scoreadd" name="pass_score" value="${vacancy.pass_score}" placeholder="Тестовый балл">
                      </div>
                    </div>
                  <div class="form-group required">
                    <label for="post" class="col-sm-3 control-label">Иностранного языка</label>
                    <div class="col-sm-9">
                      <select class="form-control" id="language_leveladd" name="language_level" >
                        <option value="A1"selected>A1</option>
                        <option value="A2">A2</option>
                        <option value="B1">B1</option>
                        <option value="B2">B2</option>
                        <option value="C1">C1</option>
                        <option value="C2">C2</option>
                      </select>
                    </div>
                  </div>
                    <div class="form-group">
                      <label for="description1" class="col-sm-3 control-label">Описание</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="description1" name="description" placeholder="Введите описание">
                      </div>
                    </div>

                  <div class="modal-footer">
                    <button type="submit" class="login100-form-btn">Сохранить</button>
                    <button class="login100-form-btn">
                      <a href="#close" title="Закрыть" >Отмена</a>
                    </button>
                  </div>
<%--                  </div>--%>
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
                  <td><a href="" class="white-text templatemo-sort-by">Название <span class="caret"></span></a></td>
                  <td><a href="" class="white-text templatemo-sort-by">Отдел <span class="caret"></span></a></td>
                  <td><a href="" class="white-text templatemo-sort-by">Должность <span class="caret"></span></a></td>
                  <td><a href="" class="white-text templatemo-sort-by">Ссылка на тест <span class="caret"></span></a></td>
                  <td><a href="" class="white-text templatemo-sort-by">Тестовый балл <span class="caret"></span></a></td>
                  <td><a href="" class="white-text templatemo-sort-by">Уровень иностранного языка<span class="caret"></span></a></td>
                  <td><a href="" class="white-text templatemo-sort-by">Описание <span class="caret"></span></a></td>
                  <td>Изменить запись</td>
                  <td>Удалить запись</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${vacancyList}" var = "vacancy" >
                  <form method="post" action="/hr/vacancy/delete">
                    <tr>
                      <td><input type="number" name="id" style="width:100px; outline: none; border: none; background: #f9f9f9;" value="${vacancy.id}" readonly></td>
                      <td>${vacancy.name}</td>
                      <td>${vacancy.post.department}</td>
                      <td>${vacancy.post.post}</td>
                      <td>${vacancy.testLink}</td>
                      <td>${vacancy.pass_score}</td>
                      <td>${vacancy.language_level}</td>
                      <td>${vacancy.description}</td>
                      <td>
                        <a href="#openModal-${vacancy.id}" class="templatemo-edit-btn">Изменить</a></td>
                      <td><button type="submit" class="login100-form-btn" >Удалить</button></td>
                    </tr>
                  </form>
                  <form  method="post" action="/hr/vacancy/edit">
                    <div id="openModal-${vacancy.id}" class="modalDialog">
                      <div>
                        <a href="#close" title="Закрыть" class="close">X</a>
<%--                        <div class="modal-body">--%>
                          <input type="number" name="id" style="outline: none; border: none; background: #f9f9f9;" value="${vacancy.id}" class="hidden" readonly>
                          <div class="form-group required">
                            <label for="nameVacancy" class="col-sm-3 control-label">Вакансия</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" id="nameVacancy" name="nameVacancy" placeholder="Введите название вакансии" required="" value="${vacancy.name}">
                            </div>
                          </div>
                          <div class="form-group required">
                            <label for="department" class="col-sm-3 control-label">Отдел</label>
                            <div class="col-sm-9">
                              <select class="form-control" id="department" name="department" >
                                <option value="${vacancy.post.department}" selected>${vacancy.post.department}</option>
                                <c:forEach items="${postList}" var = "post" >
                                  <option value="${post.department}">${post.department}</option>
                                </c:forEach>
                              </select>
                            </div>
                          </div>

                          <div class="form-group required">
                            <label for="post" class="col-sm-3 control-label">Должность</label>
                            <div class="col-sm-9">
                              <select class="form-control" id="post" name="post" >
                                <option value="${vacancy.post.post}"selected>${vacancy.post.post}</option>
                                <c:forEach items="${postList}" var = "post" >
                                  <option value="${post.post}">${post.post}</option>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        <div>
                          <div class="form-group">
                            <label for="link" class="col-sm-3 control-label">Ссылка на тест</label>
                            <div class="col-sm-9">
                              <input type="text" class="form-control" id="link" name="link" value="${vacancy.testLink}" placeholder="Введите ссылку на теста">
                            </div>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="link" class="col-sm-3 control-label">Тестовый балл</label>
                          <div class="col-sm-9">
                            <input type="number" class="form-control" min="0" max="10" step="0.1" id="pass_score" name="pass_score" value="${vacancy.pass_score}" placeholder="Тестовый балл">
                          </div>
                        </div>
                        <div class="form-group required">
                          <label for="post" class="col-sm-3 control-label">Иностранного языка</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="language_level" name="language_level" >
                              <option value="A1"selected>A1</option>
                              <option value="A2">A2</option>
                              <option value="B1">B1</option>
                              <option value="B2">B2</option>
                              <option value="C1">C1</option>
                              <option value="C2">C2</option>
                            </select>
                          </div>
                        </div>

                        <div class="form-group">
                          <label for="description" class="col-sm-3 control-label">Описание</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="description" name="description" value="${vacancy.description}" placeholder="Введите описание">
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="submit" class="login100-form-btn">Сохранить</button>
                          <button class="login100-form-btn">

                            <a href="#close" title="Закрыть" >Отмена</a>
                          </button>
                        </div>
                      </div>
<%--                    </div>--%>
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