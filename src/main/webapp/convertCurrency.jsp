<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Convert currency</title>
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

<jsp:include page="header.jsp" />

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
                <div class="bundle active">
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
                <input type="hidden" name="command" value="convertCurrency" />
                <c:choose>
                    <c:when test = "${sameCurrencyType == 'Yes'}">
                        <em>You should not convert inside the same currency type. </em>
                    </c:when>
                    <c:when test = "${existsCurrencyAccount == 'No'}">
                        <em>Your currency account does not exist. </em>
                    </c:when>
                    <c:when test = "${existsTargetCurrencyAccount == 'No'}">
                        <em>Your target currency account does not exist. </em>
                    </c:when>
                    <c:when test = "${isEnoughBalance == 'No'}">
                        <em> You do not have enough balance. </em>
                    </c:when>
                    <c:when test = "${reachedLimit == 'Yes'}">
                        <em>You have reached your daily transfer limit. </em>
                    </c:when>
                    <c:when test = "${isValidAmount == 'Yes'}">
                        <em>You should enter a positive number. </em>
                    </c:when>
                    <c:when test = "${isConversionSuccessful == 'Yes'}">
                        <em>You have successfully converted ${currencyName} into ${transferAmount} ${targetCurrencyName}. </em>
                    </c:when>
                </c:choose>
                <div class="form-group">
                    <label for="currency" class="required"
                    >Convert currency type</label
                    >
                    <select id="currency" name="currencyTypeId">
                        <option value="1">EUR</option>
                        <option value="2">USD</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="amount" class="required">Into the amount of</label>
                    <input
                            id="amount"
                            class="form-control"
                            type="number"
                            name="convertAmount"
                            placeholder="Amount to be transferred"
                            minlength="1"
                            maxlength="255"
                            required
                    />
                </div>
                <div class="form-group">
                    <label for="target-currency" class="required"
                    >Currency type</label
                    >
                    <select id="target-currency" name="targetCurrencyTypeId">
                        <option value="1">EUR</option>
                        <option value="2">USD</option>
                    </select>
                </div>
                <input class="btn btn--square" type=submit value="Convert"/>
                <p class="muted">Copyright &copy; 2021</p>
            </form>
        </div>
    </section>

    <jsp:include page="sideBar.jsp"/>
</div>

<jsp:include page="footer.html"/>

<%--Current balance: ${currentBalance} ${currencyName}--%>
<%--You can still spend ${availableBalance} ${currencyName} today--%>


<%--<form action="CurrencyConvertServlet" method="POST">--%>
<%--    Choose the type of currency:--%>
<%--    <select name="currencyTypeId">--%>
<%--        <option value="1">EUR</option>--%>
<%--        <option value="2">USD</option>--%>
<%--    </select>--%>
<%--    <select name="targetCurrencyTypeId">--%>
<%--        <option value="1">EUR</option>--%>
<%--        <option value="2">USD</option>--%>
<%--    </select>--%>
<%--    <tr>--%>
<%--        <td>--%>
<%--            Amount to be converted:--%>
<%--        <td>--%>
<%--            <input type=text name="convertAmount" size=20>--%>
<%--    </tr>--%>
<%--    <button type="submit" class="btn">Create</button>--%>

<%--    <c:choose>--%>
<%--        <c:when test = "${existsCurrencyAccount == 'No'}">--%>
<%--            <h3>Your currency account does not exist. </h3>--%>
<%--        </c:when>--%>
<%--        <c:when test = "${existsTargetCurrencyAccount == 'No'}">--%>
<%--            <h3>Your target currency account does not exist. </h3>--%>
<%--        </c:when>--%>
<%--        <c:when test = "${isEnoughBalance == 'No'}">--%>
<%--        <h3> You do not have enough balance. </h3>--%>
<%--    </c:when>--%>
<%--        <c:when test = "${reachedLimit == 'Yes'}">--%>
<%--            <h3>You have reached your daily transfer limit. </h3>--%>
<%--        </c:when>--%>
<%--        <c:when test = "${isValidAmount == 'Yes'}">--%>
<%--            <h3>You should enter a positive number. </h3>--%>
<%--        </c:when>--%>
<%--        <c:when test = "${isConversionSuccessful == 'Yes'}">--%>
<%--            <h3>You have successfully converted into ${transferAmount} ${targetCurrencyName}. </h3>--%>
<%--        </c:when>--%>
<%--    </c:choose>--%>

<script src="js/main.js"></script>
</body>
</html>
