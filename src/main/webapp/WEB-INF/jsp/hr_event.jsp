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
    <link href="${contextPath}/resources/css6/templatemo-style.css" rel="stylesheet">
    <link href="${contextPath}/resources/css61/templatemo-style.css" rel="stylesheet">
    
<!-- META ===================================================== -->
  
    <meta name="description" content="A method for responsive tables">

<!-- Favicon  ========================================== -->


<!-- CSS ======================================================
  <link rel="stylesheet" href="css/responsivetables.css">-->
  <!-- Demo CSS (don't use) -->
  <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="${contextPath}/resources/css_calendar/monthly.css">

    <script src="https://use.fontawesome.com/484df5253e.js"></script>
</head>

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
            <li><a href="#" class="active"><i class="fa  fa-calendar fa-fw"></i>Календарь</a></li>
            <li><a href="/hr/interviewer" ><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
            <li><a href="/hr/message"><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
              <li><a href="/hr/test" ><i class="fa fa-comments fa-fw"></i>Конструктор тестов</a></li>
              <li><a  href="/hr/vacancy"><i class="fa fa-database fa-fw"></i>Вакансии</a></li>
              <li><a href="/hr/assesment" ><i class="fa fa-file-text-o fa-fw"></i>Результаты кандидатов</a></li>
              <li><a href="/hr/analysis"><i class="fa fa-file-text-o fa-fw"></i>Анализ кандидатов</a></li>
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
                <p>Добро пожаловать в ваш аккаунт сотрудника. Данный аккаунт предоставляет вам возможность контролировать важные экономические показатели в режиме реального времени, а так же просматривать статистику за определённый период.</p><p>
                В аккаунте содержится ваша личная информация. Так же здесь размещается календарь событий, который включает в себя расписание встреч, больничных и отпусков. При помощи вашей странички вы можете просматривать свои расчётные листы и заказывать нужные вам документы онлайн.</p>
                <p>Если вы ознакомились со справочной информацией и она вам больше не нужна, нажните на крестик в правом верхнем углу</p>
            </div>
            </div>
          
          </div> <!-- Second row ends -->
            <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                

                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Календарь событий</h2></div>
<div class= "a_calendare">

 <button class="login100-form-btn" style="
    margin-top: 30px;
    margin-left: 605px;
">
                            
<a href="#openModal2" title="Добавить событие в мой календарь" >Добавить событие в мой календарь</a>  

</button>

<div id="openModal2" class="modalDialog2">
  <div>
    <a href="#close" title="Закрыть" class="close">X</a>

                          <form method="post">
                          <div class="modal-body">
                            <input type="number" id="id" name="id" class="hidden">
                            <div class="form-group required">
                              <label for="Название события" class="col-sm-3 control-label">Название события</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" id="firstName" name="type" placeholder="Название события" required="">
                              </div>
                            </div>
                            
                            <div class="form-group">
                              <label for="Дата" class="col-sm-3 control-label">Дата начала события</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" id="dob" name="dateStart" placeholder="10/01/2020">
                              </div>
                            </div>
                           
                            <div class="form-group">
                              <label for="Дата" class="col-sm-3 control-label">Дата окончания события</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" id="dob" name="dateEnd" placeholder="10/01/2020">
                              </div>
                            </div>
                            

                            <div class="form-group required">
                              <label for="Время" class="col-sm-3 control-label">Время начала события</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" id="startedOn" name="timeStart" placeholder="10:00" required="">
                              </div>
                            </div>

                            <div class="form-group required">
                              <label for="Время" class="col-sm-3 control-label">Время окончания события</label>
                              <div class="col-sm-9">
                                <input type="text" class="form-control" id="startedOff" name="timeEnd" placeholder="12:00" required="">
                              </div>
                            </div>

                          </div>

                              <div><p style="color:red;">${dateError}</p></div>

                          <div class="modal-footer2">
                             <button type="submit" class="login100-form-btn">Сохранить изменения</button>
                            <button class="login100-form-btn">
                            
                            <a href="#close" title="Закрыть" >Отмена</a>
                          </button>
                            
                          </div>
                        </form>
                        
  </div>
</div>   

</div> 

<div class="page">
    <div style="width:100%; max-width:1650px; display:inline-block;margin-top: 20px;">
      <div class="monthly" id="mycalendar"></div>
    </div>
    <br><br>
    </div>

    </div>   

          
          
          <footer class="text-right">
            <p>КП &copy; 2020 БГУИР
            | Developers: Городецкая А.М.</p>
          </footer>         
        </div>
      </div>
    </div>

    <!-- JS ======================================================= -->
<script type="text/javascript" src="${contextPath}/resources/js_calendar/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js_calendar/monthly.js"></script>
<!-- <script type="text/javascript">
  $(window).load( function() {

    $('#mycalendar').monthly({
      mode: 'event',
      //jsonUrl: 'events.json',
      //dataType: 'json'
      xmlUrl: 'events.xml'
    });

    $('#mycalendar2').monthly({
      mode: 'picker',
      target: '#mytarget',
      setWidth: '250px',
      startHidden: true,
      showTrigger: '#mytarget',
      stylePast: true,
      disablePast: true
    });

  switch(window.location.protocol) {
  case 'http:':
  case 'https:':
  // running on a server, should be good.
  break;
  case 'file:':
  alert('Нажмите ок, что бы могли загрузить ваш календарь.');
  }

  });
</script> -->

<script type="text/javascript">

  var sampleEvents = {
  "monthly": [
      <c:forEach items="${eventForm}" var = "event" >
      {
          "id": ${event.id},
          "name": "${event.type}",
          "startdate": "${event.startDate}",
          "enddate": "${event.endDate}",
          "starttime": "${event.startTime}",
          "endtime": "${event.endTime}",
          "color": "${event.color}",
          "url": "${event.url}"
      },
      </c:forEach>
  ]
  };

  $(window).load( function() {
    $('#mycalendar').monthly({
      mode: 'event',
      dataType: 'json',
      events: sampleEvents
    });
  });
</script>
    
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>