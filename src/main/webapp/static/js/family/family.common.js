$(document).ready(function() {
	if (!jQuery.support.leadingWhitespace){
/*		if ($("html").hasClass("ie6"))
			alert('Sorry, we are not supporting Internet Explorer 6, please use another browser');
		else if ($("html").hasClass("ie7"))
			alert('Sorry, we are not supporting Internet Explorer 7, please use another browser');
		else if ($("html").hasClass("ie8"))
			alert('Sorry, we are not supporting Internet Explorer 8, please use another browser');
		else 
			alert('Sorry, we are not supporting the browser you are using, please use another browser');
		
		$('.browserError').removeClass('hidden');
		*/
		document.location.href = getAppPath() + 'error/unsupportedBrowser';
    }
		
	/*
	 * JQuery Validation Rules
	 */
	$.validator.addMethod('positiveNumber',
		    function (value) { 
		        return Number(value) > 0;
		    }, 'Enter a positive number.');
	

	/*
	 * JQuery UI Adaptor
	 */
	
	/* For the Jquery table ui-widget-header*/
	
	$('.jqTable').addClass('ui-widget ui-widget-content ui-corner-all');

	/* For the jquery button */
	
	$('.jqButton').addClass('ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-button-text');
	$('.jqButton').mouseover(function(e){
		$(this).addClass('ui-state-hover');				
	});
	$('.jqButton').mouseleave(function(e){
		$(this).removeClass('ui-state-hover');
	});
	
	/* For the home page */
	
	$('.jqHeading').addClass('ui-widget ui-corner-all ui-state-default');
	
	$('.jqHeading .jqIcon').addClass('ui-icon ui-icon-triangle-1-e');
	
	$('.jqHeading').click(function(event){
		$(this).toggleClass('ui-state-active');
		$(this).children('.jqIcon').toggleClass('ui-icon-triangle-1-e ui-icon-triangle-1-s');
	});	
	
	$('.jqHeading').mouseover(function(){
		$(this).addClass('ui-state-hover');
	});
	
	$('.jqHeading').mouseleave(function(){
		$(this).removeClass('ui-state-hover');
	});

	$('#top-nav li').mouseenter(function(event){
		if (!$(this).hasClass('ui-state-active'))
			$(this).addClass('ui-state-hover');
	});

	$('#top-nav li').mouseleave(function(event){
		$(this).removeClass('ui-state-hover');
	});	
	
	$('a.disabled').click(function(e){
		e.preventDefault();
		return false;		
	});
	

});


// Set max chars for textArea
function maxcharsForTextArea(field, max, event)
{
	if (field.value.length > max) {
		field.value = field.value.substring(0, max);
		if (event.type != 'keydown') {
			infoMsg('This field only allows ' + max + ' characters.');
		} 
		
		return false;
	} 
	return true;
}

/////////////
// Dialog box

function errorMsg(outputMsg, titleMsg, onCloseCallback) {
    if (!titleMsg)
        titleMsg = 'ERROR';

    if (!outputMsg)
        outputMsg = 'Error Occurs.';

    $("<div class='jqMessage'></div>").html(outputMsg).dialog({
        title: titleMsg,
        resizable: false,
        modal: true,
        buttons: {
            "OK": function () {
                $(this).dialog("close");
            }
        },
        close: onCloseCallback
    }).prev(".ui-dialog-titlebar").css("color","red");;
}

function infoMsg(outputMsg, titleMsg, onCloseCallback) {
    if (!titleMsg)
        titleMsg = 'INFO';

    if (!outputMsg)
        outputMsg = 'Welcome and have a nice day.';

    $("<div class='jqMessage'></div>").html(outputMsg).dialog({
        title: titleMsg,
        resizable: false,
        modal: true,
        buttons: {
            "OK": function () {
                $(this).dialog("close");
            }
        },
        close: onCloseCallback
    }).prev(".ui-dialog-titlebar").css("color","blue");;
}


function jqAlert(outputMsg, titleMsg, onCloseCallback) {
    if (!titleMsg)
        titleMsg = 'Alert';

    if (!outputMsg)
        outputMsg = 'No Message to Display.';

    $("<div class='jqMessage'></div>").html(outputMsg).dialog({
        title: titleMsg,
        resizable: false,
        modal: true,
        buttons: {
            "OK": function () {
                $(this).dialog("close");
            }
        },
        close: onCloseCallback
    });
}

function getAppPath() {
	var appPath = $("#globalForm").find('input[name="appPath"]').val();
	return appPath;
}

function validateFamilyNameString(inputtxt) {
	var regTxt = /^[0-9a-z\_\.]{3,30}$/;
	if (inputtxt.match(regTxt)) {
		return true;
	} else {
		return false;
	}
}

function validateUserNameString(inputtxt) {
	var regTxt = /^[0-9a-z\_\.]{3,30}$/;
	if (inputtxt.match(regTxt)) {
		return true;
	} else {
		return false;
	}
}

function verifyAge(year, month, day, adultAge) {
	
	var verifyResult = false;
	
    var now = new Date();
    var dob = new Date(year, month, day);
    var nowYear = now.getFullYear();
    var dobYear = dob.getFullYear();
    var age = nowYear - dobYear;
    
	var verifyResult = false;
	
    var verifyResult =  age >=  adultAge;
	return verifyResult;
}

function getLastDateOfMonth(Year, Month) {
	return (new Date((new Date(Year, Month + 1, 1)) - 1));
}

////////////////////////////////////////////////////////////////////////


