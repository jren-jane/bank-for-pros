<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Transaction record</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <script
            src="https://kit.fontawesome.com/62fd41fcc7.js"
            crossorigin="anonymous"
    ></script>
</head>
<body>
<jsp:include page="header.jsp"/>


<div class="grid grid--1x3">
    <section class="menu">
        <ul>
            <li>
                <div class="bundle active">
                    <i class="fas fa-file-invoice-dollar"></i
                    ><a href="transactionRecord.jsp">Transaction history</a>
                </div>
            </li>
            <li>
                <div class="bundle">
                    <i class="fas fa-money-check"></i><a href="transfer.jsp">Transfer money </a>
                </div>
            </li>
            <li class="collapsible">
                <div class="bundle">
                    <i class="fas fa-dollar-sign"></i
                    >Foreign currency
                </div>
                <ul class="collapsible__content">
                    <div class="bundle">
                        <li>
                            <a href="createForeignCurrencyAccount.jsp"> Create foreign currency account </a>
                        </li>
                    </div>
                    <div class="bundle">
                        <li><a href="convertCurrency.jsp">Convert currency </a></li>
                    </div>
                </ul>
            </li>
        </ul>
        <ul>
            <li class="collapsible">
                <div class="bundle">
                    <i class="fas fa-cog"></i>Settings
                </div>
                <ul class="collapsible__content">
                    <div class="bundle">
                        <li><a href="changePassword.jsp">Change password </a></li>
                    </div>
                </ul>
            </li>
        </ul>
    </section>

    <section class="grid--col-2">
        <div
                class="form-container form-container--secondary form-container--long"
        >
            <form class="form-transaction" action="BankingControllerServlet" method="POST">
                <input type="hidden" name="command" value="getTransactionRecord" />
                <div class="form-group">
                    <label for="from-date">From date:</label>
                    <input
                            id="from-date"
                            class="form-control"
                            type="date"
                            name="fromDate"
                            placeholder="yyyy-mm-dd"
                            minlength="1"
                            maxlength="255"

                    />
                </div>
                <div class="form-group">
                    <label for="to-date">To date:</label>
                    <input
                            id="to-date"
                            class="form-control"
                            type="date"
                            name="toDate"
                            placeholder="yyyy-mm-dd"
                            minlength="1"
                            maxlength="255"

                    />
                </div>
                <div class="form-group">
                    <label for="from-amount" >From amount:</label>
                    <input
                            id="from-amount"
                            class="form-control"
                            type="number"
                            name="startAmount"
                            placeholder="minimum amount"
                            minlength="1"
                            maxlength="255"

                    />
                </div>
                <div class="form-group">
                    <label for="to-amount" >To amount:</label>
                    <input
                            id="to-amount"
                            class="form-control"
                            type="number"
                            name="endAmount"
                            placeholder="maximum amount"
                            minlength="1"
                            maxlength="255"

                    />
                </div>
                <div class="form-group">
                    <label for="currency" >Currency:</label>
                    <select id="currency" name="currencyTypeId">
                        <option value="">All</option>
                        <option value="1">EUR</option>
                        <option value="2">USD</option>
                    </select>
                </div>
                <input type="submit" value="Get transactions" class="btn btn--square">
                <p class="muted">Copyright &copy; 2021</p>
            </form>
        </div>

        <table>
            <thead>
            <tr>
                <th>Transaction date</th>
                <th>Transaction amount</th>
                <th>Currency</th>
                <th>Target account</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="transaction" items="${transactionsList}">
                <tr>
                    <td> ${transaction.transactionDate} </td>
                    <td> ${transaction.transactionAmount} </td>
                    <td> ${transaction.currencyName}</td>
                    <td> ${transaction.targetEmail} </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>

<%--            <form action="TransactionServlet" method="POST">--%>

<%--                            From Date--%>
<%--                            <input type=text name="fromDate" size=10>(yyyy-mm-dd)--%>
<%--                            To--%>
<%--                            <input type=text name="toDate" size=10>(yyyy-mm-dd)--%>

<%--                            Amount Starting From--%>

<%--                            <input type=text name="startAmount" size=10>--%>
<%--                            To--%>
<%--                            <input type=text name="endAmount" size=10>--%>

<%--                        Currency--%>
<%--                        <select name = "currencyTypeId">--%>
<%--                            <option value = "">All</option>--%>
<%--                            <option value = "1">EUR</option>--%>
<%--                            <option value = "2">USD</option>--%>
<%--                        </select>--%>


<%--                <input type=submit value="Get Transactions">--%>
<%--                <input type=reset value="Clear">--%>
<%--                &nbsp;--%>
<%--                <a href="my-account.jsp">Go Back To Menu </a>--%>
<%--            </form>--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <th>Transaction date</th>--%>
<%--                <th>Transaction amount</th>--%>
<%--                <th>Currency type</th>--%>
<%--                <th>Transaction target</th>--%>
<%--            </tr>--%>

<%--            <c:forEach var="transaction" items="${transactionsList}">--%>
<%--                <tr>--%>
<%--                    <td> ${transaction.transactionDate} </td>--%>
<%--                    <td> ${transaction.transactionAmount} </td>--%>
<%--                    <td> ${transaction.currencyName}</td>--%>
<%--                    <td> ${transaction.targetEmail} </td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>

<jsp:include page="sideBar.jsp"/>
</div>

<jsp:include page="footer.html"/>
<script src="js/main.js"></script>
</body>
</html>


