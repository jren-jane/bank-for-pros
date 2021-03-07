<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="nav collapsible">
        <div>
            <a class="nav__brand" href="index.jsp"
            ><svg class="icon icon--dark">
                <use href="images/sprite.svg#online-banking"></use>
            </svg>
                <div class="icon-textgroup">
                    <span class="icon-text">iBank</span>
                    <span class="icon-text">for everyone</span>
                </div>
            </a>
        </div>
        <svg class="icon icon--dark nav__toggler">
            <use xlink:href="images/sprite.svg#menu"></use>
        </svg>
        <ul class="list nav__list collapsible__content">
            <li class="nav__item"><a href="RecentActivityServlet">My account</a></li>
            <li class="nav__item nav__item-right-border">
                <a href="products.jsp">Products</a>
            </li>
            <c:choose>
                <c:when test = "${display == 'logInButton'}">
                    <li class="nav__item">
                        <a href="logIn.jsp">Log in</a>
                    </li>
                    <li class="nav__item">
                        <a href="createAccount.jsp" class="btn btn--square btn--primary btn--block"
                        >Register</a
                        >
                    </li>
                </c:when>
                <c:when test = "${display == 'username'}">
                    <li class="nav__item">
                        Hello, ${username}
                    </li>
                    <li class="nav__item">
                        <a href="LogOutServlet" class="btn btn--square btn--primary btn--block"
                        >Log out</a
                        >
                    </li>
                </c:when>
            </c:choose>
        </ul>
    </nav>
</header>
