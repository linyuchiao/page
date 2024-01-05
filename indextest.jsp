<!-- 首頁 - 會員未登入狀態-->
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <!--商品功能列-->
    <header>
        <div class="link">
            <h1><a href="index.jsp">二手衣物</a></h1>
        </div>
        <nav class="link">
            <a href="women.html">女裝</a>
            <a href="men.html">男裝</a>
            <a href="child.html">童裝</a>
            <a href="aboutus.html">關於我們</a>
        </nav>
        <div class="wrap">
        <form action = "search.jsp" method = "POST" >  <!--搜尋傳值-->
            <div class="search">
                    <input type="text"  name="search">
                    <button type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="#338450" viewBox="0 0 256 256"><path d="M229.66,218.34l-50.07-50.06a88.11,88.11,0,1,0-11.31,11.31l50.06,50.07a8,8,0,0,0,11.32-11.32ZM40,112a72,72,0,1,1,72,72A72.08,72.08,0,0,1,40,112Z"></path></svg></button>   
            </div>
        </form>
        </div>
        <div class="link A">
            <a href="user.html"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256"><path d="M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24ZM74.08,197.5a64,64,0,0,1,107.84,0,87.83,87.83,0,0,1-107.84,0ZM96,120a32,32,0,1,1,32,32A32,32,0,0,1,96,120Zm97.76,66.41a79.66,79.66,0,0,0-36.06-28.75,48,48,0,1,0-59.4,0,79.66,79.66,0,0,0-36.06,28.75,88,88,0,1,1,131.52,0Z"></path></svg></a>
            <a href="cart.html"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#136f63" viewBox="0 0 256 256"><path d="M222.14,58.87A8,8,0,0,0,216,56H54.68L49.79,29.14A16,16,0,0,0,34.05,16H16a8,8,0,0,0,0,16h18L59.56,172.29a24,24,0,0,0,5.33,11.27,28,28,0,1,0,44.4,8.44h45.42A27.75,27.75,0,0,0,152,204a28,28,0,1,0,28-28H83.17a8,8,0,0,1-7.87-6.57L72.13,152h116a24,24,0,0,0,23.61-19.71l12.16-66.86A8,8,0,0,0,222.14,58.87ZM96,204a12,12,0,1,1-12-12A12,12,0,0,1,96,204Zm96,0a12,12,0,1,1-12-12A12,12,0,0,1,192,204Zm4-74.57A8,8,0,0,1,188.1,136H69.22L57.59,72H206.41Z"></path></svg></a>
        </div>
       
    </header>
    <!--動態廣告-->
    <main>
        <div class="advertisment">
            <div class="content">
                <div class="ad">
                    <div>
                        <img class="mySlides" src="image/shoplist_img_pc.png" alt="">
                    </div>
                    <div>
                        <img class="mySlides" src="image/sellitem_img_pc.png" alt="">
                    <div>
                    <div>
                        <img class="mySlides" src="https://images.unsplash.com/photo-1561365452-adb940139ffa?q=80&w=2056&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                    </div>
                    <script src="index.js"></script>
                </div>
        
            </div>
        </div>
    </main>
    <!--最新上架-->
    <h2>最新上架</h2>
    <div class="container">
        <div class="clothes">
            <div class="item">
                <div class="image">
                    <img src="image/women01.jpg" alt="">
                </div>
                <div class="clothes-name">REDYAZEL/針織毛衣</div>
                <div class="price"> NT 1200</div>
            </div>
        </div>
        <div class="clothes">
            <div class="item">
                <div class="image">
                    <img src="image/women02.jpg" alt="">
                </div>
                <div class="clothes-name">To b. by agnes b/短袖上衣</div>
                <div class="price">NT 1000</div>
            </div>
        </div>
        <div class="clothes">
            <div class="item">
                <div class="image">
                    <img src="image/women03.jpg" alt="">
                </div>
                <div class="clothes-name">BURBERRY LONDON/T恤/M</div>
                <div class="price">NT 3500</div>
            </div>
        </div>
        <div class="clothes">
            <div class="item">
                <div class="image">
                    <img src="image/women04.jpg" alt="">
                </div>
                <div class="clothes-name">LYLE&SCOTT/外套/S</div>
                <div class="price">NT 1800</div>
            </div>
        </div>
    </div>
<%
  int counter;
  String strNo = (String)application.getAttribute("counter");//讀application變數
  counter = Integer.parseInt(strNo); //轉成整數
  if (session.isNew())
     counter++;                                      //計數器加1
  strNo = String.valueOf(counter);    //轉成字串
  application.setAttribute("counter", strNo);//寫application變數
%> 
    <div style="text-align: right;">你是第：<%= counter %>個訪客</div> <!-- 訪客計數器 -->
    
    <footer>
        <p>@版權為####所有</p>
    </footer>
</body>
</html>