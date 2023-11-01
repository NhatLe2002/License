<%@page import="dao.PaymentDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="vnpay.common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />

        <style>
            /* result transaction */
            .transaction-container {
                background-color: white;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .transaction-info {
                text-align: left;
                margin-bottom: 10px;
            }

            .transaction-info span {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>


        <!--Begin display -->
        <%--
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%= request.getParameter("vnp_Amount").substring(0, request.getParameter("vnp_Amount").length() - 2)%></label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label>Thanh toán hóa đơn cho dịch vụ đăng ký học và thi thử lái xe</label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    String raw_price = request.getParameter("vnp_Amount").substring(0, request.getParameter("vnp_Amount").length() - 2);
                                    float price = Float.parseFloat(raw_price);
                                    int memberID = Integer.parseInt(session.getAttribute("memberID").toString());
                                    String type = session.getAttribute("type").toString();
                                    PaymentDAO.createPayment(
                                            memberID,
                                            price,
                                            type,
                                            true,
                                            true);
                                    out.print("Thành công");
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
                <a class="menu_items " href="/LicenseReal/MainController?action=home">Home</a>
            </footer>


        </div>  
        
        --%>

        <%--<c:import url="../userHeader.jsp"/>--%>



        <div class="result-payment d-flex flex-column justify-content-center align-items-center mb-5">
            <div class="modal-header">
                <h5 class="modal-title my-3">KẾT QUẢ THANH TOÁN</h5>
            </div>
            <div class="modal-body w-50">
                <div class="transaction-container" style="position: relative">
                    <div class="transaction-info">
                        <span>Mã giao dịch thanh toán:</span> <%=request.getParameter("vnp_TxnRef")%>
                    </div>
                    <div class="transaction-info">
                        <span>Số tiền:</span> <%= request.getParameter("vnp_Amount").substring(0, request.getParameter("vnp_Amount").length() - 2)%>
                    </div>
                    <div class="transaction-info">
                        <span>Mô tả giao dịch:</span> Thanh toán hóa đơn cho dịch vụ đăng ký học và thi thử lái
                        xe
                    </div>
                    <div class="transaction-info">
                        <span>Mã giao dịch tại CTT VNPAY-QR:</span> <%=request.getParameter("vnp_TransactionNo")%>
                    </div>
                    <div class="transaction-info">
                        <span>Mã ngân hàng thanh toán:</span> <%=request.getParameter("vnp_BankCode")%>
                    </div>
                    <div class="transaction-info">
                        <span>Thời gian thanh toán:</span> <%=request.getParameter("vnp_PayDate")%>
                    </div>
                    <div class="transaction-info mb-5">
                        <span>Tình trạng giao dịch:</span>

                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    try {
                                        String raw_price = request.getParameter("vnp_Amount").substring(0, request.getParameter("vnp_Amount").length() - 2);
                                        float price = Float.parseFloat(raw_price);
                                        int memberID = Integer.parseInt(session.getAttribute("memberID").toString());
                                        String type = session.getAttribute("type").toString();
                                        PaymentDAO.createPayment(
                                                memberID,
                                                price,
                                                type,
                                                true,
                                                true);
                                        out.print("Thành công");
                                    } catch (Exception e) {
                                        out.print("Không thành công");
                                    }

                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %>
                    </div>

                    <button class="btn btn-primary mt-5" style="position: absolute; bottom: 10px; right: 10px">
                        <a href="/LicenseReal/MainController?action=home" style="color: white; text-decoration: none"> Back to home</a>
                    </button>
                </div>

            </div>

        </div>

        <c:import url="../userFooter.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
