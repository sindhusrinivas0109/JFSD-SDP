<!-- LawAdmin.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Indian Laws & Constitution</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/lucide-icons@0.8.0/dist/index.js"></script>
    <style>
        /* Custom CSS for form input containers */
        .form-container {
            position: relative;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        .form-container input,
        .form-container textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .form-container input:focus,
        .form-container textarea:focus {
            border-color: #667eea;
            outline: none;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            z-index: -1;
            opacity: 0;
            transition: opacity 0.3s ease;
            border-radius: 8px;
        }

        .form-container:hover::before {
            opacity: 0.1;
        }

        .form-container button {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .form-container button:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
        }
    </style>
</head>
<body class="bg-gradient-to-b from-gray-50 to-gray-100">
<header>
    <!-- Include the Navbar -->
    <jsp:include page="Navbarone.jsp" />
</header>

<!-- Header Section -->
<div class="min-h-screen pt-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="text-center mb-12">
            <h1 class="text-5xl font-extrabold text-gray-900 mb-4">Admin - Indian Laws & Constitution</h1>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Manage Indian laws, acts, and constitutional provisions.
            </p>
        </div>

        <!-- Add Law Form -->
        <div class="mb-8">
            <h2 class="text-2xl font-semibold text-gray-900 mb-4">Add New Law</h2>
            <form id="addLawForm" class="space-y-4">
                <div class="form-container">
                    <label for="category" class="block text-sm font-medium text-gray-700">Category</label>
                    <input type="text" id="category" name="category" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" id="name" name="name" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                    <textarea id="description" name="description" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"></textarea>
                </div>
                <div class="form-container">
                    <label for="url" class="block text-sm font-medium text-gray-700">URL</label>
                    <input type="text" id="url" name="url" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="detailedInfo" class="block text-sm font-medium text-gray-700">Detailed Info</label>
                    <textarea id="detailedInfo" name="detailedInfo" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"></textarea>
                </div>
                <div class="form-container">
                    <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Add Law
                    </button>
                </div>
            </form>
        </div>

        <!-- Update Law Form -->
        <div class="mb-8">
            <h2 class="text-2xl font-semibold text-gray-900 mb-4">Update Law</h2>
            <form id="updateLawForm" class="space-y-4">
                <div class="form-container">
                    <label for="updateId" class="block text-sm font-medium text-gray-700">Law ID</label>
                    <input type="text" id="updateId" name="updateId" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="updateCategory" class="block text-sm font-medium text-gray-700">Category</label>
                    <input type="text" id="updateCategory" name="updateCategory" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="updateName" class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" id="updateName" name="updateName" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="updateDescription" class="block text-sm font-medium text-gray-700">Description</label>
                    <textarea id="updateDescription" name="updateDescription" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"></textarea>
                </div>
                <div class="form-container">
                    <label for="updateUrl" class="block text-sm font-medium text-gray-700">URL</label>
                    <input type="text" id="updateUrl" name="updateUrl" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <label for="updateDetailedInfo" class="block text-sm font-medium text-gray-700">Detailed Info</label>
                    <textarea id="updateDetailedInfo" name="updateDetailedInfo" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"></textarea>
                </div>
                <div class="form-container">
                    <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Update Law
                    </button>
                </div>
            </form>
        </div>

        <!-- Delete Law Form -->
        <div class="mb-8">
            <h2 class="text-2xl font-semibold text-gray-900 mb-4">Delete Law</h2>
            <form id="deleteLawForm" class="space-y-4">
                <div class="form-container">
                    <label for="deleteId" class="block text-sm font-medium text-gray-700">Law ID</label>
                    <input type="text" id="deleteId" name="deleteId" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                </div>
                <div class="form-container">
                    <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                        Delete Law
                    </button>
                </div>
            </form>
        </div>

        <!-- Laws Grid -->
        <div id="lawsGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Dynamically populated laws will go here -->
            <c:forEach var="law" items="${laws}">
                <div class="group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 law-card" data-title="${law.name.toLowerCase()}" data-description="${law.description.toLowerCase()}" data-category="${law.category}">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-4">
                            <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">${law.category}</span>
                            <span class="text-sm font-medium text-gray-700">ID: ${law.id}</span>
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                            </svg>
                        </div>
                        <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">${law.name}</h3>
                        <p class="text-gray-600 text-base mb-4 line-clamp-3">${law.description}</p>
                        <div class="flex items-center justify-between">
                            <a href="/laws/${law.url}" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
                                Read More
                                <svg xmlns="http://www.w3.org/2000/svg" class="ml-1 h-4 w-4 group-hover/link:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path>
                                </svg>
                            </a>
                            <div class="flex items-center text-sm text-gray-500">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                                </svg>
                                <span>5 min read</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- Include the footer -->
<jsp:include page="Footer.jsp" />

<script>
    document.getElementById('addLawForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const law = {
            category: formData.get('category'),
            name: formData.get('name'),
            description: formData.get('description'),
            url: formData.get('url'),
            detailedInfo: formData.get('detailedInfo')
        };
        fetch('/laws', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(law)
        }).then(response => response.json())
          .then(data => {
              alert('Law added successfully!');
              // Optionally, refresh the laws grid
              fetchLaws();
          })
          .catch(error => console.error('Error:', error));
    });

    document.getElementById('updateLawForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const lawId = formData.get('updateId');
        const law = {
            category: formData.get('updateCategory'),
            name: formData.get('updateName'),
            description: formData.get('updateDescription'),
            url: formData.get('updateUrl'),
            detailedInfo: formData.get('updateDetailedInfo')
        };
        fetch(`/laws/${lawId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(law)
        }).then(response => response.json())
          .then(data => {
              alert('Law updated successfully!');
              // Optionally, refresh the laws grid
              fetchLaws();
          })
          .catch(error => console.error('Error:', error));
    });

    document.getElementById('deleteLawForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(event.target);
        const lawId = formData.get('deleteId');
        fetch(`/laws/${lawId}`, {
            method: 'DELETE'
        }).then(response => response.json())
          .then(data => {
              alert('Law deleted successfully!');
              // Optionally, refresh the laws grid
              fetchLaws();
          })
          .catch(error => console.error('Error:', error));
    });

    function fetchLaws() {
        fetch('/laws')
            .then(response => response.json())
            .then(data => {
                const lawsGrid = document.getElementById('lawsGrid');
                lawsGrid.innerHTML = '';
                data.forEach(law => {
                    const lawCard = document.createElement('div');
                    lawCard.className = 'group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 law-card';
                    lawCard.setAttribute('data-title', law.name.toLowerCase());
                    lawCard.setAttribute('data-description', law.description.toLowerCase());
                    lawCard.setAttribute('data-category', law.category);
                    lawCard.innerHTML = `
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-4">
                                <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">${law.category}</span>
                                <span class="text-sm font-medium text-gray-700">ID: ${law.id}</span>
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                                </svg>
                            </div>
                            <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">${law.name}</h3>
                            <p class="text-gray-600 text-base mb-4 line-clamp-3">${law.description}</p>
                            <div class="flex items-center justify-between">
                                <a href="/laws/${law.url}" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
                                    Read More
                                    <svg xmlns="http://www.w3.org/2000/svg" class="ml-1 h-4 w-4 group-hover/link:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path>
                                    </svg>
                                </a>
                                <div class="flex items-center text-sm text-gray-500">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                                    </svg>
                                    <span>5 min read</span>
                                </div>
                            </div>
                        </div>
                    `;
                    lawsGrid.appendChild(lawCard);
                });
            })
            .catch(error => console.error('Error:', error));
    }

    // Initial fetch of laws
    fetchLaws();
</script>
</body>
</html>