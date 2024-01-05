<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
// 檢查是否有提供使用者ID和密碼
if(request.getParameter("id") !=null && !request.getParameter("id").equals("") 
	&& request.getParameter("pwd") != null && !request.getParameter("pwd").equals("")){

    // 建立SQL查詢語句，檢查使用者提供的ID和密碼是否存在於資料庫中
    sql = "SELECT * FROM `members` WHERE `id`='" +request.getParameter("id") + 
	      "'  AND `pwd`='" + request.getParameter("pwd") + "'"  ; 
	
    // 執行SQL查詢
    ResultSet rs =con.createStatement().executeQuery(sql);
    
    // 如果查詢結果存在，表示使用者驗證成功
    if(rs.next()){            
        // 設定session屬性以保留使用者身份
        session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
        response.sendRedirect("indexpro.jsp") ;
    }
    // 如果查詢結果不存在，表示使用者驗證失敗
    else{
		con.close();//結束資料庫連結
%>
<!-- 會員登入失敗頁面-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            <a href="cart.html"> <!-- 建議直接導入登入頁面 -->
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256">
                    <path d="M222.14,58.87A8,8,0,0,0,216,56H54.68L49.79,29.14A16,16,0,0,0,34.05,16H16a8,8,0,0,0,0,16h18L59.56,172.29a24,24,0,0,0,5.33,11.27,28,28,0,1,0,44.4,8.44h45.42A27.75,27.75,0,0,0,152,204a28,28,0,1,0,28-28H83.17a8,8,0,0,1-7.87-6.57L72.13,152h116a24,24,0,0,0,23.61-19.71l12.16-66.86A8,8,0,0,0,222.14,58.87ZM96,204a12,12,0,1,1-12-12A12,12,0,0,1,96,204Zm96,0a12,12,0,1,1-12-12A12,12,0,0,1,192,204Zm4-74.57A8,8,0,0,1,188.1,136H69.22L57.59,72H206.41Z"></path>
                </svg>
            </a>
        </div>
    </header>

    <div class="login-signup">
        <form action="check.jsp" method="POST" class="login">
            <h1>登入</h1>
            <h4><font color="red">帳號密碼錯誤</font></h4>
            <input type="text" name="id" placeholder="Username 用戶名" />
            <input type="password" name="pwd" placeholder="Password 密碼" >
            沒有帳號?<a href='signup.html'>註冊</a>
            <input type="submit" name="b1" value="Submit 提交"> 
        </form>
    </div>
</body>
</html>

<%
	}
}
// 如果未提供使用者ID或密碼，重新導向至usertest.html
else
	response.sendRedirect("user.html");
%>




