<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<%
    String searchTerm = request.getParameter("search");

    Connection connection = null;
    try {
        // 載入JDBC驅動程式
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 資料庫連線資訊
        String url = "jdbc:mysql://localhost:3306/final";
        String username = "root";
        String password = "1234";

        // 建立資料庫連線
        connection = DriverManager.getConnection(url, username, password);

        String sql = "SELECT id, img, productName, price, quanity FROM product WHERE productName LIKE ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, "%" + searchTerm + "%");

            rs = pstmt.executeQuery();

            if (rs.next()) {
                String productId = rs.getString("id");
                String img = rs.getString("img");
                String productName = rs.getString("productName");
                String price = rs.getString("price");
                String quanity = rs.getString("quanity");

                // 将值存储在 request 属性中
                request.setAttribute("productId", productId);
                request.setAttribute("img", img);
                request.setAttribute("productName", productName);
                request.setAttribute("price", price);
                request.setAttribute("quanity", quanity);

                // 转发到 producttest.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
                dispatcher.forward(request, response);
                return;  // 重要：在转发后要终止程序，以防止后续代码执行影响转发结果
            }

            // 如果没有找到符合的产品，可以添加相应的处理逻辑

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
