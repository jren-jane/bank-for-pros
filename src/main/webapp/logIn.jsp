<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Log in</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <section
            class="form-container form-container--primary form-container--short"
    >
        <form class="form-signin" action="BankingControllerServlet" method="POST">
            <input type="hidden" name="command" value="authenticate" />
            <a href="index.jsp"
            ><svg class="icon icon--dark">
                <use href="images/sprite.svg#online-banking"></use></svg
            ></a>
            <h2>Sign in</h2>
            <p>Welcome back.</p>

            <c:choose>
                <c:when test = "${isCorrectEmail == 'No'}">
                    <em>Account does not exist. </em>
                </c:when>
                <c:when test = "${isCorrectPassword == 'No'}">
                    <em>Wrong password. </em>
                </c:when>
                <c:when test = "${logInSuccessful == 'Yes'}">
                    <c:redirect url="RecentActivityServlet"/>
                </c:when>
            </c:choose>

            <div class="form-group">
                <input
                        class="form-control"
                        type="email"
                        placeholder="Email address"
                        name="email"
                        minlength="1"
                        maxlength="255"
                        autofocus
                />
            </div>
            <div class="form-group">
                <input
                        class="form-control"
                        type="password"
                        placeholder="Password"
                        name="password"
                        minlength="1"
                        maxlength="255"
                />
            </div>
            <input class="btn btn--square" type=submit value="Sign in"/>
            <p>Don't have an account? <a href="createAccount.jsp">Register</a></p>
            <p class="muted">Copyright &copy; 2021</p>
        </form>
    </section>
</body>
</html>