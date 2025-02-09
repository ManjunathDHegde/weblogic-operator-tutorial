<%-- 
    Document   : welcome
    Edited on : 24 Jun, 2018, 5:39:03 AM
    Author     : manhegde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet"> 
        <title>Sample Web Application  - SnoopServlet</title>
        <style>
            body{
                font-family: 'Open Sans', sans-serif;
            }
            table,td,tr{
                border: 1px solid;
                border-collapse: collapse;
            }
            span{
                font-weight: normal;
                font-size: 16px;
                color: black;
            }
            </style>
    </head>
    <body>
        
        <%
            String hostName;
            String serverName;
            Date Time;
            String Dtime;
            hostName = InetAddress.getLocalHost().getHostName()+" with IP="+InetAddress.getLocalHost().getHostAddress()+" ";
            serverName = System.getProperty("weblogic.Name");
            Time = new Date();
            Dtime = Time.toString();
            %>
        <h2> This is a Sample Web Application - Snoop Servlet  </h2>
        <hr>
        
         <div>
        <h3>Servlet Spec Version Implemented: </h3>
        <h4><span><%= getServletConfig().getServletContext().getMajorVersion() + "." + getServletConfig().getServletContext().getMinorVersion() %></span> </h4>

        <h3>Init parameters :</h3>
        <h4><span><%
        Enumeration e = getServletConfig().getInitParameterNames();
        while (e.hasMoreElements()) {
          String name = (String)e.nextElement();
          out.println(name + ": " + getServletConfig().getInitParameter(name));
        }
        %></span>  </h4>           
        <h4>Host Name & IP Address: <span><%=  hostName %></span></h4>
        <h4>JVM Name: <span><%=  serverName %></span></h4>
        <h4> Date & Time: <span> <%= Dtime %> </h4>
        <h4>HTTP Request URL : <span><%= request.getRequestURL() %></span></h4>
        <h4>Request Method: <span><%= request.getMethod() %></span></h4>
        <h4>Request URI: <span><%= request.getRequestURI() %></span></h4>
        <h4>Request Protocol: <span><%= request.getProtocol() %></span></h4>
        <h4>Servlet Path: <span><%= request.getServletPath() %></span></h4>
        <h4>Content Length: <span><%= request.getContentLength() %></span></h4>
        <h4>Content Type: <span><%= request.getContentType() %></span></h4>
        <h4>Server Name: <span><%= request.getServerName() %></span></h4>
        <h4>Server Port: <span><%= request.getServerPort() %></span></h4>
        <h4>Remote Address: <span><%= request.getRemoteAddr() %></span></h4>
        <h4>Remote Host: <span><%= request.getRemoteHost() %></span></h4>
                
        </div>
 
        <h4>HTTP Request Headers Received</h4>
        
        <table>
            <% 
                Enumeration enumeration = request.getHeaderNames(); 
                while (enumeration.hasMoreElements()) 
                 { 
                  String name=(String) 
                  enumeration.nextElement(); 
                  String value = request.getHeader(name);
              %>
                <tr>
                    <td>
                        <%=name %>
                    </td>
                    <td>
                        <%=value %>
                    </td>
                </tr>
             <% } %>
        </table>
        
        <h4>HTTP Cookies Received</h4>
           
          <table>
               <%
            
            Cookie[] arr1= request.getCookies();
            for (int i=0; i < arr1.length; i++)
            {
                String cookiename = arr1[i].getName();
                String cookievalue = arr1[i].getValue();
            
            %>
                <tr>
                    <td>
                        <%=cookiename %>
                    </td>
                    <td>
                        <%=cookievalue %>
                    </td>
                </tr>
             <% } %>
        </table>  
            
        
</body>
</html>
