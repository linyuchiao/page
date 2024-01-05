<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊頁面</title>
    <link rel="stylesheet" href="css/user.css">
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
            <a href="aboutus.html">關於我們</a>
        </nav>
        <div class="link A">
            <a href="user.html">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256">
                    <path d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24ZM74.08,197.5a64,64,0,0,1,107.84,0,87.83,87.83,0,0,1-107.84,0ZM96,120a32,32,0,1,1,32,32A32,32,0,0,1,96,120Zm97.76,66.41a79.66,79.66,0,0,0-36.06-28.75,48,48,0,1,0-59.4,0,79.66,79.66,0,0,0-36.06,28.75,88,88,0,1,1,131.52,0Z"></path>
                </svg>
            </a>
            <a href="cart.html">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256">
                    <path d="M222.14,58.87A8,8,0,0,0,216,56H54.68L49.79,29.14A16,16,0,0,0,34.05,16H16a8,8,0,0,0,0,16h18L59.56,172.29a24,24,0,0,0,5.33,11.27,28,28,0,1,0,44.4,8.44h45.42A27.75,27.75,0,0,0,152,204a28,28,0,1,0,28-28H83.17a8,8,0,0,1-7.87-6.57L72.13,152h116a24,24,0,0,0,23.61-19.71l12.16-66.86A8,8,0,0,0,222.14,58.87ZM96,204a12,12,0,1,1-12-12A12,12,0,0,1,96,204Zm96,0a12,12,0,1,1-12-12A12,12,0,0,1,192,204Zm4-74.57A8,8,0,0,1,188.1,136H69.22L57.59,72H206.41Z"></path>
                </svg>
            </a>
        </div>
    </header>

    <%
        // 取得表單提交的資訊
        String username = request.getParameter("id");
        String password = request.getParameter("pwd");
        String confirmPwd = request.getParameter("confirmPwd");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // 宣告註冊訊息的變數
        String registerMessage = "";

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty() || confirmPwd == null || confirmPwd.trim().isEmpty() ||phone == null || phone.trim().isEmpty() ||email == null || email.trim().isEmpty() ) {
            // 如果任一欄位為空，重新導向回signup.jsp
            response.sendRedirect("signup.html");
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // 載入 MySQL JDBC 驅動程式
                Class.forName("com.mysql.cj.jdbc.Driver");
                // 資料庫連接資訊
                String url = "jdbc:mysql://localhost:3306/final";
                String dbUsername = "root";
                String dbPassword = "1234";

                // 連接資料庫
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                // 檢查是否有重複的使用者名稱
                String checkUserQuery = "SELECT id FROM members WHERE id=?";
                pstmt = conn.prepareStatement(checkUserQuery);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // 如果已存在相同的使用者名稱，設定註冊訊息並重新導向回signup.jsp
    %>
                        <div class="login-signup">
                            <form action="" method="POST" class="login">
                                <h1>用戶名已被使用</h1>
                                <a href="signup.html">
                                <input type="button" value="重新註冊"></a>
                            </form>
                        </div>
    <%
                } else {
                    // 準備 SQL 語句，插入會員資訊
                    String insertUserQuery = "INSERT INTO `members` (id, pwd, phone, email) VALUES (?, ?, ?, ?)";
                    pstmt = conn.prepareStatement(insertUserQuery);
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    pstmt.setString(3, phone);
                    pstmt.setString(4, email);

                    // 執行 SQL 語句，取得影響的行數
                    int rowsAffected = pstmt.executeUpdate();

                    // 判斷是否成功註冊
                    if (rowsAffected > 0) {
    %>
                        <div class="login-signup">
                            <form action="" method="POST" class="login">
                                <h1>註冊成功</h1>
                                <a href="user.html">
                                <input type="button" value="登入"></a>
                            </form>
                        </div>
    <%
                    } else {
    %>
                        <div class="login-signup">
                            <form action="" method="POST" class="login">
                                <h1>註冊</h1>
                                <h4><font color="red">註冊失敗，請檢查資料是否正確</font></h4>
                                <h4><font color="red"><%= registerMessage %></font></h4>
                                <input type="text" placeholder="Username 用戶名" name="id"/>
                                <input type="password" placeholder="Password 密碼" name="pwd">
                                <input type="password" placeholder="Password 確認密碼" name="confirmPwd">
                                <input type="password" placeholder="Phone 電話" name="phone">
                                <input type="text" placeholder="Email 電子郵件" name="email">
                                <input type="submit" value="Submit 提交">
                            </form>
                        </div>
    <%
                    }

                }
            } catch (Exception e) {
                // 處理例外狀況，並將錯誤訊息存入註冊訊息變數
                registerMessage = "錯誤：" + e.getMessage();
                e.printStackTrace(); // 印出錯誤訊息到控制台以方便除錯

                // 印出錯誤訊息到網頁上
                out.println("<p>" + registerMessage + "</p>");

            } finally {
                // 關閉資源
                try {
                    if (pstmt != null) pstmt.close();
                    if (rs != null) rs.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    // 處理關閉資源時可能發生的例外狀況
                    se.printStackTrace();
                }
            }
        }
    %>
</body>
</html>








