<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="loginContainer" ng-init="checked=false"  >

	<div ng-controller="LoginCtrl" class="loginDiv">

		<div class="form-messages errors "
			ng-show="vm.errorMessages.length > 0" ng-cloak>
			<img class="error-icon" src="${requestScope.appPath}static/img/error-icon.png">

			<div class="messages-group">
				<div ng-repeat="error in vm.errorMessages">{{error.description}}</div>
			</div>
		</div>

		<form ng-submit="onLogin()" name="form" novalidate >

			<table id="loginTable">
				<tr>
					<td colspan="2" align="center">
						<div class="loginRowDiv">
							<font> Sign in with your </font> <strong>Family Account</strong>
						</div>
					</td>
				</tr>
				<tr id="email-row">
					<th nowrap="nowrap">
						<div align="right">
							<span> Username: </span>
						</div>
					</th>
					<td>
						<div class="loginRowDiv">

							<input type="text" ng-focus="focus('username')"
								ng-blur="blur('username')" ng-model="vm.username"
								name="username" placeholder="Username" required ng-minlength="3">

							<div class="error" ng-show="isMessagesVisible('username')"
								ng-messages="form.username.$error" ng-cloak>
								<div ng-message="required">The username is mandatory</div>
								<div ng-message="minlength">Minimum 3 characters</div>
							</div>

						</div>
					</td>
				</tr>
				<tr id="password-row" class="enabled">
					<th align="right" nowrap="nowrap"><span> Password:</span></th>
					<td>
						<div class="loginRowDiv">
							<input type="password" ng-focus="focus('password')"
								ng-blur="blur('password')" ng-model="vm.password"
								name="password" placeholder="Password" required ng-minlength="6">
							<div class="error" ng-show="isMessagesVisible('password')"
								ng-messages="form.password.$error" ng-cloak>
								<div ng-message="required">The password is mandatory</div>
								<div ng-message="minlength">Minimum 6 characters</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="loginRowDiv">
							<a href="${requestScope.appPath}accessHelp/step1" id="forgotLnk">I
								can't access my account</a>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="loginRowDiv">
							<input id="signInBtn" class="jqButton" type="submit"
								name="signIn" value="Sign in" />
						</div>

					</td>
				</tr>

			</table>
		</form>

	</div>

	<div class="pct75 padding10px" ng-controller="demoUsersController">
		<div class="inlineblock">
			<label> <input type="checkbox" ng-model="checked"
				style="float: left; margin-right: 10px;"> Demo Users
			</label>

 			<div class="demoUserSelectDiv inlineblock"> 
				<select class="check-element show-hide" ng-show="checked"
					ng-model="selection" ng-options="item for item in items">
				</select>
			</div> 
		</div>
		<div class="check-element show-hide" ng-show="checked"
			style="clear: both;">
			<br />
			<div class="demoUsers-switch-container" ng-switch on="selection"> 
				<div class="demoUsers-switch " ng-switch-when="single">
					<single></single>
				</div>
				<div class="demoUsers-switch " ng-switch-when="couple">		
						<couple></couple>
					</div>
				<div class="demoUsers-switch" ng-switch-default>
						<familyof4></familyof4>						
				</div>
			</div>
		</div>
	</div>

	<!-- Angularjs end -->

	<form id="globalForm">
		<input type="hidden" name="appPath" value="${requestScope.appPath}">
	</form>

    <script type="text/javascript" src="${requestScope.appPath}static/js/family/family.common.js"></script>
    <script type="text/javascript" src="${requestScope.appPath}static/js/my/my.login.js"></script>
</div>

