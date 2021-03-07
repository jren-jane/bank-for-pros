<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create foreign currency account</title>
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
                <input type="hidden" name="command" value="createForeignCurrencyAccount" />
                <c:choose>
                    <c:when test = "${existsAccount == 'Yes'}">
                        <em>You foreign currency account already exists. </em>
                    </c:when>
                    <c:when test = "${accountCreated == 'Yes'}">
                        <em>Your foreign currency account is successfully created. </em>
                    </c:when>
                </c:choose>
                <div class="form-group">
                    <label for="currency" class="required"
                    >Select a type of currency account to create:</label
                    >
                    <select id="currency" name="currencyTypeId">
                        <option value="2">USD</option>
                    </select>
                </div>
                <input class="btn btn--square" type=submit value="Create account"/>
                <p class="muted">Copyright &copy; 2021</p>
            </form>
        </div>
    </section>

    <jsp:include page="sideBar.jsp"/>
</div>

<jsp:include page="footer.html"/>

<script src="js/main.js"></script>
</body>
</html>

<%--<html>--%>
<%--<form action="ForeignCurrencyServlet" method="POST">--%>
<%--    Create your foreign currency account:--%>
<%--    <select name="currencyTypeId">--%>
<%--        <option value="2">USD</option>--%>
<%--    </select>--%>
<%--    <button type="submit" class="btn">Create</button>--%>
<%--    --%>


<%--</form>--%>
<%--</html>--%>