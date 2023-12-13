<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 여기서는 간단히 세션에서 값을 가져오는 예제입니다.
   Object certValue = session.getAttribute("cert");
   String certString = (certValue != null) ? certValue.toString() : "false";
   System.out.println(certString);
   out.print(certString);
%>