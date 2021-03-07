<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Transfer funds</title>
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
                <div class="bundle active">
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
                <input type="hidden" name="command" value="transferFunds" />
                <c:choose>
                    <c:when test = "${isCorrectEmail == 'No'}">
                        <em>The email address you have entered does not exist. Please try again. </em>
                    </c:when>
                    <c:when test="${existsClientForeignCurrencyAccount == 'No'}">
                        <em>You do not have the corresponding foreign currency account. </em>
                    </c:when>
                    <c:when test = "${existsTargetForeignCurrencyAccount == 'No'}">
                        <em>The target user does not have the corresponding foreign currency account. </em>
                    </c:when>
                    <c:when test = "${isEnoughBalance == 'No'}">
                        <em>There is not sufficient balance in your account. </em>
                    </c:when>
                    <c:when test = "${reachedLimit == 'Yes'}">
                        <em>You have reached your daily transfer limit. </em>
                    </c:when>
                    <c:when test = "${isValidAmount == 'No'}">
                        <em>Amount must be positive. </em>
                    </c:when>
                    <c:when test = "${isTransactionSuccessful == 'Yes'}">
                        <em>Transaction successful! You have transferred ${transferAmount} ${currencyName} to ${targetEmail} </em>
                    </c:when>
                </c:choose>
                <div class="form-group">
                    <label for="email" class="required">Target account:</label>
                    <input
                            id="email"
                            class="form-control"
                            type="email"
                            name="targetEmail"
                            placeholder="Email address of the target account"
                            minlength="3"
                            maxlength="255"
                            required
                    />
                </div>
                <div class="form-group">
                    <label for="amount" class="required">Amount:</label>
                    <input
                            id="amount"
                            class="form-control"
                            type="number"
                            name="transferAmount"
                            placeholder="Amount to be transferred"
                            minlength="1"
                            maxlength="255"
                            required
                    />
                </div>
                <div class="form-group">
                    <label for="currency" class="required">Type of currency:</label>
                    <select id="currency" name="currencyTypeId">
                        <option value="1">EUR</option>
                        <option value="2">USD</option>
                    </select>
                </div>
                <input type=submit value="Transfer Funds" class="btn btn--square">
                <p class="muted">Copyright &copy; 2021</p>
            </form>
        </div>
    </section>
<%--    --%>
<%--    <form action="TransferServlet" method="POST">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    Email of target account :--%>
<%--                <td>--%>
<%--                    <input type=text name="targetEmail" size=20>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    Amount to be transfered:--%>
<%--                <td>--%>
<%--                    <input type=text name=transferAmount size=20>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--            Choose a currency:--%>
<%--            <select name="currencyTypeId">--%>
<%--                <option value="1">EUR</option>--%>
<%--                <option value="2">USD</option>--%>
<%--            </select>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
    <jsp:include page="sideBar.jsp"/>
</div>

<jsp:include page="footer.html"/>
<script src="js/main.js"></script>
</body>
</html>