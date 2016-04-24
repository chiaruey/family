<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="home" tagdir="/WEB-INF/tags/home"%>

	<div class="contentWrapper">
		
		<div class="centerPanelWrapper ui-corner-all">
			<form id="WallMessageForm">
				<div id="wallMessageHeader" class="header">
					<span class="title">Wall Messages: </span>						
					<input class="jqButton ui-state-default ui-corner-all ui-widget ui-button addNewBtn" type="submit" id="addMyMessageBtn" value="+ Add my message" />		
				</div>
				<div class="content">
					<table class="wallMessageList">
						<c:forEach items="${wallMessages}" var="wm">
							<tr>
								<td> <img src="${wm.imagePath}"></td>
								<td> <span class="date"><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${wm.createDate}" /> </span></td>
								<td> <h5>${wm.message}</h5></td>		
								<td> <a href="#" class="delWallMsg" title="Clear item"><img src="static/img/btnRmvWallMsg.png" alt="x" width="12" height="12" onclick="deleteWallMessage(${wm.id})" /></a></td>
							</tr>
						</c:forEach>
					</table>	
				</div>
			</form>
		</div>	
		<div id="userInfoWrapper" class="leftPanelWrapper ui-corner-all">
			<div class="minHeight20 title"> User Information </div>
			<table class="jqTable" id="familyInfoTable">
				<tbody>
					<tr><th scope="row">Username:</th><td>${user.username }</td></tr>	
					<tr><th scope="row">Role:</th><td>${user.roleName }</td></tr>				
					<tr><th scope="row">Street:</th><td>${family.address.street }</td></tr>
					<tr><th scope="row">City:</th><td>${family.address.city }</td></tr>
					<tr><th scope="row">State:</th><td>${family.address.state }</td></tr>
					<tr><th scope="row">Country:</th><td>${family.address.country }</td></tr>		
				</tbody>
			</table>
		</div>
		<div class="minHeight20"></div>
		<div id="myFamilyWrapper" class="leftPanelWrapper">
			
			<span class="title">Family Members</span>
			<div id="myFamily">
				<c:forEach items="${family.familyMember}" var="familyMember" >
					<c:if test="${user.id != familyMember.id && familyMember.active == true}">
						<h3 class="familyMemberHeading jqHeading"><span class="jqIcon"></span><a href="#"><c:out value="${familyMember.firstName} ${familyMember.lastName}" /></a></h3>
						<table class="familyMemberTable jqTable">
							<tr><th scope="row">Username:</th><td>${familyMember.username} </td></tr>													
							<tr><th scope="row">Role:</th><td>${familyMember.roleName} </td></tr>
							<tr><th scope="row">First Name:</th><td>${familyMember.firstName}</td></tr>
							<tr><th scope="row">Last Name:</th><td>${familyMember.lastName}</td></tr>
							<tr><th scope="row">Email:</th><td>${familyMember.email}</td></tr>					
						</table>						
					
					</c:if>
				</c:forEach>
			</div>			
		</div>

	</div> 
	
	<home:addMyMessagePopup />
	
	<script type="text/javaScript" src="static/js/family/family.home.js" ></script>