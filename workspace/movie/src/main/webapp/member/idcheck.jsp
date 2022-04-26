<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String id = (String)request.getAttribute("gogogo");
   if(id == null){
      // 사용가능
%>   
   {
      "flag" : "사용 가능한 아이디입니다!"   
   }
   

<%    }else{
   // 사용불가능
%>
   {
      "flag" : "사용 불가능한 아이디입니다.."
   }

<%
   }   
%>    