<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>User</title>
    <meta name="description" content=""/>
    <meta name="author" content="templatemo"/>
   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
     <link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen"/>
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<title>CodePen - Chat Widget</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"/>
      <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'/>
      <link href="${contextPath}/resources/css5/font-awesome.min.css" rel="stylesheet"/>
      <link href="${contextPath}/resources/css5/bootstrap.min.css" rel="stylesheet"/>
      <link href="${contextPath}/resources/css5/templatemo-style.css" rel="stylesheet"/>
      <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>

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
          <img src="${contextPath}/resources/images3/profile-photo.jpg" alt="Profile Photo" class="img-responsive"/>
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term"/>
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="/user"><i class="fa fa-user fa-fw"></i>Профиль</a></li>
            <li><a href="/user/quest"><i class="fa fa-file-text-o fa-fw"></i>Анкета</a></li>
            <li><a href="/message-${code}"><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
              <li><a href="#" class="active"><i class="fa fa-file-text-o fa-fw"></i>Вакансии</a></li>
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
                        <p>Добро пожаловать на страницу с ваканстями. Здесь Вы можете увидеть все вакансии и откликнуться на подходящие Вам</p>
                        <p>Если вы ознакомились со справочной информацией и она вам больше не нужна, нажмите на крестик в правом верхнем углу</p>
                    </div>
                </div>
                <div class="templatemo-flex-row flex-content-row">

                    <div class="col-1">
                        <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                            <i class="fa fa-times"></i>
                            <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Вакансии</h2></div>
                            <div class="table-responsive">
                                <div class="pricingTable">
                                    <ul class="pricingTable-firstTable">
                                        <c:forEach items="${vacancyList}" var = "vacancy" >
                                        <li class="pricingTable-firstTable_table">
                                            <form method="post">
                                                <h1 id = "typeVacancy" class="pricingTable-firstTable_table__header">${vacancy.name}<input type="hidden" name="id" value="${vacancy.id}"></h1>
                                                <p class="pricingTable-firstTable_table__pricing"><span>${vacancy.description}</span></p>
<%--                                                <ul class="pricingTable-firstTable_table__options">--%>
<%--                                                    <li>${name}</li>--%>
<%--                                                    <li>${date}</li>--%>
<%--                                                    <li><input type="text" name="typeCertificate" style="outline: none; border: none; background: #f9f9f9;" value="по месту работы" readonly> </li>--%>
<%--                                                </ul>--%>
                                                <c:if test="${vacancy.use.equals(false)}">
                                                <div><button type="submit" class="pricingTable-firstTable_table__getstart" style="width: 250px">Откликнуться</button></div>
                                                </c:if>
                                                <c:if test="${vacancy.use.equals(true)}">
                                                    <div><a>Вы уже откликнулись на данную вакансию</a></div>
                                                </c:if>
                                            </form>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Second row ends -->
                <footer class="text-right">
                    <p>КП &copy; 2020 БГУИР
                        | Городецкая А.М.</p>
                </footer>
            </div>
        </div>
    </div>
    
    <!-- JS -->
    <script src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="${contextPath}/resources/js3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>
        var fm = new FluidMeter();
        fm.init({
            targetContainer: document.getElementById("fluid-meter"),
            fillPercentage: 15,
            options: {
                fontFamily: "Raleway",
                drawPercentageSign: false,
                drawBubbles: true,
                size: 300,
                borderWidth: 19,
                backgroundColor: "#e2e2e2",
                foregroundColor: "#fafafa",
                foregroundFluidLayer: {
                    fillStyle: "green",
                    angularSpeed: 100,
                    maxAmplitude: 12,
                    frequency: 30,
                    horizontalSpeed: -150
                },
                backgroundFluidLayer: {
                    fillStyle: "#4fab40",
                    angularSpeed: 100,
                    maxAmplitude: 9,
                    frequency: 30,
                    horizontalSpeed: 150
                }
            }
        });



        window.onload = function () {
            document.getElementById("submit-percentage-1").onclick = function () {
                fm.setPercentage(Number(document.getElementById('percentage-1').value))
            }

        };
    </script>
  </body>
</html>
