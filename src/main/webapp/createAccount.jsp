<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create account</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<body>
<div class="grid grid--1x2">
    <section class="hero--register">
        <h2 data-aos="zoom-in-left" class="heading-white">Financial freedom starts here</h2>
        <p data-aos="zoom-in-left" class="tagline--register heading-white">
            Join another 10,000 happy users
        </p>
    </section>

    <section
            class="form-container form-container--primary form-container--short"
    >
        <form class="form-register" action="BankingControllerServlet" method="POST">
            <input type="hidden" name="command" value="createAccount" />
            <h2>Join iBank</h2>
            <c:choose>
                <c:when test = "${emailExists == 'Yes'}">
                    <em>Account already exists. </em>
                </c:when>
                <c:when test = "${passwordsMatch == 'No'}">
                    <em>Passwords do not match. </em>
                </c:when>
                <c:when test = "${accountCreated == 'Yes'}">
                    <c:redirect url="my-account.jsp"/>
                </c:when>
            </c:choose>

            <div class="flex-display">
                <div class="form-group form-group--small">
                    <label for="first-name">First name:</label>
                    <input
                            id="first-name"
                            class="form-control"
                            type="text"
                            name="firstName"
                            minlength="1"
                            maxlength="255"
                            autofocus
                    />
                </div>
                <div class="form-group form-group--small">
                    <label for="last-name">Last name:</label>
                    <input
                            id="last-name"
                            class="form-control"
                            type="text"
                            name="lastName"
                            minlength="1"
                            maxlength="255"
                    />
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="required">Email:</label>
                <input
                        id="email"
                        class="form-control"
                        type="email"
                        name="email"
                        minlength="1"
                        maxlength="255"
                        required
                />
            </div>
            <div class="form-group">
                <label for="username" class="required">Username:</label>
                <input
                        id="username"
                        class="form-control"
                        type="text"
                        name="username"
                        minlength="1"
                        maxlength="255"
                        required
                />
            </div>
            <div class="form-group">
                <label for="password" class="required">Password:</label>
                <input
                        id="password"
                        class="form-control"
                        type="password"
                        name="password"
                        minlength="4"
                        maxlength="255"
                        required
                />
            </div>
            <div class="form-group">
                <label for="confirm-password" class="required"
                >Confirm password:</label
                >
                <input
                        id="confirm-password"
                        class="form-control"
                        type="password"
                        name="confirmPassword"
                        minlength="4"
                        maxlength="255"
                        required
                />
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <textarea
                        id="address"
                        class="form-control"
                        type="text"
                        minlength="5"
                        maxlength="255"
                ></textarea>
            </div>
            <div class="flex-display">
                <div class="form-group form-group--small">
                    <label for="city">City:</label>
                    <input
                            id="city"
                            class="form-control"
                            type="text"
                            name="city"
                            minlength="1"
                            maxlength="255"
                    />
                </div>
                <div class="form-group form-group--small">
                    <label for="zip-code">Zip code:</label>
                    <input
                            id="zip-code"
                            class="form-control"
                            type="text"
                            name="zipCode"
                            minlength="5"
                            maxlength="255"
                    />
                </div>
            </div>
            <div class="form-group">
                <label for="phone">Phone number:</label>
                <input
                        id="phone"
                        class="form-control"
                        type="tel"
                        name="phone"
                        minlength="5"
                        maxlength="255"
                />
            </div>
            <input class="btn btn--square" type=submit value="Join"/>
            <p class="muted">Copyright &copy; 2021</p>
            <p>Already have an account? <a href=index.jsp>Log in</a></p>
        </form>
    </section>
</div>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
