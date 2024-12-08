<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Constitution Compass</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <header>
        <!-- Include the Navbar -->
    <jsp:include page="Navbar.jsp" />
    </header>

    <main class="hero">
        <h1>Understand Your Rights,<br><span class="highlight">Empower Your Future</span></h1>
        <p>Your comprehensive guide to understanding the Indian Constitution and laws. Access expert insights, educational resources, and stay informed.</p>
        <div class="hero-buttons">
            <a href="/laws" class="btn-primary1"><i class="fas fa-gavel"></i> Explore Laws</a>
        </div>
    </main>

    <section class="user-role">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:choose>
        <c:when test="${sessionScope.userRole eq 'admin'}">
            <p>Welcome, Admin!</p>
        </c:when>
        <c:when test="${sessionScope.userRole eq 'user'}">
            <p>Welcome, User!</p>
        </c:when>
        <c:otherwise>
            <p>Welcome, Guest!</p>
        </c:otherwise>
    </c:choose>
</section>

    <section class="featured-content">
        <h2>Featured Content</h2>
        <div class="featured-items">
            <div class="featured-item">
                <img src="https://images.unsplash.com/photo-1526304640581-d334cdbbf45e" alt="Featured Law">
                <h3>Understanding Article 14</h3>
                <p>Learn about the Right to Equality under the Indian Constitution.</p>
                <a href="https://example.com/pdfs/article14.pdf" class="btn-secondary" target="_blank">Read More</a>
            </div>
            <div class="featured-item">
                <img src="https://images.unsplash.com/photo-1507842217343-583bb7270b66" alt="Featured Book">
                <h3>Book: The Constitution of India</h3>
                <p>A comprehensive guide to the Indian Constitution by Dr. B.R. Ambedkar.</p>
                <a href="https://example.com/pdfs/constitution-india.pdf" class="btn-secondary" target="_blank">Read More</a>
            </div>
            <div class="featured-item">
                <img src="https://images.unsplash.com/photo-1519389950473-47ba0277781c" alt="Featured Video">
                <h3>Video: Fundamental Rights Explained</h3>
                <p>Watch this video to understand the fundamental rights guaranteed by the Indian Constitution.</p>
                <a href="https://www.youtube.com/watch?v=exampleVideoId" class="btn-secondary" target="_blank">Watch Now</a>
            </div>
        </div>
    </section>

    <section class="testimonials">
        <h2>What Our Users Say</h2>
        <div class="testimonial-items">
            <div class="testimonial-item">
                <p>"Constitution Compass has been an invaluable resource for me. The content is well-researched and easy to understand."</p>
                <span>- John Doe</span>
            </div>
            <div class="testimonial-item">
                <p>"I love how this platform makes complex legal concepts accessible. Highly recommended!"</p>
                <span>- Jane Smith</span>
            </div>
        </div>
    </section>

    <section class="newsletter">
        <h2>Stay Updated</h2>
        <p>Subscribe to our newsletter for the latest updates, articles, and resources.</p>
        <form action="/Sub" method="post">
            <input type="email" name="email" placeholder="Enter your email" required>
            <button type="submit" class="btn-primary1">Subscribe</button>
        </form>
    </section>

    <section class="social-media">
        <h2>Follow Us</h2>
        <div class="social-icons">
            <a href="https://facebook.com/constitutioncompass" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://twitter.com/constitutioncompass" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://instagram.com/constitutioncompass" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://linkedin.com/company/constitutioncompass" target="_blank"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </section>

    <section class="faq">
        <h2>Frequently Asked Questions</h2>
        <div class="faq-items">
            <div class="faq-item">
                <h3>What is Constitution Compass?</h3>
                <p>Constitution Compass is a platform dedicated to helping users understand the Indian Constitution and related laws through expert insights and educational resources.</p>
            </div>
            <div class="faq-item">
                <h3>How can I access the content?</h3>
                <p>You can access the content by creating a free account on our platform. Once registered, you can explore laws, books, videos, and more.</p>
            </div>
            <div class="faq-item">
                <h3>Is the content free?</h3>
                <p>Yes, most of the content is free to access. However, some premium resources may require a subscription.</p>
            </div>
        </div>
    </section>

    <section class="cta">
        <h2>Ready to Dive In?</h2>
        <p>Start exploring the Indian Constitution and laws today!</p>
        <a href="/laws" class="btn-primary2"><i class="fas fa-rocket"></i> Get Started </a>
    </section>
    
   <!-- Admin Actions Button (Visible only to admins) -->
        <c:if test="${sessionScope.userRole eq 'admin'}">
            <div class="center-button">
                <a href="/users" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
                    See All Users
                </a>
            </div>
        </c:if>

   <!-- Include the footer only if the user is authenticated -->
<sec:authorize access="isAuthenticated()">
    <jsp:include page="Footer.jsp" />
</sec:authorize>
	

    <script>
        // JavaScript to handle the dropdown functionality
        document.addEventListener('DOMContentLoaded', function() {
            const profileLink = document.querySelector('.profile-link');
            const dropdown = document.querySelector('.dropdown');

            profileLink.addEventListener('click', function(event) {
                event.preventDefault();
                dropdown.classList.toggle('show');
            });

            // Close the dropdown if the user clicks outside of it
            window.addEventListener('click', function(event) {
                if (!event.target.matches('.profile-link')) {
                    if (dropdown.classList.contains('show')) {
                        dropdown.classList.remove('show');
                    }
                }
            });
        });
    </script>
</body>
</html>