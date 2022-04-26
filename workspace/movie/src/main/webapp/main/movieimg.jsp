<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 서블릿에서 공유데이터
	
	String res =  String.valueOf(request.getAttribute("img"));
	
 	if(res != null){
%>
		{
			"flag" : <%=res%>
		
		}		
<%
 	}else{
%>
 		{
 			"flag" : "실패(null)"
 		
 		}
 		
<%
 	}
%>




















<!-- 	{ -->
<!-- 		"flag" : "회원가입 성공!!" -->
<!-- 	}	 -->
<%-- <%	}else{%> --%>
		
<!-- 		{ -->
<!-- 			"flag" : "가입실패" -->
<!-- 		} -->
		
<%-- <%	} --%>

<%-- %> --%>