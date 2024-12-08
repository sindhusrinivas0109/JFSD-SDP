<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - Constitutional Compass</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        body {
            background-image: url('https://wallpaperaccess.com/full/702858.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .fade-in {
            animation: fadeIn 1.5s ease-in-out;
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

        .focus-ring {
            outline: none;
            box-shadow: 0 0 5px rgba(255, 215, 0, 0.7);
        }

        .law-btn {
            background-color: #003366;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 16px;
            text-transform: uppercase;
        }

        .law-btn:hover {
            background-color: #00509d;
        }

        .header-text {
            font-family: 'Georgia', serif;
            font-weight: bold;
            color: #fffffff;
        }

        .input-container {
            margin-bottom: 10px;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-800 bg-opacity-70 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
    <div class="absolute top-4 left-4 text-white text-4xl font-bold header-text">
        Constitutional Compass
    </div>

    <div class="sm:mx-auto sm:w-full sm:max-w-md fade-in">
        <div class="bg-opacity-90 bg-gray-900 py-6 px-4 rounded-lg shadow-md">
            <div class="flex justify-center mb-6">
                <svg class="h-12 w-12 text-yellow-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 12l18-6v12z"></path>
                    <path d="M3 12h18"></path>
                </svg>
            </div>
            <h2 class="text-center text-3xl font-extrabold text-white">Create a new account</h2>
            <p class="mt-2 text-center text-sm text-gray-200">
                Already have an account?
                <a href="/Login" class="font-medium text-blue-300 hover:text-blue-200">
                    Sign in here
                </a>
            </p>
        </div>
    </div>

    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md fade-in">
        <div class="bg-white bg-opacity-80 py-8 px-4 shadow sm:rounded-lg sm:px-10">
            <form id="signup-form" action="/signup" method="post" class="space-y-6" enctype="multipart/form-data">
                <div class="input-container">
                    <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                    <div class="mt-1">
                        <input
                            type="text"
                            id="name"
                            name="name"
                            required
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:ring-blue-500 focus:border-blue-500 focus-ring"
                        />
                    </div>
                </div>

                <div class="input-container">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
                    <div class="mt-1">
                        <input
                            type="email"
                            id="email"
                            name="email"
                            required
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:ring-blue-500 focus:border-blue-500 focus-ring"
                        />
                    </div>
                </div>

                <div class="input-container">
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <div class="mt-1">
                        <input
                            type="password"
                            id="password"
                            name="password"
                            required
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:ring-blue-500 focus:border-blue-500 focus-ring"
                        />
                    </div>
                </div>

                <div class="input-container">
                    <label for="confirm-password" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                    <div class="mt-1">
                        <input
                            type="password"
                            id="confirm-password"
                            name="confirm-password"
                            required
                            class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:ring-blue-500 focus:border-blue-500 focus-ring"
                        />
                    </div>
                </div>

                <div>
                    <button
                        type="submit"
                        class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 law-btn"
                    >
                        Create Account
                    </button>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>