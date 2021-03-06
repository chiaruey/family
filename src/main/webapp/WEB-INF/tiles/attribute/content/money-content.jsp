<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="money" tagdir="/WEB-INF/tags/money"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="current" class="java.util.Date" />

<div class="contentWrapper">
<form id="moneyForm">
	<div class="calendarHeader">
		<div id="moneyScrollHeader" class="calendarScrollHeader ui-corner-all ui-state-default">
			<div class="leftFiller4pct"></div>
			<div id="prev_month_arrow" class="icon-div ui-state-default ui-corner-all floatLeft">
				<span class="ui-icon ui-icon-circle-triangle-w"></span>
			</div>
			<div class="calendar_date_string_div">
				<span>${monthlyMoney.monthName} &nbsp; ${monthlyMoney.year}</span>
			</div>
			<div id="next_month_arrow"
				class="icon-div ui-state-default ui-corner-all floatRight">
				<span class="ui-icon ui-icon-circle-triangle-e"></span>
			</div>
			<input type="hidden" name="nextMonth"
				value="${monthlyMoney.nextMonth}"> <input type="hidden"
				name="nextYear" value="${monthlyMoney.nextYear}">
			<input type="hidden" name="prevMonth"
				value="${monthlyMoney.prevMonth}"> <input type="hidden"
				name="prevYear" value="${monthlyMoney.prevYear}">
		</div>


	</div>

	<div id="moneyDetailWrapper" class="centerPanelWrapper">
		<div class="header">
			
			<span class="title">Monthly Monetary Transitions</span> <input
				class="jqButton ui-state-default ui-corner-all ui-widget ui-button addNewBtn"
				type="submit" id="addTracBtn" value="+ Add new" />
			
		</div>

		<div id="transitionWrapper" class="content">

			<table class="jqTable centerTable">
				<thead>
					<tr>
						<th>Transition date</th>
						<th>type</th>
						<th>name</th>
						<th>Comments</th>
						<th>Amount</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty monthlyMoney.transitions}">
							<td colspan="5">There are no monthly monetary transitions
								for this month</td>
						</c:when>
						<c:otherwise>
							<c:forEach items="${monthlyMoney.transitions}" var="tr" varStatus="status">
								<tr class="transition">
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${tr.tracDate}" /></td>
									<td>
										<c:choose>
											<c:when test="${tr.tracType.ioe == 'I'}">Income</c:when>
											<c:otherwise>Expense</c:otherwise>
										</c:choose>								
									</td>
									<td>${tr.tracType.name}</td>
									<td>${tr.comments}</td>
									<td
										<c:choose>
												<c:when test="${tr.tracType.ioe == 'E' }">
													class="red right"
												</c:when>											
												<c:otherwise>
														class="green right"
												</c:otherwise>
											</c:choose>><fmt:formatNumber
											type="currency" value="${tr.amount}" /> <input type="hidden"
										name="transAmount${tr.tracType.ioe}${status.count}"
										value="${tr.amount}"></td>
									<td><select class="pct90" onchange="doCommand(this, ${tr.id})">
											<option value="select">Select</option>
											<option value="edit">Edit</option>
											<option value="delete">Delete</option>
									</select></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="3" class="right bold">Total Income</td>
								<td colspan="2" class="right"><span
									class="right green bold" id="totalIncome"></span></td>
							</tr>
							<tr>
								<td colspan="3" class="right bold">Total Expense</td>
								<td colspan="2" class="right"><span class="right red bold"
									id="totalExpense"></span></td>
							</tr>
							<tr>
								<td colspan="3" class="right bold">TOTAL</td>
								<td colspan="2" class="right"><span class="right red bold"
									id="netTotal"></span></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>

	<div id="moneyChartWrapper" class="leftPanelWrapper">
		<p class="title">Monthly Transition Type Pct (%)</p> 
		
		<!--  form>
			<input
				type="submit" value="+ Add new" id="addTracTypeBtn"
				class="addNewBtn jqButton " />
		</form -->

	
		<table class="jqTable centerTable">
			<thead>
				<tr>
					<th>I/E</th>
					<th>name</th>
					<th>Total Amount</th>
					<th>Pct %</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(monthlyMoney.expenseTrancSummary) gt 0}">
						<c:forEach items="${monthlyMoney.expenseTrancSummary}" var="ets"
							varStatus="status">
							<tr>
								<td class="red right">Expense</td>
								<td>${ets.transactionType.name}</td>
								<td class="red right"><fmt:formatNumber type="currency"
										value="${ets.totalAmount}" /></td>
								<td class="red right">${ets.pct}%</td>
							</tr>
		
						</c:forEach>			
					</c:when>
					<c:otherwise>
						<tr>
							<td></td>
							<td></td>
							<td class="red right">No Expense Entry Found</td>
							<td></td>
						</tr>					
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${fn:length(monthlyMoney.incomeTrancSummary) gt 0 }">						
						<c:forEach items="${monthlyMoney.incomeTrancSummary}" var="its"
							varStatus="status">
							<tr>
								<td class="green right">Income</td>
								<td>${its.transactionType.name}</td>
								<td class="green right"><fmt:formatNumber type="currency"
										value="${its.totalAmount}" /></td>
								<td class="green right">${its.pct}%</td>
							</tr>
		
						</c:forEach>
					</c:when>	
					<c:otherwise>
						<tr>
							<td></td>
							<td></td>
							<td class="green right">No Income Entry Found</td>
							<td></td>
						</tr>	
					</c:otherwise>
				</c:choose>

				

			</tbody>
		</table>

	</div>
</form>
</div>

<money:moneyTracPopup divId="newTracPopup" formId="newTracForm"
	divTitle="Add new monetary transaction"
	transitionTypes="${monthlyMoney.transitionTypes}" />
<money:moneyTracPopup divId="updTracPopup" formId="updTracForm"
	divTitle="Update the monetary transaction"
	transitionTypes="${monthlyMoney.transitionTypes}" />



<script type="text/javaScript"
	src="static/js/family/family.money.js/"></script>