<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>iBank - Be your tailored financial manager</title>
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
<section class="block block--dark block--skewed-left hero hero--clip">
    <div class="container grid grid--1x2-even">
        <header class="block__header hero__content">
            <h1 data-aos="fade-right" class="block__heading">Invest for you</h1>
            <p class="hero__tagline">
                Choose a product that suits you best and get the most out of your
                savings.
            </p>
            <a href="" class="btn btn--round btn--secondary btn--stretched"
            >Get Started</a
            >
        </header>
        <picture data-aos="zoom-in">
            <img class="hero__image" src="images/wallet.svg" alt="" />
        </picture>
    </div>
</section>
<section data-aos="fade-up" class="block container block-domain">
    <header class="block__header">
        <h2>Invest from as little as 50 Euros</h2>
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti,
            exercitationem?
        </p>
    </header>
    <div class="input-group">
        <input
                type="text"
                class="input"
                placeholder="Enter domain name here..."
        />
        <button class="btn btn--secondary btn--round">
            <svg class="icon icon--white">
                <use href="images/sprite.svg#search"></use></svg>Search
        </button>
    </div>
    <ul class="list block-domain__prices">
        <li><span class="badge badge--secondary">ETF</span></li>
        <li>LOF</li>
        <li>MMF</li>
        <li>ETN</li>
    </ul>
</section>
<section data-aos="fade-up" class="block container block-plans">
    <div class="grid grid--1x3-even">
        <div class="plan">
            <div class="card card--secondary">
                <header class="card__header">
                    <h3 class="plan__name">Short term</h3>
                    <span class="plan__price">X plan</span>
                    <span class="badge badge--secondary badge--small"
                    >+10% for the 1st month</span
                    >
                    <span class="plan__description">Monthly renewal</span>
                </header>
                <div class="card__body">
                    <ul class="list list--tick">
                        <li class="list__item">Flexible Withdrawal</li>
                        <li class="list__item">Start from 100 Euros</li>
                        <li class="list__item">Low Risk</li>
                        <li class="list__item">3% Annual Return</li>
                    </ul>
                    <button
                            class="btn btn--round btn--outline-dark btn--block-stretched"
                    >
                        Subscribe Now
                    </button>
                </div>
            </div>
        </div>
        <div class="plan plan--popular">
            <div class="card card--primary">
                <header class="card__header">
                    <h3 class="plan__name">Medium term</h3>
                    <span class="plan__price">Y plan</span>
                    <span class="badge badge--primary badge--small"
                    >+20% for the 1st month</span
                    >
                    <span class="plan__description">Quarterly renewal</span>
                </header>
                <div class="card__body">
                    <ul class="list list--tick">
                        <li class="list__item">Relatively Flexible Withdrawal</li>
                        <li class="list__item">Start from 50 Euros</li>
                        <li class="list__item">Low Risk</li>
                        <li class="list__item">4% Annual Return</li>
                    </ul>
                    <button
                            class="btn btn--round btn--outline-dark btn--block-stretched"
                    >
                        Subscribe Now
                    </button>
                </div>
            </div>
        </div>
        <div class="plan">
            <div class="card card--secondary">
                <header class="card__header">
                    <h3 class="plan__name">Long term</h3>
                    <span class="plan__price">Z plan</span>
                    <span class="badge badge--secondary badge--small"
                    >+10% for the 1st month</span
                    >
                    <span class="plan__description">Yearly renewal</span>
                </header>
                <div class="card__body">
                    <ul class="list list--tick">
                        <li class="list__item">High Yield</li>
                        <li class="list__item">Start from 100 Euros</li>
                        <li class="list__item">Medium to Low Risk</li>
                        <li class="list__item">5.5% Annual Return</li>
                    </ul>
                    <button
                            class="btn btn--round btn--outline-dark btn--block-stretched"
                    >
                        Subscribe Now
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="block container">
    <header class="block__header">
        <h2>Enjoy our trustworthy services</h2>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed,
            voluptatem.
        </p>
    </header>
    <article class="grid grid--1x2-even feature">
        <div class="feature__content" data-aos="fade-right">
          <span class="icon-container">
            <svg class="icon icon--primary">
              <use href="images/sprite.svg#guarantee"></use>
            </svg>
          </span>
            <h3 class="feature__heading">Fund Guaranteed by Third Party</h3>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam
                obcaecati vel ad unde est illo at. Labore excepturi officia dolores!
            </p>
            <a href="#" class="link-arrow">Learn More</a>
        </div>
        <picture data-aos="zoom-in-left">
            <source
                    type="image/webp"
                    srcset="images/contract@1x.webp 1x, images/contract@2x.webp 2x"
            />
            <source
                    type="image/jpg"
                    srcset="images/contract@1x.jpg 1x, images/contract@2x.jpg 2x"
            />
            <img class="feature__image" src="images/contract@2x.jpg" alt="" />
        </picture>
    </article>
    <article class="grid grid--1x2-even feature">
        <div class="feature__content">
          <span class="icon-container">
            <svg class="icon icon--primary">
              <use href="images/sprite.svg#computer"></use>
            </svg>
          </span>
            <h3 class="feature__heading">Fast Purchase and Withdrwal</h3>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam
                obcaecati vel ad unde est illo at. Labore excepturi officia dolores!
            </p>
            <a href="#" class="link-arrow">Learn More</a>
        </div>
        <picture>
            <source
                    type="image/webp"
                    srcset="
              images/transaction@1x.webp 1x,
              images/transaction@2x.webp 2x
            "
            />
            <source
                    type="image/jpg"
                    srcset="images/transaction@1x.jpg 1x, images/transaction@2x.jpg 2x"
            />
            <img class="feature__image" src="images/transaction@2x.jpg" alt="" />
        </picture>
    </article>
    <article class="grid grid--1x2-even feature">
        <div class="feature__content">
          <span class="icon-container">
            <svg class="icon icon--primary">
              <use href="images/sprite.svg#wordpress"></use>
            </svg>
          </span>
            <h3 class="feature__heading">Clear Visualization of Return</h3>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam
                obcaecati vel ad unde est illo at. Labore excepturi officia dolores!
            </p>
            <a href="#" class="link-arrow">Learn More</a>
        </div>
        <picture>
            <source
                    type="image/webp"
                    srcset="images/report@1x.webp 1x, images/report@2x.webp 2x"
            />
            <source
                    type="image/jpg"
                    srcset="images/transaction@1x.jpg 1x, images/transaction@2x.jpg 2x"
            />
            <img class="feature__image" src="images/transaction@2x.jpg" alt="" />
        </picture>
    </article>
    <article class="grid grid--1x2-even feature">
        <div class="feature__content">
          <span class="icon-container">
            <svg class="icon icon--primary">
              <use href="images/sprite.svg#clock"></use>
            </svg>
          </span>
            <h3 class="feature__heading">24/7 Customer Support</h3>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Quam
                obcaecati vel ad unde est illo at. Labore excepturi officia dolores!
            </p>
            <a href="#" class="link-arrow">Learn More</a>
        </div>
        <picture>
            <source
                    type="image/webp"
                    srcset="
              images/customer-support@1x.webp 1x,
              images/customer-support@2x.webp 2x
            "
            />
            <source
                    type="image/jpg"
                    srcset="
              images/customer-support@1x.jpg 1x,
              images/customer-support@2x.jpg 2x
            "
            />
            <img
                    class="feature__image"
                    src="images/customer-support@2x.jpg"
                    alt=""
            />
        </picture>
    </article>
</section>

<div class="container">
    <div class="callout callout--primary callout-signup">
        <div class="grid grid--1x2-even">
            <div class="callout__content">
                <h2 class="callout__heading">Ready to Get Started?</h2>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi
                    voluptate tempora qui distinctio consequatur aliquid pariatur
                    cupiditate quas cum fugit.
                </p>
            </div>
            <a href="#" class="btn btn--round btn--secondary btn--stretched"
            >Get Started</a
            >
        </div>
    </div>
</div>

<footer class="footer footer--tall">
    <div class="container grid footer__sections">
        <a href="#">About us</a>
        <a href="#">Contact us</a>
        <a href="#">FAQ</a>
    </div>
</footer>

<script src="js/main.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
