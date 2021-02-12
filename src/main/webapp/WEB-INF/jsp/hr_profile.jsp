<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li><a href="/hr"><i class="fa fa-home fa-fw"></i>Главная</a></li>
            <li><a href="/hr/diagram"><i class="fa fa-bar-chart fa-fw"></i>Диаграммы</a></li>
            <li><a href="/hr/statistics"><i class="fa fa-area-chart"></i>Статистика</a></li>
            <li><a href="#" class="active"><i class="fa  fa-list-alt"></i>Досье</a></li>
            <li><a href="/hr/event" ><i class="fa  fa-calendar fa-fw"></i>Календарь</a></li>
            <li><a href="/hr/interviewer" ><i class="fa fa-pencil-square-o "></i>Собеседования</a></li>
            <li><a href="/hr/message" ><i class="fa fa-comments fa-fw"></i>Сообщения</a></li>
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
                <li><a href="#" class="active">HR</a></li>
                
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
          <div class="templatemo-flex-row flex-content-row">
            <div class="col-1">              
              <div class="panel panel-default margin-10">
                <div class="panel-heading"><h2>Досье сотрудников</h2></div>
                <div class="panel-body">
                  <div class="slider">
                      <div class="slider__wrapper">
                      <c:forEach items="${employeeForm}" var = "employee" >
                          <form method="post" action="/hr/profile/employee">
                          <div class="slider__item">
                              <div class="banner_content">
                                <div class="media" style=" width:1400px;">
                                    <c:if test="${not empty employee.photo}">
                                        <div class="d-flex">
                                            <img src="/photoUser/${employee.photo}" width="668" height="690" alt="profile">
                                        </div>
                                    </c:if>
                                  <div class="media-body">
                                    <div class="personal_text" style="
                        padding-top: 100px;">
                                      <h3>${employee.name} ${employee.surname}</h3>
                                      <h4>Сотрудник</h4>
                                        <ul class="list basic_info">
                                            <li><a href="#"><i class="fa fa-calendar-o"></i>  <fmt:formatDate value="${employee.birthday}" pattern="dd/MM/yyyy"/></a></li>
                                            <li><a href="#"><i class="fa fa-phone"></i> ${employee.mobphone}</a></li>
                                            <li><a href="#"><i class="fa  fa-envelope"></i><input type="text" name="email"  maxlength="255" style="outline: none; border: none; width:400px; background: #ffffff;" value="${employee.email}" readonly></a></li>
                                            <li><a href="#"><i class="fa  fa-transgender"></i> ${employee.gender}</a></li>
                                            <li><a href="#"><i class="fa   fa-suitcase"></i>${employee.post.department}</a></li>
                                            <li><a href="#"><i class="fa   fa-list-alt"></i>${employee.post.post}</a></li>
                                        </ul>
                                      <ul class="list personal_social">
                                        <li><a href="${employee.facebookLink}"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="${employee.twitterLink}"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="${employee.linkedLink}"><i class="fa fa-linkedin"></i></a></li>
                                      </ul>

                                        <c:if test="${employee.isWorking==1}">
                                            <div>
                                                <button id="submit-end" class="login100-form-btn" style="
                        margin-top: 30px;
                    ">Уволить</button></td>
                                            </div>
                                        </c:if>
                                        <c:if test="${employee.isWorking==0}">
                                        <div>
                                            <button id="submit-get" class="login100-form-btn" style="
                        margin-top: 30px;
                    ">Принять</button></td>
                                        </div>
                                        </c:if>
                                    </div>
                                  </div>
                                </div>
                            </div>
                          </div>
              </form>
                      </c:forEach>
                      </div>
                      <a class="slider__control slider__control_left" href="#" role="button"></a>
                      <a class="slider__control slider__control_right" href="#" role="button"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
            <div class="templatemo-flex-row flex-content-row">
                <div class="col-1">
                    <div class="panel panel-default margin-10">
                        <div class="panel-heading"><h2>Досье соискателей</h2></div>
                        <div class="panel-body">
                            <div class="slider2">
                                <div class="slider__wrapper2">
                                    <c:forEach items="${candidateForm}" var = "candidate" >
                                      <form method="post" action="/hr/profile/candidate">
                                          <div class="slider__item2">
                                              <div class="banner_content">
                                                <div class="media" style=" width:1400px;">
                                                    <c:if test="${not empty candidate.photo}">
                                                        <div class="d-flex">
                                                            <img src="/photoUser/${candidate.photo}" width="668" height="690" alt="profile">
                                                        </div>
                                                    </c:if>
                                                  <div class="media-body">
                                                    <div class="personal_text" style="
                                        padding-top: 100px;">
                                                        <h3>${candidate.name} ${candidate.surname}</h3>
                                                      <h4>Соискатель</h4>
                                                        <ul class="list basic_info">
                                                            <li><a href="#"><i class="fa fa-calendar-o"></i>  <fmt:formatDate value="${candidate.birthday}" pattern="dd/MM/yyyy"/></a></li>
                                                            <li><a href="#"><i class="fa fa-phone"></i> ${candidate.mobphone}</a></li>
                                                            <li><a href="#"><i class="fa  fa-envelope"></i> <input type="text" name="email" maxlength="240" style="outline: none; width: 400px; border: none; background: #ffffff;" value="${candidate.email}" readonly> </a></li>
                                                            <li><a href="#"><i class="fa  fa-transgender"></i> ${candidate.gender}</a></li>
                                                        </ul>

                                                      <ul class="list personal_social">
                                                        <li><a href="${candidate.facebookLink}"><i class="fa fa-facebook"></i></a></li>
                                                        <li><a href="${candidate.twitterLink}"><i class="fa fa-twitter"></i></a></li>
                                                        <li><a href="${candidate.linkedLink}"><i class="fa fa-linkedin"></i></a></li>
                                                      </ul>
                                                        <div>
                                                            <button id="submit-candidate" class="login100-form-btn" style="
                                    margin-top: 30px;
                                ">Принять на работу</button></td>

                                                        </div>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                          </div>
                                      </form>
                                            </c:forEach>
                                </div>
                      <a class="slider__control slider__control_left" href="#" role="button"></a>
                      <a class="slider__control slider__control_right" href="#" role="button"></a>
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
    
    <!-- JS -->
    <script type="text/javascript" src="${contextPath}/resources/js3/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="${contextPath}/resources/js3/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script type="text/javascript" src="${contextPath}/resources/js3/templatemo-script.js"></script>      <!-- Templatemo Script -->
    
   <script>
    'use strict';
    var multiItemSlider = (function () {

      function _isElementVisible(element) {
        var rect = element.getBoundingClientRect(),
          vWidth = window.innerWidth || doc.documentElement.clientWidth,
          vHeight = window.innerHeight || doc.documentElement.clientHeight,
          elemFromPoint = function (x, y) { return document.elementFromPoint(x, y) };
        if (rect.right < 0 || rect.bottom < 0
          || rect.left > vWidth || rect.top > vHeight)
          return false;
        return (
          element.contains(elemFromPoint(rect.left, rect.top))
          || element.contains(elemFromPoint(rect.right, rect.top))
          || element.contains(elemFromPoint(rect.right, rect.bottom))
          || element.contains(elemFromPoint(rect.left, rect.bottom))
        );
      }

      return function (selector, config) {
        var
          _mainElement = document.querySelector(selector), // основный элемент блока
          _sliderWrapper = _mainElement.querySelector('.slider__wrapper'), // обертка для .slider-item
          _sliderItems = _mainElement.querySelectorAll('.slider__item'), // элементы (.slider-item)
          _sliderControls = _mainElement.querySelectorAll('.slider__control'), // элементы управления
          _sliderControlLeft = _mainElement.querySelector('.slider__control_left'), // кнопка "LEFT"
          _sliderControlRight = _mainElement.querySelector('.slider__control_right'), // кнопка "RIGHT"
          _wrapperWidth = parseFloat(getComputedStyle(_sliderWrapper).width), // ширина обёртки
          _itemWidth = parseFloat(getComputedStyle(_sliderItems[0]).width), // ширина одного элемента    
          _positionLeftItem = 0, // позиция левого активного элемента
          _transform = 0, // значение транфсофрмации .slider_wrapper
          _step = _itemWidth / _wrapperWidth * 100, // величина шага (для трансформации)
          _items = [], // массив элементов
          _interval = 0,
          _html = _mainElement.innerHTML,
          _states = [
            { active: false, minWidth: 0, count: 1 },
            { active: false, minWidth: 980, count: 2 }
          ],
          _config = {
            isCycling: false, // автоматическая смена слайдов
            direction: 'right', // направление смены слайдов
            interval: 5000, // интервал между автоматической сменой слайдов
            pause: true // устанавливать ли паузу при поднесении курсора к слайдеру
          };

        for (var key in config) {
          if (key in _config) {
            _config[key] = config[key];
          }
        }

        // наполнение массива _items
        _sliderItems.forEach(function (item, index) {
          _items.push({ item: item, position: index, transform: 0 });
        });

        var _setActive = function () {
          var _index = 0;
          var width = parseFloat(document.body.clientWidth);
          _states.forEach(function (item, index, arr) {
            _states[index].active = false;
            if (width >= _states[index].minWidth)
              _index = index;
          });
          _states[_index].active = true;
        }

        var _getActive = function () {
          var _index;
          _states.forEach(function (item, index, arr) {
            if (_states[index].active) {
              _index = index;
            }
          });
          return _index;
        }

        var position = {
          getItemMin: function () {
            var indexItem = 0;
            _items.forEach(function (item, index) {
              if (item.position < _items[indexItem].position) {
                indexItem = index;
              }
            });
            return indexItem;
          },
          getItemMax: function () {
            var indexItem = 0;
            _items.forEach(function (item, index) {
              if (item.position > _items[indexItem].position) {
                indexItem = index;
              }
            });
            return indexItem;
          },
          getMin: function () {
            return _items[position.getItemMin()].position;
          },
          getMax: function () {
            return _items[position.getItemMax()].position;
          }
        }

        var _transformItem = function (direction) {
          var nextItem;
          if (!_isElementVisible(_mainElement)) {
            return;
          }
          if (direction === 'right') {
            _positionLeftItem++;
            if ((_positionLeftItem + _wrapperWidth / _itemWidth - 1) > position.getMax()) {
              nextItem = position.getItemMin();
              _items[nextItem].position = position.getMax() + 1;
              _items[nextItem].transform += _items.length * 100;
              _items[nextItem].item.style.transform = 'translateX(' + _items[nextItem].transform + '%)';
            }
            _transform -= _step;
          }
          if (direction === 'left') {
            _positionLeftItem--;
            if (_positionLeftItem < position.getMin()) {
              nextItem = position.getItemMax();
              _items[nextItem].position = position.getMin() - 1;
              _items[nextItem].transform -= _items.length * 100;
              _items[nextItem].item.style.transform = 'translateX(' + _items[nextItem].transform + '%)';
            }
            _transform += _step;
          }
          _sliderWrapper.style.transform = 'translateX(' + _transform + '%)';
        }

        var _cycle = function (direction) {
          if (!_config.isCycling) {
            return;
          }
          _interval = setInterval(function () {
            _transformItem(direction);
          }, _config.interval);
        }

        // обработчик события click для кнопок "назад" и "вперед"
        var _controlClick = function (e) {
          if (e.target.classList.contains('slider__control')) {
            e.preventDefault();
            var direction = e.target.classList.contains('slider__control_right') ? 'right' : 'left';
            _transformItem(direction);
            clearInterval(_interval);
            _cycle(_config.direction);
          }
        };

        // обработка события изменения видимости страницы
        var _handleVisibilityChange = function () {
          if (document.visibilityState === "hidden") {
            clearInterval(_interval);
          } else {
            clearInterval(_interval);
            _cycle(_config.direction);
          }
        }

        var _refresh = function () {
          clearInterval(_interval);
          _mainElement.innerHTML = _html;
          _sliderWrapper = _mainElement.querySelector('.slider__wrapper');
          _sliderItems = _mainElement.querySelectorAll('.slider__item');
          _sliderControls = _mainElement.querySelectorAll('.slider__control');
          _sliderControlLeft = _mainElement.querySelector('.slider__control_left');
          _sliderControlRight = _mainElement.querySelector('.slider__control_right');
          _wrapperWidth = parseFloat(getComputedStyle(_sliderWrapper).width);
          _itemWidth = parseFloat(getComputedStyle(_sliderItems[0]).width);
          _positionLeftItem = 0;
          _transform = 0;
          _step = _itemWidth / _wrapperWidth * 100;
          _items = [];
          _sliderItems.forEach(function (item, index) {
            _items.push({ item: item, position: index, transform: 0 });
          });
        }

        var _setUpListeners = function () {
          _mainElement.addEventListener('click', _controlClick);
          if (_config.pause && _config.isCycling) {
            _mainElement.addEventListener('mouseenter', function () {
              clearInterval(_interval);
            });
            _mainElement.addEventListener('mouseleave', function () {
              clearInterval(_interval);
              _cycle(_config.direction);
            });
          }
          document.addEventListener('visibilitychange', _handleVisibilityChange, false);
          window.addEventListener('resize', function () {
            var
              _index = 0,
              width = parseFloat(document.body.clientWidth);
            _states.forEach(function (item, index, arr) {
              if (width >= _states[index].minWidth)
                _index = index;
            });
            if (_index !== _getActive()) {
              _setActive();
              _refresh();
            }
          });
        }

        // инициализация
        _setUpListeners();
        if (document.visibilityState === "visible") {
          _cycle(_config.direction);
        }
        _setActive();

        return {
          right: function () { // метод right
            _transformItem('right');
          },
          left: function () { // метод left
            _transformItem('left');
          },
          stop: function () { // метод stop
            _config.isCycling = false;
            clearInterval(_interval);
          },
          cycle: function () { // метод cycle 
            _config.isCycling = true;
            clearInterval(_interval);
            _cycle();
          }
        }

      }
    }());

    var slider = multiItemSlider('.slider', {
      isCycling: true
    })

  </script>

    <script>
        'use strict';
        var multiItemSlider = (function () {

            function _isElementVisible(element) {
                var rect = element.getBoundingClientRect(),
                    vWidth = window.innerWidth || doc.documentElement.clientWidth,
                    vHeight = window.innerHeight || doc.documentElement.clientHeight,
                    elemFromPoint = function (x, y) { return document.elementFromPoint(x, y) };
                if (rect.right < 0 || rect.bottom < 0
                    || rect.left > vWidth || rect.top > vHeight)
                    return false;
                return (
                    element.contains(elemFromPoint(rect.left, rect.top))
                    || element.contains(elemFromPoint(rect.right, rect.top))
                    || element.contains(elemFromPoint(rect.right, rect.bottom))
                    || element.contains(elemFromPoint(rect.left, rect.bottom))
                );
            }

            return function (selector, config) {
                var
                    _mainElement = document.querySelector(selector), // основный элемент блока
                    _sliderWrapper = _mainElement.querySelector('.slider__wrapper2'), // обертка для .slider-item
                    _sliderItems = _mainElement.querySelectorAll('.slider__item2'), // элементы (.slider-item)
                    _sliderControls = _mainElement.querySelectorAll('.slider__control'), // элементы управления
                    _sliderControlLeft = _mainElement.querySelector('.slider__control_left'), // кнопка "LEFT"
                    _sliderControlRight = _mainElement.querySelector('.slider__control_right'), // кнопка "RIGHT"
                    _wrapperWidth = parseFloat(getComputedStyle(_sliderWrapper).width), // ширина обёртки
                    _itemWidth = parseFloat(getComputedStyle(_sliderItems[0]).width), // ширина одного элемента
                    _positionLeftItem = 0, // позиция левого активного элемента
                    _transform = 0, // значение транфсофрмации .slider_wrapper
                    _step = _itemWidth / _wrapperWidth * 100, // величина шага (для трансформации)
                    _items = [], // массив элементов
                    _interval = 0,
                    _html = _mainElement.innerHTML,
                    _states = [
                        { active: false, minWidth: 0, count: 1 },
                        { active: false, minWidth: 980, count: 2 }
                    ],
                    _config = {
                        isCycling: false, // автоматическая смена слайдов
                        direction: 'right', // направление смены слайдов
                        interval: 5000, // интервал между автоматической сменой слайдов
                        pause: true // устанавливать ли паузу при поднесении курсора к слайдеру
                    };

                for (var key in config) {
                    if (key in _config) {
                        _config[key] = config[key];
                    }
                }

                // наполнение массива _items
                _sliderItems.forEach(function (item, index) {
                    _items.push({ item: item, position: index, transform: 0 });
                });

                var _setActive = function () {
                    var _index = 0;
                    var width = parseFloat(document.body.clientWidth);
                    _states.forEach(function (item, index, arr) {
                        _states[index].active = false;
                        if (width >= _states[index].minWidth)
                            _index = index;
                    });
                    _states[_index].active = true;
                }

                var _getActive = function () {
                    var _index;
                    _states.forEach(function (item, index, arr) {
                        if (_states[index].active) {
                            _index = index;
                        }
                    });
                    return _index;
                }

                var position = {
                    getItemMin: function () {
                        var indexItem = 0;
                        _items.forEach(function (item, index) {
                            if (item.position < _items[indexItem].position) {
                                indexItem = index;
                            }
                        });
                        return indexItem;
                    },
                    getItemMax: function () {
                        var indexItem = 0;
                        _items.forEach(function (item, index) {
                            if (item.position > _items[indexItem].position) {
                                indexItem = index;
                            }
                        });
                        return indexItem;
                    },
                    getMin: function () {
                        return _items[position.getItemMin()].position;
                    },
                    getMax: function () {
                        return _items[position.getItemMax()].position;
                    }
                }

                var _transformItem = function (direction) {
                    var nextItem;
                    if (!_isElementVisible(_mainElement)) {
                        return;
                    }
                    if (direction === 'right') {
                        _positionLeftItem++;
                        if ((_positionLeftItem + _wrapperWidth / _itemWidth - 1) > position.getMax()) {
                            nextItem = position.getItemMin();
                            _items[nextItem].position = position.getMax() + 1;
                            _items[nextItem].transform += _items.length * 100;
                            _items[nextItem].item.style.transform = 'translateX(' + _items[nextItem].transform + '%)';
                        }
                        _transform -= _step;
                    }
                    if (direction === 'left') {
                        _positionLeftItem--;
                        if (_positionLeftItem < position.getMin()) {
                            nextItem = position.getItemMax();
                            _items[nextItem].position = position.getMin() - 1;
                            _items[nextItem].transform -= _items.length * 100;
                            _items[nextItem].item.style.transform = 'translateX(' + _items[nextItem].transform + '%)';
                        }
                        _transform += _step;
                    }
                    _sliderWrapper.style.transform = 'translateX(' + _transform + '%)';
                }

                var _cycle = function (direction) {
                    if (!_config.isCycling) {
                        return;
                    }
                    _interval = setInterval(function () {
                        _transformItem(direction);
                    }, _config.interval);
                }

                // обработчик события click для кнопок "назад" и "вперед"
                var _controlClick = function (e) {
                    if (e.target.classList.contains('slider__control')) {
                        e.preventDefault();
                        var direction = e.target.classList.contains('slider__control_right') ? 'right' : 'left';
                        _transformItem(direction);
                        clearInterval(_interval);
                        _cycle(_config.direction);
                    }
                };

                // обработка события изменения видимости страницы
                var _handleVisibilityChange = function () {
                    if (document.visibilityState === "hidden") {
                        clearInterval(_interval);
                    } else {
                        clearInterval(_interval);
                        _cycle(_config.direction);
                    }
                }

                var _refresh = function () {
                    clearInterval(_interval);
                    _mainElement.innerHTML = _html;
                    _sliderWrapper = _mainElement.querySelector('.slider__wrapper2');
                    _sliderItems = _mainElement.querySelectorAll('.slider__item2');
                    _sliderControls = _mainElement.querySelectorAll('.slider__control');
                    _sliderControlLeft = _mainElement.querySelector('.slider__control_left');
                    _sliderControlRight = _mainElement.querySelector('.slider__control_right');
                    _wrapperWidth = parseFloat(getComputedStyle(_sliderWrapper).width);
                    _itemWidth = parseFloat(getComputedStyle(_sliderItems[0]).width);
                    _positionLeftItem = 0;
                    _transform = 0;
                    _step = _itemWidth / _wrapperWidth * 100;
                    _items = [];
                    _sliderItems.forEach(function (item, index) {
                        _items.push({ item: item, position: index, transform: 0 });
                    });
                }

                var _setUpListeners = function () {
                    _mainElement.addEventListener('click', _controlClick);
                    if (_config.pause && _config.isCycling) {
                        _mainElement.addEventListener('mouseenter', function () {
                            clearInterval(_interval);
                        });
                        _mainElement.addEventListener('mouseleave', function () {
                            clearInterval(_interval);
                            _cycle(_config.direction);
                        });
                    }
                    document.addEventListener('visibilitychange', _handleVisibilityChange, false);
                    window.addEventListener('resize', function () {
                        var
                            _index = 0,
                            width = parseFloat(document.body.clientWidth);
                        _states.forEach(function (item, index, arr) {
                            if (width >= _states[index].minWidth)
                                _index = index;
                        });
                        if (_index !== _getActive()) {
                            _setActive();
                            _refresh();
                        }
                    });
                }

                // инициализация
                _setUpListeners();
                if (document.visibilityState === "visible") {
                    _cycle(_config.direction);
                }
                _setActive();

                return {
                    right: function () { // метод right
                        _transformItem('right');
                    },
                    left: function () { // метод left
                        _transformItem('left');
                    },
                    stop: function () { // метод stop
                        _config.isCycling = false;
                        clearInterval(_interval);
                    },
                    cycle: function () { // метод cycle
                        _config.isCycling = true;
                        clearInterval(_interval);
                        _cycle();
                    }
                }

            }
        }());

        var slider = multiItemSlider('.slider2', {
            isCycling: true
        })

    </script>
  </body>
</html>