<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>iBank - Easy transaction and financial management</title>
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
<jsp:include page="header.jsp"/>
<section>
    <picture class="hero__image-container--frontpage"></picture>
    <header class="hero__heading-container--frontpage">
        <h1
                data-aos="fade-right"
                class="heading-white block__header hero__content"
        >
            Banking made simple
        </h1>
        <p
                data-aos="fade-right"
                class="tagline heading-white block__header hero__content"
        >
            Handle transactions and financial management for you
        </p>
    </header>
</section>

<script src="js/main.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
