<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

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
            <li><a href="#" class="active"><i class="fa fa-bar-chart fa-fw"></i>Диаграммы</a></li>
            <li><a href="/worker/event" ><i class="fa  fa-calendar fa-fw"></i>Календарь</a></li>
            <li><a href="/worker/recruiting" ><i class="fa fa-file-text-o fa-fw"></i>Подбор кандидатов</a></li>
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
                       
            <div class="templatemo-content-widget white-bg col-1">
              <i class="fa fa-times"></i>
              <h2 class="text-uppercase">Основные показатели</h2><br>
              <h3 class="text-uppercase">Инфляция</h3>
              <div class="progress">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
              </div>
              <h3 class="text-uppercase">ИПЦ</h3>
              <div class="progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
              </div>
              <h3 class="text-uppercase">ВВП</h3>
              <div class="progress">
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
              </div>                          
            </div>
          </div>

          
          <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
            <div class="col-1 templatemo-overflow-hidden">
              <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="templatemo-flex-row flex-content-row">
                  <div class="col-1 col-lg-6 col-md-12">
                    <h2 class="text-center">Займы в валюте<!-- <span class="badge">new</span> --></h2>
                    <div id="pie_chart_div" class="templatemo-chart"></div> <!-- Pie chart div -->
                  </div>
                  <div class="col-1 col-lg-6 col-md-12">
                    <h2 class="text-center">Курсы валют<!-- <span class="badge">new</span> --></h2>
                    <div id="bar_chart_div" class="templatemo-chart"></div> <!-- Bar chart div -->
                  </div>  
                </div>                
              </div>
            </div>
          </div>
          <div class="templatemo-flex-row flex-content-row">
             <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Таблица</h2></div>
                <div class="table-responsive">
                  <table class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <td>№</td>
                        <td>Отдел</td>
                        <td>Должность</td>
                        <td>Фамилия</td>
                        <td>Имя</td>
                        <td>E-mail</td>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${employeeForm}" var = "employee" >
                      <tr>
                        <td>${employee.id}</td>
                        <td>${employee.post.department}</td>
                        <td>${employee.post.post}</td>
                        <td>${employee.surname}</td>
                        <td>${employee.name}</td>
                        <td>${employee.email}</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>    
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
    <script>
      var uri = 'https://www.nbrb.by/API/';
      var dollar;
      var eur;
      var rub;
      var uan;
      var funt;

      $.getJSON(uri + 'ExRates/Rates/' + '145', { 'ParamMode': 0 })
              .done(function (data) {
                var dollarJSON=JSON.stringify(data);
                dollar = JSON.parse(dollarJSON).Cur_OfficialRate;
              });

      $.getJSON(uri + 'ExRates/Rates/' + '292', { 'ParamMode': 0 })
              .done(function (data) {
                var eurJSON=JSON.stringify(data);
                eur = JSON.parse(eurJSON).Cur_OfficialRate;
              });

      $.getJSON(uri + 'ExRates/Rates/' + '298', { 'ParamMode': 0 })
              .done(function (data) {
                var rubJSON=JSON.stringify(data);
                rub = JSON.parse(rubJSON).Cur_OfficialRate;
              });

      $.getJSON(uri + 'ExRates/Rates/' + '304', { 'ParamMode': 0 })
              .done(function (data) {
                var uanJSON=JSON.stringify(data);
                uan = JSON.parse(uanJSON).Cur_OfficialRate;
              });

      $.getJSON(uri + 'ExRates/Rates/' + '143', { 'ParamMode': 0 })
              .done(function (data) {
                var funtJSON=JSON.stringify(data);
                funt = JSON.parse(funtJSON).Cur_OfficialRate;
              });

      /* Google Chart
      -------------------------------------------------------------------*/
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.


      function drawChart() {
        // ratetoday();
        // alert(zlot);
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['Доллар', dollar],
            ['Евро', eur],
            ['Российский руб.(100)', rub],
            ['Юань(100)', uan],
            ['Фунт стерлингов', funt]
          ]);

          // Set chart options
          var options = {'title':'Статистика за последний месяц'};

          // Instantiate and draw our chart, passing in some options.
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);

          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });
        } else {
          $(window).resize(function(){
            drawChart();
          });
        }
      });

    </script>
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>