<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Create your Account</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Font-->
	<link rel="stylesheet" type="text/css" href="../../resources/css2/opensans-font.css">
	<link rel="stylesheet" type="text/css" href="../../resources/fonts2/material-design-iconic-font/css/material-design-iconic-font.min.css">
	<!-- Main Style Css -->
    <link rel="stylesheet" href="../../resources/css2/style.css"/>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
	<div class="page-content">
		<div class="form-v1-content">
			<div class="wizard-form">
		        <form class="form-register" method="post">
		        	<div id="form-total">
		        		<!-- SECTION 1 -->
			            <h2>
			            	<p class="step-icon"><span>01</span></p>
			            	<span class="step-text">Доп-ая информация</span>
			            </h2>
			            <section>
			                <div class="inner">
			                	<div class="wizard-header">
									<h3 class="heading">Дополнительная информация о сотруднике</h3>
									<p>Пожалуйста, введите дополнительную информацию в соответствующие поля и, по завершению, перейдите к следующему шагу,нажав кнопку далее или на цифру 2 слева.  </p>
								</div>

								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
<legend>Отдел</legend>
											<select name="department">
  <option label="Отдел" value="1" selected>Отдел</option>
  <option value="Управление розничного бизнеса">Управление розничного бизнеса</option>
  <option value="Управление корпоративного бизнеса">Управление корпоративного бизнеса</option>
  <option value="Управление безопасности и контроля">Управление безопасности и контроля</option>
   <option value="Управление межбанковских коммуникаций">Управление межбанковских коммуникаций</option>
  <option value="Бухгалтерия">Бухгалтерия</option>
  <option value="Управление операций на фондовом рынке">Управление операций на фондовом рынке</option>
   <option value="Юридическое управление">Юридическое управление</option>
  <option value="Управление развития">Управление развития</option>
  <option value="Пиар (PR) и реклама">Пиар (PR) и реклама</option>
   <option value="Управление информационных технологий">Управление информационных технологий</option>
</select>

										
							

								</fieldset>
									</div>
										</div>


									<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Должность</legend>
											<input type="text" class="form-control" id="post" name="post" placeholder="Должность" required>
										</fieldset>
									</div>
								</div>

								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Ставка</legend>
											<input type="number" class="form-control" id="rate" name="rate" placeholder="Ставка" required>
										</fieldset>
									</div>
								</div>

								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Дата выдачи паспорта</legend>
											<input type="text" name="datePasp" id="your_email" class="form-control" pattern="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" placeholder="dd/mm/yyyy" required>
										</fieldset>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Серия паспорта</legend>
											<input type="text" class="form-control" id="seria" name="seria" placeholder="AB" required>
										</fieldset>
									</div>
								</div>
								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Номер паспорта</legend>
											<input type="text" class="form-control" id="numpassport" name="numpassport" placeholder="3421567" required>
										</fieldset>
									</div>
								</div>

								<div class="form-row">
									<div class="form-holder form-holder-2">
										<fieldset>
											<legend>Идентификационный номер</legend>
											<input type="text" class="form-control" id="idP" name="idP" placeholder="14 цифр" required>
										</fieldset>
									</div>
								</div>
							

							</div>
			            </section>
			            </section>

			            <h2>
			            	<p class="step-icon"><span>02</span></p>
			            	<span class="step-text">Соглашение</span>
			            </h2>
			            <section>
			                <div class="inner">
			                	<div class="wizard-header">
									<h3 class="heading">Соглашение</h3>
									<p>Для входа в ваш аккаунт сотрудника, согласитесь с правилами использования вашей личной информации и нажмите кнопку подтверждения, в нижнем правом углу.</p>
								</div>
								<div class="form-row">
			                		<div class="form-holder form-holder-2">
			                			
			                		</div>
			                	</div>
			                	<div>
			                		<fieldset class="row4">
                <legend>Условия использования информации
                </legend>
                <p class="agreement">
                    <input type="checkbox" value="">
                    <label>*  Я принимаю <a href="#"> Условия использования</a></label>
                </p>
										<button type="submit" >Сохранить</button>
            </fieldset>
            			                	</div>
							</div>
			            </section>
			            </div>
				</form>
		        	</div>
			</div>
		</div>
	</div>
</div>
</div>
	<script src="../../resources/js2/jquery-3.3.1.min.js"></script>
	<script src="../../resources/js2/jquery.steps.js"></script>
	<script src="../../resources/js2/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>