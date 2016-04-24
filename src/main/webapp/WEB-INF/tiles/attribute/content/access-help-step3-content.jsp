<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="contentWrapper">
	<div class="accessHelpRightWrapper ui-corner-all">
		<c:if test="${success != true }">
			<div class="error"><span id="errorText">${errorMsg}</span></div>
		</c:if>
		<div class="accessHelpFormDiv">
			<form id="accessHelpStep3Form" >

				<table class="accessHelpTable">
					<tr>
						<td colspan="2" align="center">
							<div class="accessHelpTitleDiv title">
								Please Enter new password
							</div>
						</td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">username:</th>
						<td><input type="text" id="username" name="username" value="${username}" disabled /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">Password:</th>
						<td><input type="password" id="password" name="password" value=""  /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<th nowrap="nowrap" align="right">Repeat Password:</th>
						<td><input type="password" id="repeatPassword" name="repeatPassword" value="" /></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>					
					<tr>
						<td></td>
						<td>
							<div class='accessHelpButtonDiv'>
								<input id="resetPassword"
									class="jqButton ui-state-default ui-corner-all ui-widget ui-button"
									type="submit" value="Submit" />
							</div>
						</td>
					</tr>


				</table>

			</form>

		</div>




	</div>

	<div class="accessHelpLeftWrapper">

		<div class="introContent ui-corner-all">
			<p class="subTitle">Access Assistance Step3</p>
			<p class="introItem">
				<span class="floatLeft ui-icon ui-icon-circle-check"></span>&nbsp;Please enter your new password
			</p>
			<p class="introItem">
				<span class="floatLeft ui-icon ui-icon-circle-check"></span>&nbsp;Send email to <a href="mailto:family24x7@gmail.com" target="_top">Customer Support</a> for difficulties 
			</p>
		</div>

	</div>



</div>
