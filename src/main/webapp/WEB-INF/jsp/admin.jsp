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
            <li><a href="#" class="active"><i class="fa fa-bar-chart fa-fw"></i>Статистика</a></li>
            <li><a href="/admin/employee"><i class="fa fa-users fa-fw"></i>Управление сотрудниками</a></li>
            <li><a href="/admin/user"><i class="fa fa-users fa-fw"></i>Управление соискателями</a></li>
            <li><a href="/admin/2"><i class="fa fa-users fa-fw"></i>Управление администратарами</a></li>
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
              <p>Если вам больше не нужна данная справка, то вы можете её закрыть, нажав на соответствующий значёк в верхнем правом углу
              </p>            
            </div>
 
          </div>
          <div class="templatemo-flex-row flex-content-row">
          
 
<div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">Общая статистика пользователей</h2></div>
                <div class="table-responsive" style="
    margin-top: 100px; margin-bottom: 100px; ">

                <div class="templatemo-flex-row flex-content-row">
                  <div class="col-1 col-lg-6 col-md-12">
                    <h2 class="text-center"></h2>
                    <div id="pie_chart_div" class="templatemo-chart"></div> <!-- Pie chart div -->
                  </div>
                  <div class="col-1 col-lg-6 col-md-12">
                    
                    <div id="bar_chart_div" class="templatemo-chart"></div> <!-- Bar chart div -->
                  </div>  
                </div>
              </div>
            </div>



             
         
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>
    <!-- Templatemo Script -->

          <footer class="text-right">
            <p>КП &copy; 2020 БГУИР
            | Developers: Городецкая А.М.</p>
          </footer>         
        </div>
      </div>
    </div>
    </div>

    <!-- JS -->
    <script src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="${contextPath}/resources/s3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>
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

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['HR', 3],
            ['Сотрудник', 2],
            ['Соискатель', 1]
           
          ]);

          // Set chart options
          var options = {'title':''};

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
    <script type="text/javascript">
    
    var obj = {
            values: [15, 50, 20, 85, 30],
            colors: ['#4CAF50', '#00BCD4', '#E91E63', '#FFC107', '#9E9E9E'],
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
            values: [37, 63],
            colors: ['#4CAF50', '#00BCD4'],
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
    <script type="text/javascript" src="../../../../../../../Desktop/ib/admin/js5/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>