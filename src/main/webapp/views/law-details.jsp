<!-- law-details.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${law.name} - Detailed Information</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/lucide-icons@0.8.0/dist/index.js"></script>
</head>
<body class="bg-gradient-to-b from-gray-50 to-gray-100">
    <header>
        <nav class="navbar">
            <div class="navbar-brand">
                <i class="fas fa-book-open"></i> Constitution Compass
            </div>            
        </nav>
    </header>

    <!-- Law Details Section -->
    <div class="min-h-screen pt-20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            <div class="text-center mb-12">
                <h1 class="text-5xl font-extrabold text-gray-900 mb-4">${law.name}</h1>
                <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                    ${law.description}
                </p>
            </div>

            <!-- Detailed Information -->
            <div class="bg-white rounded-xl shadow-lg p-6">
                <h2 class="text-3xl font-semibold text-gray-900 mb-4">Detailed Information</h2>
                <p class="text-gray-600 text-base mb-4">
                    ${law.detailedInfo}
                </p>
                <p class="text-gray-600 text-base mb-4">
                    <strong>Category:</strong> ${law.category}<br>
                    <strong>URL:</strong> ${law.url}
                </p>
            </div>
        </div>
    </div>

    <!-- Include the footer -->
    <jsp:include page="Footer.jsp" />
</body>
</html>