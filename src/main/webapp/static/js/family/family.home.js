$(document).ready(function() {
	
	$('.familyMemberTable').hide();
	
	$('.familyMemberHeading').click(function(e){
		$('.familyMemberHeading').not(this).removeClass('ui-state-active'); 
		$('.familyMemberHeading').not(this).children('.jqIcon').removeClass('ui-icon-triangle-1-s').addClass('ui-icon-triangle-1-e');
		$('.familyMemberTable').not($(this).next()).hide();
		$(this).next('.familyMemberTable').toggle('slow');
/*		if ($(this).next('.familyMemberTable').is(':visible') ) {
			$(this).next('.familyMemberTable').hide();
		} else { 
			$(this).next('.familyMemberTable').show();
		}*/
		return false;
	});
	
	
	// ==========================================
	// For adding a wall message
	// ==========================================

	// Open up dialog box for adding new monetary transaction
	$('#addMyMessagePopup').dialog({ 
		autoOpen: false,
		height: 280,
		width: 400,
		modal: true,
	/*	position: 'center', */
		buttons: {
					"Add message": function() {				
					if (addMyMessage()) {
						$(this).dialog("close");
					}
				},
				Cancel: function() {
					$(this).dialog("close");
				}
			}
	}); 	
	
	// Show up add event dialog box
	$('#addMyMessageBtn').click(function(e){
		$('#myMessageForm').find('textarea[name="myMessageText"]').val('');
		$('#addMyMessagePopup').dialog('open');
		return false;		
	});
	
	


});

function addMyMessage() {
	
	if (!validateMyMessage($('#myMessageForm'))) {
		return false;
	}

	var myMessageText = $('#myMessageForm').find('textarea[name="myMessageText"]').val();
	
	
	$.post(getAppPath() + 'addMyMessage.json', {'wallMessageText':myMessageText} , function(data){

		if (data) {
			var href = location.href;
			var url = href.replace(/#/g,'');
			infoMsg('Your message has been successfully created!', 'MY MESSAGE', function(){ window.location = url });
		} else if (data.errorMsg) {
			errorMsg('Fail to create your message due to ' + data.errorMsg);
		} else {
			errorMsg('Fail to create your message. Please try again later');
		}


	}, 'json');

	return true;
}

function validateMyMessage(form) {
	// =======================================
	// money transition Type dialog validation
	// =======================================
	
	var wallMessageRules = {
		rules : {
			wallMessageText : {
				required : true
			}
		},	
		errorPlacement: function(error, element) {
			var errElmt = $('<br/><div>');
			error.appendTo(errElmt);
			errElmt.insertAfter(element);				
		}
	};



	if (!$(form).validate(wallMessageRules).form()) {
		return false;
	}	

	return true;

}

function deleteWallMessage(id) {
	$.post(getAppPath() + 'deleteWallMessage.json', {'id':id}, function(data){
		if (data.success) {
			var href = location.href;
			var url = href.replace(/#/g,'');
					
			infoMsg('This wall Message has been successfully deleted!', 
			        'SUCCESS',
			        function(){ window.location = url })
		} else if (data.errorMsg) {
			errorMsg('fail to delete wall message due to ' + data.errorMsg);
		} else {
			errorMsg('fail to delete wall message. Please try again later');
		}			
	}, 'json');
	
}