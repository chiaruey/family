/*
 * Validate on the login screen
 */
$(document).ready(function(){
	
	var isEditing = false;
	
	$('input').addClass('idleField');
	
	$('input').focus(function(e){
		isEditing = true;
		$(this).removeClass('idleField').addClass('focusField');
	});
	
	$('input').blur(function(e){
		isEditing = false;
		$(this).removeClass('focusField').addClass('idleField');
	});
	
	$('input').mouseover(function(e){
		if (isEditing == false)
			$(this).removeClass('idleField').addClass('focusField');
	});
	
	$('input').mouseleave(function(e){
		if (isEditing == false)
			$(this).removeClass('focusField').addClass('idleClass');
	});
	
	
	$('#username').change(function(e){
		$('#loginErrorSpan').text('');
		validateUsername();
	});
	
	$('#password').change(function(e){
		$('#loginErrorSpan').text('');
		validatePassword();
	});
	
	$('#signInBtn').click(function(e){
		signIn();
		
		return false;
	});

	
	var validateLoginRules = {
			rules : {
				username : {
					required : true
				},
				password : {
					required : true
				}
			},
			errorPlacement : function(error, element) {
				var errElmt  = $('<br /> <div>');
				error.appendTo(errElmt);
				errElmt.insertAfter(element);
			}
		};
	

	function validatePassword() {
		
		if ($('.invalidPassword').length > 0) {
			$('.invalidPassword').remove();
		}
				
		var password = $('#loginForm').find('input[name="password"]').val();
		
		if (password.length > 15 || password.length < 6) {
			var errElmt = $('<br/><p class="error invalidPassword">Password must be between 6-15 characters</p>');
			errElmt.insertAfter('#password');
			return false;
		}
		return true;
	}


	function validateUsername() {
		
		if ($('.invalidUserName').length > 0) {
			$('.invalidUserName').remove();
		}

		var username = $('#loginForm').find('input[name="username"]').val();
		
		if (validateUserNameString(username) == false) {
			var errElmt = $('<p class="error invalidUserName">username allows only lowercase and underscore(_) and 3-15 characters.</p>');
			errElmt.insertAfter('#username');
			return false;
		} 

		return true;
	}

	function signIn() {
		if ((!$('#loginForm').validate(validateLoginRules).form())||(!validateUsername) || (!validatePassword)) {
			return false;
		}

		$('#loginForm').submit();
		
	}
	
	// Focus on the family
	$('#username').focus();
	
});