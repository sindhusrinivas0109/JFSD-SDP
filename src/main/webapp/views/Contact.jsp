<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom CSS for animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .fade-in {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes slideInLeft {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .slide-in-left {
            animation: slideInLeft 1s ease-in-out;
        }

        @keyframes slideInRight {
            from { transform: translateX(20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        .slide-in-right {
            animation: slideInRight 1s ease-in-out;
        }
    </style>
</head>
<header>
	    <!-- Include the Navbar -->
	    <jsp:include page="Navbarone.jsp" />
    </header>
<body class="min-h-screen bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-12 fade-in">
            <h1 class="text-4xl font-extrabold text-gray-900">Contact Us</h1>
            <p class="mt-4 text-lg text-gray-500">
                Have questions? We'd love to hear from you.
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <div class="bg-white rounded-lg shadow-lg p-8 slide-in-left">
                <form class="space-y-6">
                    <div class="border border-gray-300 rounded-md p-4">
                        <label for="name" class="block text-sm font-medium text-gray-700">
                            Name
                        </label>
                        <input
                            type="text"
                            id="name"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                        />
                    </div>

                    <div class="border border-gray-300 rounded-md p-4">
                        <label for="email" class="block text-sm font-medium text-gray-700">
                            Email
                        </label>
                        <input
                            type="email"
                            id="email"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                        />
                    </div>

                    <div class="border border-gray-300 rounded-md p-4">
                        <label for="message" class="block text-sm font-medium text-gray-700">
                            Message
                        </label>
                        <textarea
                            id="message"
                            rows="4"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                        ></textarea>
                    </div>

                    <button
                        type="submit"
                        class="w-full flex justify-center py-3 px-6 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        Send Message
                    </button>
                </form>
            </div>

            <div class="bg-white rounded-lg shadow-lg p-8 slide-in-right">
                <div class="space-y-8">
                    <div>
                        <h3 class="text-lg font-medium text-gray-900">Contact Information</h3>
                        <div class="mt-4 space-y-4">
                            <div class="flex items-center">
                                <svg class="h-6 w-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                </svg>
                                <span class="ml-3 text-gray-500">support@constitutionalcompass.com</span>
                            </div>
                            <div class="flex items-center">
                                <svg class="h-6 w-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
                                </svg>
                                <span class="ml-3 text-gray-500">+1 (555) 123-4567</span>
                            </div>
                            <div class="flex items-center">
                                <svg class="h-6 w-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                                <span class="ml-3 text-gray-500">123 Legal Street, Law City, LC 12345</span>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h3 class="text-lg font-medium text-gray-900">Office Hours</h3>
                        <div class="mt-4 text-gray-500">
                            <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                            <p>Saturday: 10:00 AM - 2:00 PM</p>
                            <p>Sunday: Closed</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <!-- Include the footer -->
    <jsp:include page="Footer.jsp" />
    
    
</body>
</html>