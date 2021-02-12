<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link href="${contextPath}/resources/css3/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css3/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css31/templatemo-style.css" rel="stylesheet">
  
      </head>
  <body translate="no">  
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
            <li><a href="/user/quest"><i class="fa fa-file-text-o fa-fw"></i>Анкета</a></li>
            <li><a href="#"  class="active"><i class="fa fa-comments fa-fw" ></i>Сообщения</a></li>
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
                      <h2 class="templatemo-inline-block">Инструкция для пользвователя</h2><hr>
                      <p>Эта специальный чат с нашим HR сотрудником. Здесь вы можете задать ему интересующие Вас вопросы, по поводу нашей компании и вашей вакансии. </p>
                      <p>Для того что бы закрыть данную справку нажмите на крестик в верхнем правом углу.</p>
                      <p id="connecting"></p>
                  </div>
              </div>
          </div>

          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative">
                  <h2 class="text-uppercase">Ваш чат</h2>
                        <section class="home_banner_area">
            <div class="container box_1620">
<div class="chat">
<div class="chat-header clearfix">
    <c:if test="${not empty photo}">
        <img src="/photoUser/${photo}" width="55" height="55" alt="avatar">
    </c:if>
<%--<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/chat_avatar_01_green.jpg" alt="avatar" />--%>
<div class="chat-about">
<div class="chat-with">Чат с HR сотрудником</div>
<div class="chat-num-messages">всего Х сообщений</div>
</div>
<i class="fa fa-star"></i>
</div> 
<div class="chat-history">
<ul>
<c:if test = "${list != null}">
    <c:forEach items="${list}" var = "message" >
        <c:if test = "${message.userFrom.username != username}">
            <li>
                <div class="message-data">
                    <span class="message-data-name"><i class="fa fa-circle online"></i> HR</span>
                    <span class="message-data-time">${message.time}</span>
                </div>
                <div class="message my-message">
                        ${message.message}
                </div>
            </li>
        </c:if>
        <c:if test = "${message.userFrom.username == username}">
        <li class="clearfix">
            <div class="message-data align-right">
                <span class="message-data-time">${message.time}</span> &nbsp; &nbsp;
                <span class="message-data-name">Вы</span> <i class="fa fa-circle me"></i>
            </div>
            <div class="message other-message float-right">
                    ${message.message}
            </div>
        </li>
        </c:if>

    </c:forEach>
</c:if>

</ul>
</div>
<%--    <form id="messageForm" name="messageForm">--%>
<div class="chat-message clearfix">
<textarea name="message-to-send" id="message-to-send" placeholder="Type your message" rows="3"></textarea>
<i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp;
<i class="fa fa-file-image-o"></i>
<button>Send</button>
</div>
<%--    </form>--%>
</div>


<script id="message-template" type="text/x-handlebars-template">
  <li class="clearfix">
    <div class="message-data align-right">
      <span class="message-data-time" >{{time}}, Сегодня</span> &nbsp; &nbsp;
      <span class="message-data-name" >Вы</span> <i class="fa fa-circle me"></i>
    </div>
    <div class="message other-message float-right">
      {{messageOutput}}
    </div>
  </li>
</script>
<script id="message-response-template" type="text/x-handlebars-template">
  <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> HR</span>
      <span class="message-data-time">{{time}}, Сегодня</span>
    </div>
    <div class="message my-message">
      {{response}}
    </div>
  </li>
</script>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js'></script>
                <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script id="rendered-js">

(function () {
    var stompClient;
  var chat = {
    messageToSend: '',
    messageResponses: '',

    init: function () {
        this.connect();
      this.cacheDOM();
      this.bindEvents();
      this.render();
    },
    cacheDOM: function () {
      this.$chatHistory = $('.chat-history');
      this.$button = $('button');
      this.$textarea = $('#message-to-send');
      this.$chatHistoryList = this.$chatHistory.find('ul');
      this.$connectingElement = $('#connecting');
    },
    bindEvents: function () {
      this.$button.on('click', this.addMessage.bind(this));
      this.$textarea.on('keyup', this.addMessageEnter.bind(this));
    },
    render: function () {
      this.scrollToBottom();
      if (this.messageToSend.trim() !== '') {
        var template = Handlebars.compile($("#message-template").html());
        var context = {
          messageOutput: this.messageToSend,
          time: this.getCurrentTime() };


        this.$chatHistoryList.append(template(context));
        this.scrollToBottom();
        this.$textarea.val('');

        this.sendMessage();
      }

    },

      onConnected: function () {
          // Subscribe to the messages
           stompClient.subscribe('/messages/public.{id}', onMessageReceived);
          // Tell your username to the server
          stompClient.send("/app/message-${code}.addUser",
              {},
              JSON.stringify({from: username})
          )
      },
      onError: function (error) {
          this.$connectingElement = 'Could not connect to WebSocket server. Please refresh this page to try again!';
      },

      connect: function (event) {
        username = '${username}';
        if(username) {
            var socket = new SockJS('/message');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, this.onConnected, this.onError);
        }
        // event.preventDefault();
    },

      sendMessage:function () {
        // var messageToSend = this.$textarea.val();
        // var messageContent = messageInput.value.trim();
        if(this.messageToSend && stompClient) {
            var chatMessage = {
                to: '${to}',
                from: username,
                message: this.messageToSend,
                time: this.getCurrentTime()
            };
            stompClient.send("/app/message-${code}.sendMessage", {}, JSON.stringify(chatMessage));
            // messageToSend.value = '';
        }
        // event.preventDefault();
    },
    addMessage: function () {
      this.messageToSend = this.$textarea.val();
      this.render();
    },
    addMessageEnter: function (event) {
      // enter was pressed
      if (event.keyCode === 13) {
        this.addMessage();
      }
    },
    scrollToBottom: function () {
      this.$chatHistory.scrollTop(this.$chatHistory[0].scrollHeight);
    },
    getCurrentTime: function () {
      return new Date().toLocaleTimeString().
      replace(/([\d]+:[\d]{2})(:[\d]{2})(.*)/, "$1$3");
    }
    // getRandomItem: function (arr) {
    //   return arr[Math.floor(Math.random() * arr.length)];
    // } };
  };



  chat.init();

    function onMessageReceived(payload) {
        // var message = JSON.parse(payload.body);
        var message = JSON.parse(payload.body);
        // responses
        if(message.from!=='${username}'&& message.message!== null) {
            var templateResponse = Handlebars.compile($("#message-response-template").html());
            var contextResponse = {
                response: message.message,
                time: chat.getCurrentTime()
            };
            chat.$chatHistoryList.append(templateResponse(contextResponse));
        }
        return message;
    }
    <%--connect();--%>
  // searchFilter.init();

})();


//# sourceURL=pen.js
    </script>

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


    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>
<%--     <script type="text/javascript" src="${contextPath}/resources/js/message.js"></script>      <!-- Templatemo Script -->--%>

  </body>
</html>
