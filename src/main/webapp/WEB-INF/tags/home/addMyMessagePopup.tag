<%@ tag %>

<%@ include file="/WEB-INF/jspf/common/import_tag_lib.jspf" %>

<div id ="addMyMessagePopup" class="homePopup"  title="ADD MY MESSAGE">

	<span id="myMessageTitle">Leave a message for your family on the Wall</span>

	<form id="myMessageForm">
		<fieldset class="noBorder">																
		
			<div class="popupField textAreaPopupField">
				<label class="popupLabel" for="myMessageText">Please enter your Message: (max 100 characters)</label>
				<br />

				<textarea id="myMessageText"  name="myMessageText" onkeyup="maxcharsForTextArea(this, 100, event);" onkeydown="maxcharsForTextArea(this, 100, event);" class=" required  text ui-widget-content ui-corner-all"></textarea>			
			</div>						
				
		</fieldset>
	</form>
</div>
