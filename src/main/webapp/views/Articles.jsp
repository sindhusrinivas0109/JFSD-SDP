<!-- articles.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Constitution Articles</title>
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

<!-- Header Section -->
<div class="min-h-screen pt-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="text-center mb-12">
            <h1 class="text-5xl font-extrabold text-gray-900 mb-4">Indian Constitution Articles</h1>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                Explore comprehensive information about the articles in the Indian Constitution.
            </p>
        </div>

        <!-- Search Bar -->
        <div class="max-w-xl mx-auto mb-8">
            <div class="relative">
                <svg xmlns="http://www.w3.org/2000/svg" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16a5 5 0 100-10 5 5 0 000 10zm0 0l5 5m-5-5h.01"></path>
                </svg>
                <input
                    type="text"
                    id="searchQuery"
                    placeholder="Search articles..."
                    class="w-full pl-10 pr-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent shadow-sm"
                    onkeyup="filterArticles()"
                />
            </div>
        </div>

        <!-- Category Filter -->
        <div class="flex flex-wrap justify-center gap-2 mb-12">
            <button id="all" class="px-4 py-2 rounded-full transition-all duration-200 bg-blue-600 text-white shadow-lg scale-105" onclick="filterByCategory('all')">All</button>
            <button id="FundamentalRights" class="px-4 py-2 rounded-full transition-all duration-200 bg-white text-gray-700 hover:bg-gray-50 shadow-md" onclick="filterByCategory('FundamentalRights')">Fundamental Rights</button>
            <button id="DirectivePrinciples" class="px-4 py-2 rounded-full transition-all duration-200 bg-white text-gray-700 hover:bg-gray-50 shadow-md" onclick="filterByCategory('DirectivePrinciples')">Directive Principles</button>
            <button id="UnionTerritories" class="px-4 py-2 rounded-full transition-all duration-200 bg-white text-gray-700 hover:bg-gray-50 shadow-md" onclick="filterByCategory('UnionTerritories')">Union Territories</button>
            <button id="EmergencyProvisions" class="px-4 py-2 rounded-full transition-all duration-200 bg-white text-gray-700 hover:bg-gray-50 shadow-md" onclick="filterByCategory('EmergencyProvisions')">Emergency Provisions</button>
            <button id="Amendments" class="px-4 py-2 rounded-full transition-all duration-200 bg-white text-gray-700 hover:bg-gray-50 shadow-md" onclick="filterByCategory('Amendments')">Amendments</button>
        </div>

        <!-- Articles Grid -->
        <div id="articlesGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Sample Articles -->
            <div class="group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 article-card" data-title="article 1" data-description="description of article 1" data-category="FundamentalRights">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">Fundamental Rights</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">Article 1</h3>
                    <p class="text-gray-600 text-base mb-4 line-clamp-3">Description of Article 1.</p>
                    <div class="flex items-center justify-between">
                        <a href="/articles/article1" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
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

            <div class="group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 article-card" data-title="article 2" data-description="description of article 2" data-category="DirectivePrinciples">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">Directive Principles</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">Article 2</h3>
                    <p class="text-gray-600 text-base mb-4 line-clamp-3">Description of Article 2.</p>
                    <div class="flex items-center justify-between">
                        <a href="/articles/article2" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
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

            <div class="group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 article-card" data-title="article 3" data-description="description of article 3" data-category="UnionTerritories">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">Union Territories</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">Article 3</h3>
                    <p class="text-gray-600 text-base mb-4 line-clamp-3">Description of Article 3.</p>
                    <div class="flex items-center justify-between">
                        <a href="/articles/article3" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
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

            <div class="group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 article-card" data-title="article 4" data-description="description of article 4" data-category="EmergencyProvisions">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">Emergency Provisions</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">Article 4</h3>
                    <p class="text-gray-600 text-base mb-4 line-clamp-3">Description of Article 4.</p>
                    <div class="flex items-center justify-between">
                        <a href="/articles/article4" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
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

            <div class="group bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1 article-card" data-title="article 5" data-description="description of article 5" data-category="Amendments">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-4">
                        <span class="text-sm font-medium text-blue-600 bg-blue-50 px-3 py-1 rounded-full">Amendments</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400 group-hover:text-blue-500 transition-colors duration-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m7-7H5"></path>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold text-gray-900 mb-2 group-hover:text-blue-600 transition-colors duration-200">Article 5</h3>
                    <p class="text-gray-600 text-base mb-4 line-clamp-3">Description of Article 5.</p>
                    <div class="flex items-center justify-between">
                        <a href="/articles/article5" class="inline-flex items-center text-blue-600 hover:text-blue-700 font-medium group/link">
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
        </div>
    </div>
</div>

<!-- Include the footer -->
<jsp:include page="Footer.jsp" />

<script>
    function filterArticles() {
        const query = document.getElementById('searchQuery').value.toLowerCase();
        const articles = document.querySelectorAll('.article-card');
        const selectedCategory = document.querySelector('button.bg-blue-600').id;

        articles.forEach(article => {
            const title = article.getAttribute('data-title');
            const description = article.getAttribute('data-description');
            const category = article.getAttribute('data-category');
            const matchesSearch = title.includes(query) || description.includes(query);
            const matchesCategory = selectedCategory === 'all' || category === selectedCategory;
            article.style.display = matchesSearch && matchesCategory ? 'block' : 'none';
        });
    }

    function filterByCategory(category) {
        document.querySelectorAll('button').forEach(button => {
            button.classList.remove('bg-blue-600', 'text-white', 'shadow-lg', 'scale-105');
            button.classList.add('bg-white', 'text-gray-700', 'hover:bg-gray-50', 'shadow-md');
        });

        const selectedButton = document.getElementById(category);
        selectedButton.classList.remove('bg-white', 'text-gray-700', 'hover:bg-gray-50', 'shadow-md');
        selectedButton.classList.add('bg-blue-600', 'text-white', 'shadow-lg', 'scale-105');

        filterArticles();
    }

    // Initial Render
    filterByCategory('all');
</script>
</body>
</html>