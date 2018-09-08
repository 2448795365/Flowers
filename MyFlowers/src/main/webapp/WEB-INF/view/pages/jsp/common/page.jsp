<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
</head>

<body>
	<input name="curr" id="curr" type="hidden"
		value="${requestScope.curr }">


	<div id="page"></div>
	<script type="text/javascript">
		layui.use('laypage', function() {
			var laypage = layui.laypage;
			var currpage = document.getElementById("curr").value;
			if (currpage == null || (currpage != null && curr.length == 0)) {
				currpage = 0;
			}
			laypage.render({
				elem : 'page', //ע�⣬����� test1 �� ID�����ü� # ��
				layout : [ 'prev', 'page', 'next', 'skip', 'count' ], //�Զ����ҳ���� 
				count : '${requestScope.count}', //�����������ӷ���˵õ�
				curr : currpage,
				limit : 6,
				jump : function(obj, first) {
					console.log(obj.curr); //�õ���ǰҳ���Ա������������Ӧҳ�����ݡ�
					console.log(obj.limit); //�õ�ÿҳ��ʾ������
					//�״β�ִ��
					if (!first) {
						setCurrentPage(obj.curr);
						var form = document.getElementById("cartinfo");
						form.action = "users/mycart";
						$('#cartinfo').submit();
					}
				}
			});
		});
		function setCurrentPage(curr) {
			document.getElementById("curr").value = curr ;
		}
	</script>
</body>
</html>
