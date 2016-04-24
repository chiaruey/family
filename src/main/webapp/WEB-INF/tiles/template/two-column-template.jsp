<%@ include file="/WEB-INF/jspf/common/import_tag_lib.jspf" %><!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if IE 10 ]>    <html class="ie10"> <![endif]-->
<!--[if IE 11 ]>    <html class="ie11"> <![endif]-->
<!--[if (gt IE 11)|!(IE)]><!--> <html> <!--<![endif]-->
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Family 24x7 </title>
	<%@ include file="/WEB-INF/jspf/common/link_css.jspf" %>
	<%@ include file="/WEB-INF/jspf/common/js_html5_lib.jspf"%>
</head>
<body class="<tiles:getAsString name='view' />" ng-app="<tiles:getAsString name='view' />">
	<tiles:importAttribute name="view" scope="request" />
	<div class="bodyWrapper">
		<tiles:insertAttribute name="header"/>
		<div class="mainWrapper">
			<tiles:insertAttribute name="leftbar"/>
			<tiles:insertAttribute name="content"/>			
		</div>
		<tiles:insertAttribute name="footer"/>
	</div>
	
	
</body>

</html>
