<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Videos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .videos-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }
        .video-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 350px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }
        .video-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
        }
        .video-card:hover {
            transform: translateY(-5px);
        }
        .video-card h3 {
            font-size: 20px;
            margin: 10px 0;
        }
        .video-card p {
            font-size: 16px;
            color: #555;
        }
        .search-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #0f172a;
            padding: 1rem 2rem;
            color: #ffffff;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #ffffff; /* Add white color to the brand text */
        }

        .navbar-menu {
            display: flex;
            gap: 1.5rem;
            list-style: none;
        }

        .navbar-menu a {
            color: #ffffff; /* Add white color to the menu links */
            text-decoration: none;
            font-weight: 500;
        }

        .navbar-auth a {
            margin-left: 0.5rem; /* Decrease the gap between "About" and profile icon */
        }

        .navbar-auth {
            position: relative;
        }

        .profile-link {
            color: #ffffff; /* Add white color to the profile link */
            text-decoration: none;
            font-size: 18px;
            display: flex;
            align-items: center;
        }

        .profile-link i {
            margin-right: 5px;
        }

        .dropdown {
            display: none;
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #0f172a;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown a:hover {
            background-color: #575757;
        }

        .dropdown.show {
            display: block;
        }
    </style>
</head>
<body>
<header>
    <!-- Include the Navbar -->
    <jsp:include page="Navbarone.jsp" />
</header>

<div class="container">
    <h1 class="my-4 text-3xl font-bold">Video Library</h1>
    <div class="mb-4">
        <input type="text" id="searchQuery" placeholder="Search videos..." class="search-input" onkeyup="filterVideos()">
    </div>

    <!-- Debug Statement: Check if videos attribute is present -->
    <c:if test="${empty videos}">
        <p>No videos found.</p>
    </c:if>
    <c:if test="${not empty videos}">
        <p>Videos found: ${videos.size()}</p>
    </c:if>

    <div class="videos-container">
        <c:forEach var="video" items="${videos}">
            <div class="video-card" data-title="${video.title.toLowerCase()}">
                <img src="${video.thumbnailUrl}" alt="${video.title}">
                <h3>${video.title}</h3>
                <p>${video.description}</p>
                <p><strong>Instructor:</strong> ${video.instructor}</p>
                <p><strong>Duration:</strong> ${video.duration}</p>
                <p><strong>Category:</strong> ${video.category}</p>
                <p><strong>Views:</strong> ${video.views}</p>
                <a href="${video.videoUrl}" target="_blank" class="btn btn-primary btn-sm">Watch Now</a>
            </div>
        </c:forEach>
    </div>
</div>


 <!-- Role-based button visibility -->
    <c:if test="${sessionScope.userRole eq 'admin'}">
        <div class="mt-4">
        	<h1 class="my-4 text-3xl font-bold">Admin dashboard for Videos</h1>
            <a href="/videos/admin" class="btn btn-primary">Manage Videos</a>
        </div>
    </c:if>


<!-- Include the footer -->
<jsp:include page="Footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function filterVideos() {
        const query = document.getElementById('searchQuery').value.toLowerCase();
        const videos = document.querySelectorAll('.video-card');
        
        videos.forEach(video => {
            const title = video.getAttribute('data-title');
            const matches = title.includes(query);
            video.style.display = matches ? 'block' : 'none';
        });
    }
</script>
</body>
</html>