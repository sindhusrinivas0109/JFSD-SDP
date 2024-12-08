<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription Confirmation</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <header>
	    <!-- Include the Navbar -->
	    <jsp:include page="Navbarone.jsp" />
    </header>

    <main class="hero">
        <h1>Thank You for Subscribing!</h1>
        <p>You will now receive the latest updates, articles, and resources in your inbox.</p>
        <div class="hero-buttons">
            <a href="/home" class="btn-primary1">Back to Home</a>
        </div>
    </main>

    <!-- Include the footer -->
    <jsp:include page="Footer.jsp" />
    
</body>
</html>