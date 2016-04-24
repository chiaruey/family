<%@ include file="/WEB-INF/jspf/common/import_tag_lib.jspf" %><!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html class=""> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>New Member Registration</title>
	<%@ include file="/WEB-INF/jspf/common/link_css.jspf" %>
	<%@ include file="/WEB-INF/jspf/common/js_lib.jspf" %>				
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div id="top-nav" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
		<tiles:insertAttribute name="content"/>	
	</div>
	<tiles:insertAttribute name="footer"/>
	<script type="text/javascript" src="${requestScope.appPath}static/js/family/family.registration.js"></script>
		
</body>

</html>
