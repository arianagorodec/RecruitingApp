<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>User</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
     <link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<title>CodePen - Chat Widget</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
    <link href="${contextPath}/resources/css31/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css31/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css31/templatemo-style.css" rel="stylesheet">

     </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>User</h1>
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
                <li><a href="/hr/interviewer" ><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
                <li><a href="/hr/message" ><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
                <li><a href="#" class="active"><i class="fa fa-comments fa-fw"></i>Конструктор тестов</a></li>
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
                <li><a href="" class="active">HR</a></li>
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
              <p>В данном раздели Вы можете составить тест для соответствующей вакансии.</p>
              <p>Для того что бы закрыть данную справку нажмите на крестик в верхнем правом углу.</p>              
            </div>                   
            </div>
          </div>

          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative">
                  <h2 class="text-uppercase">Конструктор тестов</h2>
                        <section class="home_banner_area">
            <div class="container box_1620">
                <form method="POST" action="/hr/test/select_vacancy">
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
                    <div>
                        <button type="submit" class="login100-form-btn">Выбрать</button>
                    </div>
                </form>

                <form method="POST" class="form2" action="#">
                    <section class="intro first"><p><span lang="RU">Вы можете добавлять вопросы с помощью кнопки "+ вопрос"</span></p><p><span lang="RU">Так же Вы можете добавить ответ, нажав "+".</span></p><p><span lang="RU">После завершения создания теста нажмите кнопку "Сохранить".</span></p>
                    </section>
                    <c:if test="${test}!=null">
                    <c:forEach items="${test.questionList}" var = "question" >
                    <div>
                      <fieldset>
                       <legend><p class="step-icon"><span>01</span></p></legend>
                       <label>Работали ли вы где-то до этого момента?</label>
                       <div>
                           <c:forEach items="${question.answers}" var = "answer" >
                               <c:if test="${answer.correct == true}">
                                   <input type="checkbox" name="answer" value="${answer.text}">${answer.text}<br>
                               </c:if>
                               <c:if test="${answer.correct != true}">
                                   <input type="checkbox" name="answer" value="${answer.text}">${answer.text}<br>
                               </c:if>
                           </c:forEach>
                       </div>
                      </fieldset>
                      </div>
                    </c:forEach>
                    </c:if>
                    <c:if test="${test}==null">

                        <div>
                            <fieldset>
                                <legend><p class="step-icon"><span>01</span></p></legend>
                                <label><input type="text" name="question1" id="q1" value="Это тест?"></label>
                                <div>
                                    <div class="answer">
                                    <input type="text" name="answer11" id="a11" value="Да">
                                    </div>
                                    <div class="answer">
                                    <input type="text" name="answer12" id="a12" value="Нет">
                                    </div>
                                    <div>
                                        <button class="login100-form-btn">+</button>
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                    </c:if>
                    <div>
                        <button type="button" class="login100-form-btn">+ Вопрос</button>
                    </div>

                    <div>
                        <button type="submit" class="login100-form-btn">Сохранить</button>
                    </div>
                </form>
            </div>
        </section>
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
    <script>
        $('button').click(function() {
            parent=$(this).closest('div.answer');
            console.log(parent.attr('id'))
        })
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="${contextPath}/resources/js3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
  
    <script type="text/javascript" src="${contextPath}/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>