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
            <li><a href="/"><i class="fa fa-user fa-fw"></i>Профиль</a></li>
            <li><a href="#" class="active"><i class="fa fa-file-text-o fa-fw"></i>Анкета</a></li>
            <li><a href="/message-${code}"><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
              <li><a href="/user/vacancy"><i class="fa fa-file-text-o fa-fw"></i>Вакансии</a></li>
              <li><a href="/user/request"><i class="fa fa-file-text-o fa-fw"></i>Мои заявки</a></li>
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
                <li><a href="" class="active">Пользователь</a></li>
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
              <p>В данном раздели вы можете пройти анкетирование, оставить своё резюме и дать нам более полную информацию о вас. Мы обязуемся предоставить конфеденциальность этим данным и не передовать их третьим лицам, без вашего согласия.</p>
              <p>Для того что бы закрыть данную справку нажмите на крестик в верхнем правом углу.</p>              
            </div>                   
            </div>
          </div>

          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative">
                  <h2 class="text-uppercase">Ваша анкета</h2>
                        <section class="home_banner_area">
            <div class="container box_1620">
<%--<form class="form2" method="POST" >--%>
    <form:form method="POST" modelAttribute="anketa" class="form2" action="#" enctype = "multipart/form-data">
      <section class="intro first"><p><span lang="RU">Здравствуйте, <span>${name}</span></span></p><p><span lang="RU">потратьте, пожалуйста, несколько минут своего времени на заполнение следующей анкеты.</span></p><p><span lang="RU">Данная информация может помочь вам при трудоустройстве в наше банковское учереждение.</span></p>
</section>

<div>
  <fieldset>
   <legend><p class="step-icon"><span>01</span></p></legend>
   <label>Работали ли вы где-то до этого момента?</label>
   <div>
<%--     <input name="question1" type="radio" value="Да">Да<br>--%>
    <form:radiobutton path="question1" value="Да"/>Да<br>
    <form:radiobutton path="question1" value="Нет"/>Нет
<%--     <input name="question1" type="radio" value="Нет" > Нет.--%>
     </div>
  </fieldset>
  </div>

<div>
  <fieldset>
   <legend><p class="step-icon"><span>02</span></p></legend>
   <label>Есть ли у Вас какие-либо вредные привычки?</label>
   <div>
       <form:radiobutton path="question2"  name="question2" value="Да"/>Да<br>
           <form:radiobutton path="question2"  name="question2" value="Нет"/>Нет
<%--     <input name="question2" type="radio" value="Да"> Да<br>--%>
<%--     <input name="question2" type="radio" value="Нет" > Нет.--%>
     </div>
  </fieldset>
</div>

<div>
<fieldset>
   <legend><p class="step-icon"><span>03</span></p></legend>
    <label>Сможете ли Вы работать удалённо, при необходимости (неуспели доделать на работе, опасная эпидемиологическая ситуация и т.д.) ?</label>
    <div>

        <form:radiobutton path="question3"  name="question3" value="Да"/>Да<br>
        <form:radiobutton path="question3"  name="question3" value="Нет"/>Нет
<%--     <input  name="question3" type="radio" value="Да"> Да<br>--%>
<%--     <input name="question3" type="radio" value="Нет" > Нет.--%>
    </div>
  </fieldset>
  </div>
<div>
<fieldset>
   <legend><p class="step-icon"><span>04</span></p></legend>
        <label>Как вы оцениваете своё умение работать в команде ?</label>
        <div>
            <form:radiobutton path="question4"  name="assessment" value="Отлично"/>Отлично<br>
                <form:radiobutton path="question4"  name="assessment" value="Хорошо"/>Хорошо<br>
                <form:radiobutton path="question4"  name="assessment" value="Удовлетворительно"/>Удовлетворительно<br>
                <form:radiobutton path="question4"  name="assessment" value="Плохо"/>Плохо
<%--         <input name="question4" type="radio" value="Отлично"> Отлично<br>--%>
<%--         <input name="question4" type="radio" value="Хорошо"> Хорошо <br>--%>
<%--         <input name="question4" type="radio" value="Удовлетворительно"> Удовлетворительно <br>--%>
<%--         <input name="question4" type="radio" value="Плохо"> Плохо.--%>
        </div>
    </fieldset>
    </div>
<div>
<fieldset>
   <legend><p class="step-icon"><span>05</span></p></legend>
      <div>
        <label>Насколько хорошо вы осваиваете новые программные продукты ?</label>
        <div>
            <form:radiobutton path="question5"  name="program" value="Несколько часов"/>Несколько часов<br>
                <form:radiobutton path="question5"  name="program" value="Несколько дней"/>Несколько дней<br>
                <form:radiobutton path="question5"  name="program" value="Несколько недель"/>Несколько недель<br>
                <form:radiobutton path="question5"  name="program" value="Несколько лет"/>Несколько лет
        </div>
      </div>
    </fieldset>
</div>
<div>
<fieldset>
   <legend><p class="step-icon"><span>06</span></p></legend>
    <label>Что вы считаете главным в работе?</label>
    <div>
        <form:checkbox path="question6" name="question6" value="Зарплата"/>Зарплата<br>
        <form:checkbox path="question6" name="question6" value="Самореализация"/> Самореализация<br>
        <form:checkbox path="question6" name="question6" value="Удовольствие от работы"/> Удовольствие от работы<br>
        <form:checkbox path="question6" name="question6" value="Хорошоие условия труда"/> Хорошоие условия труда<br>
        <form:checkbox path="question6" name="question6" value="Коллектив"/> Коллектив<br>
        <form:checkbox path="question6" name="question6" value="Руководство"/> Руководство<br>
   </div>
  </fieldset>
</div>
<div>
<fieldset>
   <legend><p class="step-icon"><span>07</span></p></legend>
    <label>Как бы Вы описали себя самого?</label>
    <div>
        <form:checkbox path="question7" name="question7" value="Общительный"/> Общительный<br>
        <form:checkbox path="question7" name="question7" value="Творческий"/> Творческий<br>
        <form:checkbox path="question7" name="question7" value="Сдержанный"/> Сдержанный<br>
        <form:checkbox path="question7" name="question7" value="Робкий"/> Робкий<br>
        <form:checkbox path="question7" name="question7" value="Кооперирующий"/> Кооперирующий<br>
        <form:checkbox path="question7" name="question7" value="Руководящий"/> Руководящий<br>
        <form:checkbox path="question7" name="question7" value="Действующий"/> Действующий<br>
        <form:checkbox path="question7" name="question7" value="Аналитический"/> Аналитический
   </div>
  </fieldset>
</div>
<div>
<fieldset>
   <legend><p class="step-icon"><span>08</span></p></legend>
    <label>Отметьте то, что Вам интереснее всего</label>
    <div>
        <form:checkbox path="question8" name="question8" value="Спорт"/> Спорт<br>
        <form:checkbox path="question8" name="question8" value="Наука"/> Наука<br>
        <form:checkbox path="question8" name="question8" value="Сериалы"/> Сериалы<br>
        <form:checkbox path="question8" name="question8" value="Кино"/> Кино<br>
        <form:checkbox path="question8" name="question8" value="Книги"/> Книги<br>
        <form:checkbox path="question8" name="question8" value="Музеи"/> Музеи<br>
        <form:checkbox path="question8" name="question8" value="Путешествия"/> Путешествия<br>
        <form:checkbox path="question8" name="question8" value="другое"/> другое
   </div>
  </fieldset>
</div>
<div>
<fieldset>
   <legend><p class="step-icon"><span>09</span></p></legend>

        <label>Сюда вы можете загрузить ваше резюме</label>
<div>

    <input type="file" name="file" id="file"  />
      </div>
</fieldset>
</div>
<div>
<fieldset>
  <legend><p class="step-icon"><span>10</span></p></legend>

        <label>Ваш комментарий</label>
        <div>
            <form:textarea path="review" name="review"></form:textarea>
<%--        <textarea name="review"></textarea>--%>
        </div>
</fieldset>
</div>


      <div>
          <button type="submit" class="login100-form-btn">Отправить</button>
          <button type="reset" class="login100-form-btn">Сбросить</button>
      </div>
    </form:form>
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
    <script src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="${contextPath}/resources/js3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
  
    <script type="text/javascript" src="${contextPath}/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>