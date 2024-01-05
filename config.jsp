<%
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/final";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `final`";
con.createStatement().execute(sql);
%>