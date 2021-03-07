<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My account</title>
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
                <div class="bundle">
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
        <h2 class="block__header">Recent activities</h2>
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

    <jsp:include page="sideBar.jsp"/>
</div>

<jsp:include page="footer.html"/>

<script src="js/main.js"></script>
</body>
</html>
