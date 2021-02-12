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
    <link href="${contextPath}/resources/css6/templatemo-style.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400' rel='stylesheet' type='text/css'>
    <script type="application/javascript" src="${contextPath}/resources/rpie.js"></script>

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
            <li><a href="#" class="active"><i class="fa fa-area-chart"></i>Статистика</a></li>
            <li><a href="/hr/profile" ><i class="fa  fa-list-alt"></i>Досье</a></li>
            <li><a href="/hr/event" ><i class="fa  fa-calendar fa-fw"></i>Календарь</a></li>
            <li><a href="/hr/interviewer" ><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
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
                <li><a href="" class="active">HR</a></li>
              </ul>
            </nav> 
          </div>
        </div>


<div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Общая статистика по соискателям</h2></div>
                <div class="table-responsive" style="
    margin-top: 100px; margin-bottom: 100px; ">


    <div class="false-For-Bottom-Text">
      <h2 class="templatemo-inline-block" style="margin-left: 90px;">Возрастное распределение </h2>
       <h2 class="templatemo-inline-block" style="margin-left: 470px;">Половое распределение</h2>
        <div>
        <ul class="templatemo-inline-block">
            <li><i class="fa fa-square" style="margin-left: 90px; color:#4CAF50;"></i>20-</li>
            <li><i class="fa fa-square" style="margin-left: 90px; color:#00BCD4;"></i>20-45</li>
            <li><i class="fa fa-square" style="margin-left: 90px; color:#E91E63;"></i>45+</li>
        </ul>
        <ul class="templatemo-inline-block">
            <li><i class="fa fa-square" style="margin-left: 770px; color:#f0b6da;"></i>Женский</li>
            <li><i class="fa fa-square" style="margin-left: 770px; color:#00BCD4;"></i>Мужской</li>
        </ul>
        </div>
       <hr>
    <div class="mypiechart" style="margin-left: 120px;">  

      <canvas id="myCanvas" width="300" height="300"></canvas>
     
      <canvas id="myCanvas1" width="300" height="300" style="margin-left: 500px;"></canvas>
    </div>

   
  </div>

              
                </div>                          
              </div>
            </div> 

<div class="templatemo-content-widget white-bg col-2">
              <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Графики по анкетам соискателей</h2></div>
                <div>
                <div id="contenitore">
<div class="left">

<table>
<caption>Как вы оцениваете своё умение работать в команде ?</caption>
<tbody>
<tr><td>Отлично</td><td>${question4Perfect}%</td><td style="background-color:#336699">&nbsp;</td></tr>
<tr><td>Хорошо </td><td>${question4Good}%</td><td style="background-color:#003366">&nbsp;</td></tr>
<tr><td> Удовлетворительно </td><td>${question4Ok}%</td><td style="background-color:#ff6600">&nbsp;</td></tr>
<tr><td>Плохо</td><td>${question4Bad}%</td><td style="background-color:#ffcc00">&nbsp;</td></tr>
</tbody></table>

<div class="button" onclick="viewGraph()">Обновить</div>
</div>
<div class="left">
<div id="grafico">
<div class="riga" style="top:25%"><div>75%</div></div>
<div class="riga" style="top:50%"><div>50%</div></div>
<div class="riga" style="top:75%"><div>25%</div></div>
<div id="col0" style="left:0; background-color:#336699;" class="column"></div>
<div id="col1" style="left:25%; background-color:#003366;" class="column"></div>
<div id="col2" style="left:50%; background-color:#ff6600;" class="column"></div>
<div id="col3" style="left:75%; background-color:#ffcc00;" class="column"></div>
</div>
</div>
<div class="canc"></div>

</div>

<div id="contenitore2">
<div class="left">

<table>
<caption>Насколько хорошо вы осваиваете новые программные продукты ?</caption>
<tbody>
<tr><td>Несколько часов</td><td>${question5Hour}%</td><td style="background-color:#336699">&nbsp;</td></tr>
<tr><td>Несколько дней</td><td>${question5Day}%</td><td style="background-color:#003366">&nbsp;</td></tr>
<tr><td>Несколько недель</td><td>${question5Week}%</td><td style="background-color:#ff6600">&nbsp;</td></tr>
<tr><td>Несколько лет</td><td>${question5Year}%</td><td style="background-color:#ffcc00">&nbsp;</td></tr>
</tbody></table>

<div class="button" onclick="viewGraph2()">Обновить</div>
</div>
<div class="left">
<div id="grafico2">
<div class="riga" style="top:25%"><div>75%</div></div>
<div class="riga" style="top:50%"><div>50%</div></div>
<div class="riga" style="top:75%"><div>25%</div></div>
<div id="col4" style="left:0; background-color:#336699;" class="column2"></div>
<div id="col5" style="left:25%; background-color:#003366;" class="column2"></div>
<div id="col6" style="left:50%; background-color:#ff6600;" class="column2"></div>
<div id="col7" style="left:75%; background-color:#ffcc00;" class="column2"></div>
</div>
</div>

<div class="canc"></div>

</div>

<div id="contenitore3">
<div class="left">

<table>
<caption>Работали ли вы где-то до этого момента?</caption>
<tbody>
<tr><td>Да</td><td>${question1Yes}%</td><td style="background-color:#ff6600">&nbsp;</td></tr>
<tr><td>Нет</td><td>${question1No}%</td><td style="background-color:#ffcc00">&nbsp;</td></tr>
</tbody></table>

<div class="button" onclick="viewGraph3()">Обновить</div>
</div>
<div class="left">
<div id="grafico3">
<div class="riga" style="top:25%"><div>75%</div></div>
<div class="riga" style="top:50%"><div>50%</div></div>
<div class="riga" style="top:75%"><div>25%</div></div>
<div id="col8" style="left:25%; background-color:#ff6600;" class="column3"></div>
<div id="col9" style="left:55%; background-color:#ffcc00;" class="column3"></div>
</div>
</div>

<div class="canc"></div>

</div>


<div id="contenitore4">
<div class="left">

<table>
<caption>Есть ли у Вас какие-либо вредные привычки?</caption>
<tbody>
<tr><td>Да</td><td>${question2Yes}%</td><td style="background-color:#ff6600">&nbsp;</td></tr>
<tr><td>Нет</td><td>${question2No}%</td><td style="background-color:#ffcc00">&nbsp;</td></tr>
</tbody></table>

<div class="button" onclick="viewGraph4()">Обновить</div>
</div>
<div class="left">
<div id="grafico4">
<div class="riga" style="top:25%"><div>75%</div></div>
<div class="riga" style="top:50%"><div>50%</div></div>
<div class="riga" style="top:75%"><div>25%</div></div>
<div id="col10" style="left:25%; background-color:#ff6600;" class="column4"></div>
<div id="col11" style="left:55%; background-color:#ffcc00;" class="column4"></div>
</div>
</div>

<div class="canc"></div>
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
    

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>
    <!-- Templatemo Script -->
<script type="text/javascript">
    
    <%--var obj = {--%>
    <%--        values: [${aTwenty}, ${twenty30}, ${thirty40}, ${forty50}, ${fiftyPlus}],--%>
    <%--        colors: ['#4CAF50', '#00BCD4', '#E91E63', '#FFC107', '#9E9E9E'],--%>
    <%--        animation: true, // Takes boolean value & default behavious is false--%>
    <%--        animationSpeed: 50, // Time in miliisecond & default animation speed is 20ms--%>
    <%--        fillTextData: true, // Takes boolean value & text is not generate by default --%>
    <%--        fillTextColor: '#fff', // For Text colour & default colour is #fff (White)--%>
    <%--        fillTextAlign: 1.30, // for alignment of inner text position i.e. higher values gives closer view to center & default text alignment is 1.85 i.e closer to center--%>
    <%--        fillTextPosition: 'inner', // 'horizontal' or 'vertical' or 'inner' & default text position is 'horizontal' position i.e. outside the canvas--%>
    <%--        doughnutHoleSize: 50, // Percentage of doughnut size within the canvas & default doughnut size is null--%>
    <%--        doughnutHoleColor: '#fff', // For doughnut colour & default colour is #fff (White)--%>
    <%--        offset: 1, // Offeset between two segments & default value is null--%>
    <%--        pie: 'normal', // if the pie graph is single stroke then we will add the object key as "stroke" & default is normal as simple as pie graph--%>
    <%--        isStrokePie: { --%>
    <%--          stroke: 20, // Define the stroke of pie graph. It takes number value & default value is 20--%>
    <%--          overlayStroke: true, // Define the background stroke within pie graph. It takes boolean value & default value is false--%>
    <%--          overlayStrokeColor: '#eee', // Define the background stroke colour within pie graph & default value is #eee (Grey)--%>
    <%--          strokeStartEndPoints: 'Yes', // Define the start and end point of pie graph & default value is No--%>
    <%--          strokeAnimation: true, // Used for animation. It takes boolean value & default value is true--%>
    <%--          strokeAnimationSpeed: 40, // Used for animation speed in miliisecond. It takes number & default value is 20ms--%>
    <%--          fontSize: '60px', // Used to define text font size & default value is 60px--%>
    <%--          textAlignement: 'center', // Used for position of text within the pie graph & default value is 'center'--%>
    <%--          fontFamily: 'Arial', // Define the text font family & the default value is 'Arial'--%>
    <%--          fontWeight: 'bold' //  Define the font weight of the text & the default value is 'bold'--%>
    <%--        }--%>
    <%--        };--%>
    var obj = {
        values: [${aTwenty}, ${twenty45}, ${old45}],
        colors: ['#4CAF50', '#00BCD4', '#E91E63'],
        animation: true, // Takes boolean value & default behavious is false
        animationSpeed: 50, // Time in miliisecond & default animation speed is 20ms
        fillTextData: true, // Takes boolean value & text is not generate by default
        fillTextColor: '#fff', // For Text colour & default colour is #fff (White)
        fillTextAlign: 1.30, // for alignment of inner text position i.e. higher values gives closer view to center & default text alignment is 1.85 i.e closer to center
        fillTextPosition: 'inner', // 'horizontal' or 'vertical' or 'inner' & default text position is 'horizontal' position i.e. outside the canvas
        doughnutHoleSize: 50, // Percentage of doughnut size within the canvas & default doughnut size is null
        doughnutHoleColor: '#fff', // For doughnut colour & default colour is #fff (White)
        offset: 1, // Offeset between two segments & default value is null
        pie: 'normal', // if the pie graph is single stroke then we will add the object key as "stroke" & default is normal as simple as pie graph
        isStrokePie: {
            stroke: 20, // Define the stroke of pie graph. It takes number value & default value is 20
            overlayStroke: true, // Define the background stroke within pie graph. It takes boolean value & default value is false
            overlayStrokeColor: '#eee', // Define the background stroke colour within pie graph & default value is #eee (Grey)
            strokeStartEndPoints: 'Yes', // Define the start and end point of pie graph & default value is No
            strokeAnimation: true, // Used for animation. It takes boolean value & default value is true
            strokeAnimationSpeed: 40, // Used for animation speed in miliisecond. It takes number & default value is 20ms
            fontSize: '60px', // Used to define text font size & default value is 60px
            textAlignement: 'center', // Used for position of text within the pie graph & default value is 'center'
            fontFamily: 'Arial', // Define the text font family & the default value is 'Arial'
            fontWeight: 'bold' //  Define the font weight of the text & the default value is 'bold'
        }
    };

    var obj1 = {
            values: [${woman}, ${man}],
            colors: ['#f0b6da', '#00BCD4'],
            animation: true, // Takes boolean value & default behavious is false
            animationSpeed: 50, // Time in miliisecond & default animation speed is 20ms
            fillTextData: true, // Takes boolean value & text is not generate by default 
            fillTextColor: '#fff', // For Text colour & default colour is #fff (White)
            fillTextAlign: 1.30, // for alignment of inner text position i.e. higher values gives closer view to center & default text alignment is 1.85 i.e closer to center
            fillTextPosition: 'inner', // 'horizontal' or 'vertical' or 'inner' & default text position is 'horizontal' position i.e. outside the canvas
            doughnutHoleSize: 50, // Percentage of doughnut size within the canvas & default doughnut size is null
            doughnutHoleColor: '#fff', // For doughnut colour & default colour is #fff (White)
            offset: 1, // Offeset between two segments & default value is null
            pie: 'normal', // if the pie graph is single stroke then we will add the object key as "stroke" & default is normal as simple as pie graph
            isStrokePie: { 
              stroke: 20, // Define the stroke of pie graph. It takes number value & default value is 20
              overlayStroke: true, // Define the background stroke within pie graph. It takes boolean value & default value is false
              overlayStrokeColor: '#eee', // Define the background stroke colour within pie graph & default value is #eee (Grey)
              strokeStartEndPoints: 'Yes', // Define the start and end point of pie graph & default value is No
              strokeAnimation: true, // Used for animation. It takes boolean value & default value is true
              strokeAnimationSpeed: 40, // Used for animation speed in miliisecond. It takes number & default value is 20ms
              fontSize: '60px', // Used to define text font size & default value is 60px
              textAlignement: 'center', // Used for position of text within the pie graph & default value is 'center'
              fontFamily: 'Arial', // Define the text font family & the default value is 'Arial'
              fontWeight: 'bold' //  Define the font weight of the text & the default value is 'bold'
            }
            };

    //Generate myCanvas   
    generatePieGraph('myCanvas', obj);
    
    //Generate myCanvas1
    generatePieGraph('myCanvas1', obj1);
   
    
  </script>
  </body>
</html>