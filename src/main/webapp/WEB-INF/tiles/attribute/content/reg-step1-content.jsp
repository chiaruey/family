<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

	<div class="contentWrapper">
		<div class="regRightWrapper ui-corner-all">
			<c:if test="${success != true }">
				<div id="regErrorDiv" class="error"><span id="regErrorSpan">${errorMsg}</span></div>
			</c:if>
			<p id="reg1Title" class="title">Welcome, Head of Household, Please Enter Your Info</p>
			<sf:form cssClass="regForm" id="regStep1Form" action="${requestScope.appPath}registration/addHouseHead" method="post" modelAttribute="newMemberInfo">

				<table class='registrationInput'>
					<tr>
						<th nowrap="nowrap" align="right">Family Name:</th>
						<td><sf:input path="familyName" cssClass="familyName" value="${newMemberInfo.familyName }"/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">username:</th>
						<td><sf:input path="username" cssClass="username" value="${newMemberInfo.username }"/></td>
					</tr>
				
					<tr>
						<th nowrap="nowrap" align="right">Email:</th>
						<td><sf:input path="email" cssClass="email" value="${newMemberInfo.email }"/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">First Name:</th>
						<td><sf:input path="firstName" cssClass="firstName" value="${newMemberInfo.firstName }"/></td>
					</tr>
							
					<tr>
						<th nowrap="nowrap" align="right">Last Name:</th>
						<td><sf:input path="lastName" cssClass="lastName" value="${newMemberInfo.lastName}"/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">Password:</th>
						<td><sf:password path="password" cssClass="password"  value=""/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">Repeat password:</th>
						<td><sf:password path="repeatPassword" id="repeatPassword" cssClass="password" size="20%" value=""/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">Secure Question:</th>
						<td>
							<sf:select path="secureQuestion" id="secureQuestion" cssClass="secureQuestion" >
								<c:forEach items="${secureQuestionList}" var="secureQuestion">
									<sf:option value="${secureQuestion.id}">${secureQuestion.secureQuestionText}</sf:option>
								</c:forEach>
							</sf:select>
						</td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">Secure Answer:</th>
						<td><sf:password path="secureQuestionAnswer" id="secureQuestionAnswer" cssClass="secureQuestionAnswer" size="20%" value=""/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">Date Of Birth:</th>
						<td>
							<sf:select cssClass="monthStyle" path="dobMonth" id="dobMonth">
								<sf:option value="Month">Month:</sf:option>
								<c:forEach items="${monthList}" var="month">
									<sf:option value="${month}">${month + 1}</sf:option>
								</c:forEach>
							</sf:select>						
							<sf:select cssClass="dayStyle" path="dobDay" id="dobDay">
								<sf:option value="Day">Day:</sf:option>
								<c:forEach items="${dayList}" var="day">
									<sf:option value="${day}">${day}</sf:option>
								</c:forEach>								
							</sf:select>
							<sf:select cssClass="yearStyle" path="dobYear" id="dobYear">
								<sf:option value="Year">Year:</sf:option>
								<c:forEach items="${yearList}" var="year">
									<sf:option value="${year}">${year}</sf:option>
								</c:forEach>
							</sf:select>																		
						</td>
					</tr>	
									
					<tr>
						<th nowrap="nowrap" align="right">Gender:</th>
						<td>
							<sf:select path='gender' id='gender' cssClass='gender'>
								<sf:option value="M">male</sf:option>
								<sf:option value="F">female</sf:option>
							</sf:select>
						</td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">Role:</th>
						<td>
							<sf:select path='role' id='role' cssClass="role">
								<c:forEach items="${allRoles}" var="role">
									<c:if test="${role.isAdmin() }">
										<sf:option value="${role.name()}">${role.name()}</sf:option>
									</c:if>	
								</c:forEach>
							</sf:select>
						</td>
					</tr>	
								
					<tr>
						<th nowrap="nowrap" align="right"><div><span>Street:</span></div></th>
						<td><sf:input path="street" value="" cssClass="street" /></td>
					</tr>	
								
					<tr>
						<th nowrap="nowrap" align="right">City:</th>
						<td><sf:input path="city" cssClass="city" value=""/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">State:</th>
						<td><sf:input path="state" cssClass="state"  value=""/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">Country:</th>
						<td><sf:input path="country" cssClass="country"  value=""/></td>
					</tr>
					
					<tr>
						<th nowrap="nowrap" align="right">ZIP:</th>
						<td><sf:input path="zip" cssClass="zip"  value=""/></td>
					</tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr>
						<td>
						</td>
						<td>
							<input id="addNewHouseHeadBtn" class="jqButton ui-state-default ui-corner-all ui-widget ui-button regBtn" type="submit" value="Join Family 24x7" />
						</td>
					</tr>					
					
				</table>	
	
			</sf:form>

		</div>


		<div class="regLeftWrapper">
		
			<div class="introContent ui-corner-all">
				<p class="subTitle">To Register on Family24x7</p>
				<p class="introItem"><span class="floatLeft ui-icon ui-icon-circle-check"></span>&nbsp;All the fields are required</p>
				<p class="introItem"><span class="floatLeft ui-icon ui-icon-circle-check"></span>&nbsp;Click on the button to create your account</p>
		
			</div>
		
		</div>



</div> 
	