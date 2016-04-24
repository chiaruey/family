<%@ include file="/WEB-INF/jspf/common/import_tag_lib.jspf" %><!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html class=""> <!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Family 24x7</title>
<%@ include file="/WEB-INF/jspf/common/link_css.jspf"%>
<%@ include file="/WEB-INF/jspf/common/js_lib.jspf"%>

</head>
<body class="<tiles:getAsString name='view' />">
	<tiles:insertAttribute name="header" />
	<div id="top-nav"
		class="ui-tabs ui-widget ui-widget-content ui-corner-all">
		<ul
			class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li id="home-tab"
				class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a
				class="ui-tabs-anchor" href="${requestScope.appPath}home">Home</a></li>
			<c:if test="${user.admin}">
				<li id="money-tab" class="ui-state-default ui-corner-top"><a
					class="ui-tabs-anchor" href="${requestScope.appPath}money">Money</a></li>
			</c:if>
			<li id="calendar-tab" class="ui-state-default ui-corner-top"><a
				class="ui-tabs-anchor" href="${requestScope.appPath}calendar">Calendar</a></li>
			<li id="admin-tab" class="ui-state-default ui-corner-top"><a
				class="ui-tabs-anchor" href="${requestScope.appPath}admin">Administration</a></li>
		</ul>
		<div
			class="mainWrapper ui-tabs-panel ui-widget-content ui-coorner-bottom">
			<tiles:insertAttribute name="content" />
		</div>

	</div>
	<tiles:insertAttribute name="footer" />
	<script type="text/javascript"
		src="${requestScope.appPath}static/js/family/family.main.js"></script>

</body>

</html>
