<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 進入網址：http://localhost:8080/final%20project/sqlConnection.jsp -->

<!DOCTYPE html>
<html>
<head>
    <title>產品展示</title>
    <!-- 添加適當的樣式或JavaScript -->
</head>
<body>
    <h1>產品列表</h1>
    <table border="1">
        <tr>
            <th>id</th>
            <th>img</th>
            <th>name</th>
            <th>price</th>
            <th>quanity</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                // 載入JDBC驅動程式
                Class.forName("com.mysql.cj.jdbc.Driver");

                // 資料庫連線資訊
                String url = "jdbc:mysql://localhost:3306/final";
                String dbUsername = "root";
                String dbPassword = "1234";

                // 建立資料庫連線
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                stmt = conn.createStatement(); // 初始化stmt對象

                // SQL查詢語句
                String sql = "SELECT id, img, productName, price, quanity FROM product";
                rs = stmt.executeQuery(sql); // 使用stmt執行查詢，並以rs存取全部資料
                while(rs.next()) {
                    int DisplayID = rs.getInt("id");
                    String DisplayImg = rs.getString("img");
                    String DisplayProductName = rs.getString("productName");
                    String DisplayPrice = rs.getString("price");
                    String DisplayQuanity = rs.getString("quanity");
        %>
                    <tr>
                        <td><%= DisplayID %></td>
                        <td><%= DisplayImg %></td>
                        <td><%= DisplayProductName %></td>
                        <td><%= DisplayPrice %></td>
                        <td><%= DisplayQuanity %></td>
                    </tr>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                // 在finally區塊中關閉資源
                if (rs != null) try { rs.close(); } catch (SQLException e) { }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { }
                if (conn != null) try { conn.close(); } catch (SQLException e) { }
            }
        %>
    </table>
</body>
</html>

