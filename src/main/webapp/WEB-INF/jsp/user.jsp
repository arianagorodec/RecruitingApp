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
    <link href="${contextPath}/resources/css3/font-awesome.min.css" rel="stylesheet"/>
    <link href="${contextPath}/resources/css3/bootstrap.min.css" rel="stylesheet"/>
    <link href="${contextPath}/resources/css3/templatemo-style.css" rel="stylesheet"/>

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
            <li><a href="#" class="active"><i class="fa fa-user fa-fw"></i>Профиль</a></li>
            <li><a href="/user/quest"><i class="fa fa-file-text-o fa-fw"></i>Анкета</a></li>
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
              <h2 class="templatemo-inline-block">Инструкция для пользвователя</h2><hr/>
              <p>Эта ваш личный аккаунт соискателя. Он позволяет оставатся на связи с нами, а так же  включает в себя разнообразные функции: ваш личный профиль, анкету которую вы можете заполнить по желанию и специальный раздел,где вы можете пообщатся с нашим сотрудником и узнать о нас по больше. Также здесь есть возможность узнть о новых вакансиях, подать свою заявку на вакансию и узнать результат ваших собеседований</p>
              <p>Для того что бы закрыть данную справку нажмите на крестик в верхнем правом углу.</p>              
            </div>                   
            </div>
          </div>

          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative">
                  <h2 class="text-uppercase">Ваш профиль</h2>
          
               
              <section class="home_banner_area">
            <div class="container box_1620">

              <div class="banner_content">
            <div class="media" style=" width:1400px;">
            <c:if test="${not empty photo}">
              <div class="d-flex">
                <img src="/photoUser/${photo}" width="668" height="690" alt="profile"/>
              </div>
            </c:if>
              <div class="media-body">
                <div class="personal_text">
                  <h3>${name}</h3>
                  <h4>Candidate</h4>
                  <p>Соискатель.</p>
                  <ul class="list basic_info">
                    <li><a href="#"><i class="fa fa-calendar-o"></i> ${birthday} </a></li>
                    <li><a href="#"><i class="fa fa-phone"></i> ${mobphone}</a></li>
                    <li><a href="#"><i class="fa  fa-envelope"></i> ${email}</a></li>
                    <li><a href="#"><i class="fa  fa-transgender"></i> ${gender}</a></li>
                  </ul>

                  <ul class="list personal_social">
                    <li><a href="#open1"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#open2"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#open3"><i class="fa fa-linkedin"></i></a></li>
                  </ul>

                    <div id="open1" class="modal">
                        <div>
                            <a href="#close" title="Закрыть" class="close">X</a>
                            <form method="post" action="/user/facebook">
                                <div class="modal-body">
                                    <input type="networc" id="id2" name="id" class="hidden"/>
                                    <div class="form-group required">
                                        <label  class="col-sm-3 control-label" style="color:#606061 ">Ссылка на социальную сеть</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="facebookLink" name="facebookLink" placeholder="Введите ссылку" value="${facebook}" required=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="login100-form-btn">Сохранить изменения</button>
                                    <button class="login100-form-btn">
                                        <a href="#close" title="Закрыть" >Отмена</a>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div id="open2" class="modal">
                        <div>
                            <a href="#close" title="Закрыть" class="close">X</a>
                    <form method="post" action="/user/twitter">
                        <div class="modal-body">
                            <input type="networc" id="id3" name="id" class="hidden"/>
                            <div class="form-group required">
                                <label  class="col-sm-3 control-label" style="color:#606061 ">Ссылка на социальную сеть</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="twitterLink" name="twitterLink" placeholder="Введите ссылку" value="${twitter}" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="login100-form-btn">Сохранить изменения</button>
                            <button class="login100-form-btn">
                                <a href="#close" title="Закрыть" >Отмена</a>
                            </button>
                        </div>
                    </form>
                </div>
              </div>

                    <div id="open3" class="modal">
                        <div>
                            <a href="#close" title="Закрыть" class="close">X</a>
                            <form method="post" action="/user/linked">
                                <div class="modal-body">
                                    <input type="networc" id="id" name="id" class="hidden"/>
                                    <div class="form-group required">
                                        <label  class="col-sm-3 control-label" style="color:#606061 ">Ссылка на социальную сеть</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="linkedLink" name="linkedLink" placeholder="Введите ссылку" value="${linked}" required=""/>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="login100-form-btn">Сохранить изменения</button>
                                    <button class="login100-form-btn">
                                        <a href="#close" title="Закрыть" >Отмена</a>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <form method="post" enctype="multipart/form-data">
                        <ul class="list_download">
                    <input type="file" name="file" id="file"  />
                    <label for="file">Новый аватар</label>
                    <button class="login100-form-btn" href="#" >Заменить</button>
                 </ul>
                </form>
                </div>
              </div>
            </div>
          </div>

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
         <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->
  </body>
</html>
