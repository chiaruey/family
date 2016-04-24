<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

	<div class="contentWrapper">
		<div class="regRightWrapper">
		
			<c:if test="${success != true }">
				<div id="regErrorDiv" class="error"><span id="regErrorSpan">${errorMsg}</span></div>
			</c:if>		
			<sf:form cssClass="regForm" id="regStep2Form" method="post" action="${requestScope.appPath}registration/addNewFamilyMember" modelAttribute="newFamilyMemberInfo">

				<h2>Please add new family member if any</h2>

				<table class='registrationInput'>
									
					<tr>
						<th nowrap="nowrap" align="right">username:</th>
						<td><sf:input path="username" cssClass="username" value="${newFamilyMemberInfo.username }"/></td>
					</tr>
				
				
					<tr>
						<th nowrap="nowrap" align="right">Email:</th>
						<td><sf:input path="email" cssClass="email" value="${newFamilyMemberInfo.email }"/></td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">First Name:</th>
						<td><sf:input path="firstName" cssClass="firstName" value="${newFamilyMemberInfo.firstName }"/></td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">Last Name:</th>
						<td><sf:input path="lastName" cssClass="lastName" value="${newFamilyMemberInfo.lastName}"/></td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">Password:</th>
						<td><sf:password path="password" cssClass="password"  value=""/></td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">Repeat Password:</th>
						<td><sf:password path="repeatPassword" id="repeatPassword" cssClass="password" size="20%" value=""/></td>
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
									<sf:option value="${day-1}">${day}</sf:option>
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
									<sf:option value="${role.name()}">${role.name()}</sf:option>
								</c:forEach>
							</sf:select>
						</td>
					</tr>				


					<tr>
						<th nowrap="nowrap" align="right">Administrator:</th>
						<td>
							<sf:select path='admin' id='admin' cssClass="admin">
								<sf:option value="true">true</sf:option>
								<sf:option value="false">false</sf:option>
							</sf:select>
						</td>
					</tr>				
					
				</table>	
					
				<div class='regButtonDiv'>
					<input class="jqButton ui-state-default ui-corner-all ui-widget ui-button regBtn" type="submit" id="addFamilyBtn" value="Add new family member" />	
					<input class="jqButton ui-state-default ui-corner-all ui-widget ui-button regBtn" type="submit" id="finishRegBtn" value="I am done" />	
				</div>		
			</sf:form>

		</div>	

		<div class="regLeftWrapper">
		
			<div class="introContent ui-corner-all">
				<p class="subTitle">To add a new family member on Family24x7</p>
				<p class="introItem"><span class="floatLeft ui-icon ui-icon-circle-check"></span>&nbsp;Fill all fields and click on the <strong>ADD NEW FAMILY MEMBER</strong> button</p>
				<p class="subTitle">No new family member to be added</p>
				<p class="introItem"><span class="floatLeft ui-icon ui-icon-circle-check"></span>&nbsp;Leave all fields blank and click on the <strong>I AM DONE</strong> button</p>	
			</div>

		</div>

		<div class="regLeftWrapper">
			<h2>Family Members</h2>
			<table class="jqTable regFamilyInfo">
				<tbody>
					<tr><td colspan="2"><strong>House Head</strong></td></tr>
					<tr><th scope="row">Name:</th><td>${newMemberInfo.firstName }&nbsp;${newMemberInfo.lastName }</td></tr>
					<tr><th scope="row">Email:</th><td>${newMemberInfo.email }</td></tr>
					<tr><th scope="row">role:</th><td>${newMemberInfo.role }</td></tr>
				</tbody>
			</table>
			
			<c:forEach items="${newMemberInfo.familyList}" var="familyMember">
				<br />
				<table class="jqTable regFamilyInfo">
				<tbody>
					<tr><th scope="row">Name:</th><td>${familyMember.firstName }&nbsp;${familyMember.lastName }</td></tr>
					<tr><th scope="row">Email:</th><td>${familyMember.email }</td></tr>
					<tr><th scope="row">role:</th><td>${familyMember.role }</td></tr>
				</tbody>
			</table>
			</c:forEach>			

		</div>


	</div> 