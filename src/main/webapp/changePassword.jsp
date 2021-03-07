<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Change password</title>
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
                <div class="bundle active">
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
        <div class="form-container form-container--long">
            <form
                    class="form-register"
                    action="BankingControllerServlet"
                    method="POST"
            >
                <input type="hidden" name="command" value="changePassword" />

                <c:choose>
                    <c:when test = "${samePassword == 'Yes'}">
                        <em>The new password is the same as the old one. </em>
                    </c:when>
                    <c:when test = "${oldPasswordCorrect == 'No'}">
                        <em>The old password entered is not correct. </em>
                    </c:when>
                    <c:when test = "${newPasswordsMatch == 'No'}">
                        <em>Passwords do not match. </em>
                    </c:when>
                    <c:when test = "${passwordChanged == 'Yes'}">
                        <em>Password successfully changed. </em>
                    </c:when>
                </c:choose>

                <div class="form-group">
                    <label for="old-password" class="required">Old password:</label>
                    <input
                            id="old-password"
                            class="form-control"
                            type="password"
                            name="oldPassword"
                            minlength="4"
                            maxlength="255"
                            required
                    />
                </div>
                <div class="form-group">
                    <label for="new-password" class="required">New password:</label>
                    <input
                            id="new-password"
                            class="form-control"
                            type="password"
                            name="newPassword"
                            minlength="4"
                            maxlength="255"
                            required
                    />
                </div>
                <div class="form-group">
                    <label for="confirm-new-password" class="required"
                    >Confirm password:</label
                    >
                    <input
                            id="confirm-new-password"
                            class="form-control"
                            type="password"
                            name="confirmNewPassword"
                            minlength="4"
                            maxlength="255"
                            required
                    />
                </div>
                <button type="submit" class="btn">Submit change</button>
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

