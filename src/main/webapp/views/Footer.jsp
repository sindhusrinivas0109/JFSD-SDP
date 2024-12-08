<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    
<!-- Footer Section -->
<footer class="bg-gray-800 text-white py-8 mt-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <!-- Social Media Handles -->
            <div class="flex flex-col items-center md:items-start">
                <h3 class="text-lg font-semibold mb-4">Follow Us</h3>
                <div class="flex space-x-4">
                    <a href="https://www.facebook.com/constitutioncompass" target="_blank" class="text-gray-400 hover:text-white">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 2C6.477 2 2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.879V14.89h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.989C18.343 21.129 22 16.99 22 12c0-5.523-4.477-10-10-10z"></path>
                        </svg>
                    </a>
                    <a href="https://twitter.com/constitutioncomp" target="_blank" class="text-gray-400 hover:text-white">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M22.46 6c-.77.35-1.6.58-2.46.69.88-.53 1.56-1.37 1.88-2.38-.83.5-1.75.85-2.72 1.05C18.37 4.5 17.26 4 16 4c-2.35 0-4.27 1.92-4.27 4.29 0 .34.04.67.11.98C8.28 9.09 5.11 7.38 3 4.79c-.37.63-.58 1.37-.58 2.15 0 1.49.75 2.81 1.91 3.56-.71 0-1.37-.2-1.95-.5v.03c0 2.08 1.48 3.82 3.44 4.21a4.22 4.22 0 0 1-1.93.07 4.28 4.28 0 0 0 4.07 3.01 8.521 8.521 0 0 1-5.33 1.84c-.34 0-.68-.02-1.02-.06C3.44 20.29 5.7 21 8.12 21 16 21 20.33 14.46 20.33 8.79c0-.19 0-.37-.01-.56.84-.6 1.56-1.36 2.14-2.23z"></path>
                        </svg>
                    </a>
                    <a href="https://www.instagram.com/constitutioncompass" target="_blank" class="text-gray-400 hover:text-white">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M7.8 2h8.4C19.4 2 22 4.6 22 7.8v8.4a5.8 5.8 0 0 1-5.8 5.8H7.8C4.6 22 2 19.4 2 16.2V7.8A5.8 5.8 0 0 1 7.8 2m-.2 2A3.6 3.6 0 0 0 4 7.6v8.8C4 18.39 5.61 20 7.6 20h8.8a3.6 3.6 0 0 0 3.6-3.6V7.6C20 5.61 18.39 4 16.4 4H7.6m9.65 1.5a1.25 1.25 0 0 1 1.25 1.25A1.25 1.25 0 0 1 17.25 8 1.25 1.25 0 0 1 16 6.75a1.25 1.25 0 0 1 1.25-1.25M12 7a5 5 0 0 1 5 5 5 5 0 0 1-5 5 5 5 0 0 1-5-5 5 5 0 0 1 5-5m0 2a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3z"></path>
                        </svg>
                    </a>
                    <a href="https://www.linkedin.com/company/constitutioncompass" target="_blank" class="text-gray-400 hover:text-white">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"></path>
                        </svg>
                    </a>
                </div>
            </div>

            <!-- Redirecting Pages -->
            <div class="flex flex-col items-center md:items-start">
                <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
                <ul class="space-y-2">
                	<li><a href="/home" class="text-gray-400 hover:text-white">Home</a></li>
                    <li><a href="/About" class="text-gray-400 hover:text-white">About Us</a></li>
                    <li><a href="/Contact" class="text-gray-400 hover:text-white">Contact Us</a></li>
                    <li><a href="/feedback" class="text-gray-400 hover:text-white">Feedback</a></li>
                    <li><a href="/terms-of-service" class="text-gray-400 hover:text-white">Terms of Service</a></li>
                </ul>
            </div>

            <!-- About Constitution Compass -->
            <div class="flex flex-col items-center md:items-start">
                <h3 class="text-lg font-semibold mb-4">About Constitution Compass</h3>
                <p class="text-gray-400 text-center md:text-left">
                    Constitution Compass is a comprehensive resource for understanding Indian laws and constitutional provisions. Our mission is to provide accurate, up-to-date information to help you navigate the complexities of the Indian legal system.
                </p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>