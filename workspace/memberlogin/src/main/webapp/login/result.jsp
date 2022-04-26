<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 서블릿에서 공유데이터
	String res = (String)request.getAttribute("gogogo");
	int num = (int)request.getAttribute("num") ;
// 	String input = (String)request.getAttribute("dododo");
//	if(res.equals(input))
	
	if(res != null){
%>
	{
		"flag" : "<%=res %>님 가입을 축하합니다!!"
	}	
<%	}else{%>
		
		{
			"flag" : "가입실패 가입실패 가입실패"
		}
		
<%	}

%>