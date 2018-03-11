<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Calendar.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
	});
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">进货审核</span>
		</div>
	</div>
	<div class="content-text">
		<s:form action="order_buyCheckList" method="post"> 
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td  height="30">下单时间:</td>
						<td>
							<input type="text" value="${oqm.createTimeView}" size="14" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
							<s:hidden name="oqm.createTime"></s:hidden>
						</td>
						<td>到</td>
						<td>
							&nbsp;&nbsp;<input type="text" value="${oqm.createTime2View}" size="14" onfocus="c.showMoreDay=false;c.show(this);" readonly="true"/>
							<s:hidden name="oqm.createTime2"></s:hidden>
						</td>
						<td>总量:</td>
						<td><s:textfield name="oqm.totalNum" size="14"></s:textfield></td>
						<td>到 </td>
						<td>&nbsp;&nbsp;<s:textfield name="oqm.totalNum2" size="14"></s:textfield></td>
					</tr>
					<tr>
						<td>总额:</td>
						<td><s:textfield name="oqm.totalPrice" size="14"></s:textfield></td>
						<td>到</td>
						<td>&nbsp;&nbsp;<s:textfield name="oqm.totalPrice2" size="14"></s:textfield></td>
						<td>下单人:</td>
						<td><s:textfield name="oqm.creater.name" size="14"></s:textfield></td>
						<td>&nbsp;</td>
						<td>&nbsp;&nbsp;<a id="query"> 
							<img src="${pageContext.request.contextPath}/images/can_b_01.gif" border="0" /> </a>
						</td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(${pageContext.request.contextPath}/images/table_bg.gif) repeat-x;">
						<td width="20%" height="30">订单号</td>
						<td width="10%">订单类型</td>
						<td width="20%">供应商</td>
						<td width="8%">制单人</td>
						<td width="18%">制单时间</td>
						<td width="6%">总量</td>
						<td width="12%">总金额</td>
						<td width="6%">审核</td>
					</tr>
					<s:iterator value="orderList">
					<tr align="center" bgcolor="#FFFFFF">
						<td width="20%" height="30">${orderNum }</td>
						<td>${orderTypeView }</td>
						<td>${sm.name }</td>
						<td>${creater.name }</td>
						<td>${createTimeView }</td>
						<td>${totalNum }</td>
						<td align="right">${totalPriceView} 元</td>
						<td>
						<s:if test="status==@com.xinboiedu.erp.invoice.order.vo.OrderModel@ORDER_STATUS_OF_BUY_NOCHECK">
							<s:a action="order_buyCheckDetail">
							 审核
							 <s:param name="om.id" value="id"></s:param>
							</s:a>
						</s:if>
						<s:else>
						  <span style="color:red">${statusView }</span>
						</s:else>
						</td>
					</tr>
					</s:iterator>
				</table>
					<%@include file="../../tools/page.jsp"  %>
			</div>
		</s:form>
	</div>
	<div class="content-bbg"></div>
</div>
