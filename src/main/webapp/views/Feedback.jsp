<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Form</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <script src="https://cdn.jsdelivr.net/npm/lucide-static@0.1.1/umd/lucide.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
        }
        .form-container {
            width: 80%;
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .form-container h2 {
            margin-bottom: 1rem;
        }
        .form-container p {
            margin-bottom: 2rem;
        }
        .form-container label {
            display: block;
            margin-bottom: 0.5rem;
        }
        .form-container input, .form-container textarea {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 0.25rem;
            background-color: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        .form-container input:focus, .form-container textarea:focus {
            border-color: #3490dc;
            box-shadow: 0 0 0 3px rgba(52, 144, 220, 0.25);
        }
        .form-container button {
            width: 100%;
            padding: 0.75rem;
            background-color: #3490dc;
            color: white;
            border: none;
            border-radius: 0.25rem;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.2s;
        }
        .form-container button:hover {
            background-color: #2779bd;
            transform: translateY(-2px);
        }
        .form-container .rating-error {
            color: #e53e3e;
            margin-top: 0.5rem;
        }
        .form-container .star-label {
            font-size: 2rem; /* Increase the font size for the stars */
            transition: color 0.2s;
        }
        .form-container .star-label:hover {
            color: #ffc107;
        }
        .feedback-entry {
            margin-bottom: 1rem;
            padding: 1rem;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            background-color: #f9fafb;
        }
        .feedback-entry h3 {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }
        .feedback-entry p {
            margin-bottom: 0.5rem;
        }
        .feedback-entry .rating {
            color: #ffc107;
            font-size: 1.5rem;
        }
    </style>
</head>
<body class="bg-gray-100">
<header>
    <!-- Include the Navbar -->
    <jsp:include page="Navbarone.jsp" />
</header>
<div class="container mx-auto p-6">
    <%-- Feedback Form Container --%>
    <div class="form-container">
        <%-- Feedback Introduction --%>
        <div class="text-center">
            <h2 class="text-2xl font-semibold text-gray-800">Your Feedback Matters</h2>
            <p class="text-gray-600">Help us improve Constitutional Compass by sharing your thoughts and experiences. Your feedback is invaluable in our mission to make constitutional knowledge more accessible and engaging.</p>
        </div>

        <%-- Feedback Form --%>
        <form id="feedbackForm" class="form-grid space-y-6" action="/feedback" method="post">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <input type="text" id="name" name="name" required placeholder="Enter your name" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all bg-white/50 backdrop-blur-sm">
            </div>

            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all bg-white/50 backdrop-blur-sm">
            </div>

            <div>
                <label for="subject" class="block text-sm font-medium text-gray-700">Subject</label>
                <input type="text" id="subject" name="subject" required placeholder="What's this feedback about?" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all bg-white/50 backdrop-blur-sm">
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700">Rating</label>
                <div class="flex items-center">
                    <input type="radio" id="star1" name="rating" value="1" class="hidden" onclick="setRating(1)">
                    <label for="star1" class="cursor-pointer text-gray-400 hover:text-yellow-500 star-label">★</label>
                    <input type="radio" id="star2" name="rating" value="2" class="hidden" onclick="setRating(2)">
                    <label for="star2" class="cursor-pointer text-gray-400 hover:text-yellow-500 star-label">★</label>
                    <input type="radio" id="star3" name="rating" value="3" class="hidden" onclick="setRating(3)">
                    <label for="star3" class="cursor-pointer text-gray-400 hover:text-yellow-500 star-label">★</label>
                    <input type="radio" id="star4" name="rating" value="4" class="hidden" onclick="setRating(4)">
                    <label for="star4" class="cursor-pointer text-gray-400 hover:text-yellow-500 star-label">★</label>
                    <input type="radio" id="star5" name="rating" value="5" class="hidden" onclick="setRating(5)">
                    <label for="star5" class="cursor-pointer text-gray-400 hover:text-yellow-500 star-label">★</label>
                </div>
                <div id="ratingError" class="rating-error hidden">Please select a rating</div>
            </div>

            <div class="col-span-2">
                <label for="feedback" class="block text-sm font-medium text-gray-700">Your Feedback</label>
                <textarea id="feedback" name="feedback" required rows="4" placeholder="Share your thoughts and suggestions..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all bg-white/50 backdrop-blur-sm resize-none"></textarea>
            </div>

            <button type="submit" class="col-span-2 w-full flex items-center justify-center gap-2 bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-all duration-200 font-medium transform hover:scale-[1.02] active:scale-[0.98]">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg>
                Submit Feedback
            </button>
        </form>
    </div>

    <%-- User Feedback Section --%>
    <div class="mt-8">
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">User Feedback</h2>
        <div id="userFeedback" class="space-y-4">
            <c:forEach var="feedback" items="${feedbackList}">
                <div class="feedback-entry">
                    <h3 class="text-lg font-semibold">${feedback.name}</h3>
                    <p class="text-gray-600">${feedback.feedback}</p>
                    <div class="rating">
                        ${fn:substring("★★★★★", 0, feedback.rating)}${fn:substring("☆☆☆☆☆", 0, 5 - feedback.rating)}
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Include the footer -->
<jsp:include page="Footer.jsp" />

<script>
    let rating = 0;

    function setRating(value) {
        rating = value;
        const stars = document.querySelectorAll('input[name="rating"] + label');
        stars.forEach((star, index) => {
            if (index < value) {
                star.classList.add('text-yellow-500');
            } else {
                star.classList.remove('text-yellow-500');
            }
        });
        document.getElementById('ratingError').classList.add('hidden');
    }
</script>
</body>
</html>