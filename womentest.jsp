<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品列表</title>
    <link rel="stylesheet" href="css/women.css">
</head>
<body>
    <!-- 商品功能列 -->
    <header>
        <div class="link">
            <h1><a href="index.html">二手衣物</a></h1>
        </div>
        <nav class="link">
            <a href="women.html">女裝</a>
            <a href="men.html">男裝</a>
            <a href="child.html">童裝</a>
            <a href="sell.html">我要轉售二手衣</a>
        </nav>
        <div class="link A">
            <a href="user.html"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256"><path d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24ZM74.08,197.5a64,64,0,0,1,107.84,0,87.83,87.83,0,0,1-107.84,0ZM96,120a32,32,0,1,1,32,32A32,32,0,0,1,96,120Zm97.76,66.41a79.66,79.66,0,0,0-36.06-28.75,48,48,0,1,0-59.4,0,79.66,79.66,0,0,0-36.06,28.75,88,88,0,1,1,131.52,0Z"></path></svg></a>
            <a href="cart.html"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256"><path d="M222.14,58.87A8,8,0,0,0,216,56H54.68L49.79,29.14A16,16,0,0,0,34.05,16H16a8,8,0,0,0,0,16h18L59.56,172.29a24,24,0,0,0,5.33,11.27,28,28,0,1,0,44.4,8.44h45.42A27.75,27.75,0,0,0,152,204a28,28,0,1,0,28-28H83.17a8,8,0,0,1-7.87-6.57L72.13,152h116a24,24,0,0,0,23.61-19.71l12.16-66.86A8,8,0,0,0,222.14,58.87ZM96,204a12,12,0,1,1-12-12A12,12,0,0,1,96,204Zm96,0a12,12,0,1,1-12-12A12,12,0,0,1,192,204Zm4-74.57A8,8,0,0,1,188.1,136H69.22L57.59,72H206.41Z"></path></svg></a>
        </div>
    </header>

    <main>
        <h2 style="padding-top: 100px;">商品列表</h2>
        <div class='container'>
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
                String sql = "SELECT id, img, productName, price FROM product";
                rs = stmt.executeQuery(sql); // 使用stmt執行查詢，並以rs存取全部資料
                
                while(rs.next()) {
                    out.print("<div class='container'>");
                    out.print("<div class='clothes'>");
                    out.print("<div class='item'>"); 
                    out.print("<div class='image'>"); 
                    out.print("<img src='" + rs.getString("img") + "' alt=''");  
                    out.print("</div>");
                    out.print("<div class='clothes-name'>" + rs.getString("productName") + "</div>");       
                    out.print("<div class='price'>" + "NT " + rs.getString("price") + "</div>"); 
                    out.print("</div>");
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
        </div>
        <div style="display: flex;justify-content: center;">
            <a href="child.html">上一頁</a>
            <a href="men.html">下一頁</a>
        </div>
    </main>

    <footer>
        <p>@版權為####所有</p>
    </footer>
</body>
</html>
