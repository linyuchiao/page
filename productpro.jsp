<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>二手衣物</title>
    <link rel="stylesheet" href="css/product.css">
    <script src="js/product.js"></script>
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</head>
<body>
    <% request.setCharacterEncoding("UTF-8"); %>

    <%
        // 使用 request.getAttribute 获取值
        String productId = (String) request.getAttribute("productId");
        String img = (String) request.getAttribute("img");
        String productName = (String) request.getAttribute("productName");
        String price = (String) request.getAttribute("price");
        String quanity = (String) request.getAttribute("quanity");
    %>

    <header>
        <div class="link">
            <h1><a href="index.jsp">二手衣物</a></h1>
        </div>
        <nav class="link">
            <a href="women.jsp">女裝</a>
            <a href="men.jsp">男裝</a>
            <a href="child.jsp">童裝</a>
            <a href="aboutus.html">關於我們</a>
        </nav>
        <div class="wrap">
            <div class="search">
                <input type="text"  name="search">
                <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#338450" viewBox="0 0 256 256"><path d="M229.66,218.34l-50.07-50.06a88.11,88.11,0,1,0-11.31,11.31l50.06,50.07a8,8,0,0,0,11.32-11.32ZM40,112a72,72,0,1,1,72,72A72.08,72.08,0,0,1,40,112Z"></path></svg></button>
              
            </div>
        </div>
        <div class="link A">
            <a href="user.html"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256"><path d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24ZM74.08,197.5a64,64,0,0,1,107.84,0,87.83,87.83,0,0,1-107.84,0ZM96,120a32,32,0,1,1,32,32A32,32,0,0,1,96,120Zm97.76,66.41a79.66,79.66,0,0,0-36.06-28.75,48,48,0,1,0-59.4,0,79.66,79.66,0,0,0-36.06,28.75,88,88,0,1,1,131.52,0Z"></path></svg></a>
            <a href="cart.html"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256"><path d="M222.14,58.87A8,8,0,0,0,216,56H54.68L49.79,29.14A16,16,0,0,0,34.05,16H16a8,8,0,0,0,0,16h18L59.56,172.29a24,24,0,0,0,5.33,11.27,28,28,0,1,0,44.4,8.44h45.42A27.75,27.75,0,0,0,152,204a28,28,0,1,0,28-28H83.17a8,8,0,0,1-7.87-6.57L72.13,152h116a24,24,0,0,0,23.61-19.71l12.16-66.86A8,8,0,0,0,222.14,58.87ZM96,204a12,12,0,1,1-12-12A12,12,0,0,1,96,204Zm96,0a12,12,0,1,1-12-12A12,12,0,0,1,192,204Zm4-74.57A8,8,0,0,1,188.1,136H69.22L57.59,72H206.41Z"></path></svg></a>
        </div>
    </header>
    <main>
        <div class="product-info">
            <br><br><br><br><br><br>
            <h3> <%=productName %> </h3>
            <h3><strong>價格：</strong>$ <%=price %> </h3>
            <p>衣料採用優質棉質，舒適透氣，適合日常休閒穿著</p>
        </div>
        <div class="container">
            <br><br><br>
            <div class="product-image">
                <img src=" <%=img %> ">
            </div>
        </div>
        <div class="container">
            <div class="item1">
                <!-- 加入購物車的表單 -->
                <form action="" name="">
                    <input type="button" value="-" class="item_button" onclick="minus(0)">
                    <input type="text" value="1"  class="item_num" name="product_quantity">
                    <input type="button" value="+" class="item_button" onclick="add(0)">
                    <input type="button" value="加入購物車" class="item_button" >
                </form>
            </div>
        </div>
        <br>
        <div class="star" id="star-rating">
            <!-- 找到所有的icon，並設立一個data-index，用來判斷點擊的是哪一個星星 -->
                <iconify-icon
                    icon="material-symbols:star-outline"
                    width="40"
                    data-index="1"
                    class="star-icon"></iconify-icon>
                <iconify-icon
                    icon="material-symbols:star-outline"
                    class="star-icon"
                    data-index="2"
                    width="40"></iconify-icon>
                <iconify-icon
                    icon="material-symbols:star-outline"
                    class="star-icon"
                    data-index="3"
                    width="40"></iconify-icon>
                <iconify-icon
                    icon="material-symbols:star-outline"
                    class="star-icon"
                    data-index="4"
                    width="40"></iconify-icon>
                <iconify-icon
                    icon="material-symbols:star-outline"
                    class="star-icon"
                    data-index="5"
                    width="40"></iconify-icon>
            </div>
        <div class="container">
            <div class="comment-section">
                <h2>商品評論</h2>
                <!-- 顯示現有的評論 -->
                <div id="comments-container"></div>
                <!-- 顧客輸入新評論的表單 -->
                <form id="comment-form">
                    <textarea name="comment" id="comment" rows="4" placeholder="請輸入評論"></textarea><br>
                    <div style="text-align: center;">
                       <button type="button" onclick="submitComment()">發表評論</button>
                   </div>
                </form>
            </div>
        </div>
    </main>
    <footer>
        <p>@版權為####所有</p>
    </footer>
</body>
</html>