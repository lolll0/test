<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 서블릿에서 공유데이터
	String res = (String)request.getAttribute("gogogo");
	String ch = (String)request.getAttribute("ch");	

	if(res != null || ch !="실패"){
%>
	{
		"flag" : "회원가입 성공!!"
	}	
<%	}else{%>
		
		{
			"flag" : "가입실패"
		}
		
<%	}

%>