<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Videos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
        }
        .form-container .form-group {
            margin-bottom: 15px;
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
        .navbar a {
            color: #ffffff;
            text-decoration: none;
        }
        .navbar a:hover {
            color: #cccccc;
        }
    </style>
</head>
<body>
<header>
    <!-- Include the Navbar -->
    <jsp:include page="Navbarone.jsp" />
</header>

<div class="container">
    <h1 class="my-4 text-3xl font-bold">Admin Videos</h1>
    <div class="form-container">
        <h2>Add/Edit Video</h2>
        <form action="/videos/saveVideo" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="thumbnailUrl">Thumbnail URL</label>
                <input type="text" class="form-control" id="thumbnailUrl" name="thumbnailUrl" required>
            </div>
            <div class="form-group">
                <label for="videoUrl">Video URL</label>
                <input type="text" class="form-control" id="videoUrl" name="videoUrl" required>
            </div>
            <div class="form-group">
                <label for="instructor">Instructor</label>
                <input type="text" class="form-control" id="instructor" name="instructor" required>
            </div>
            <div class="form-group">
                <label for="duration">Duration</label>
                <input type="text" class="form-control" id="duration" name="duration" required>
            </div>
            <div class="form-group">
                <label for="views">Views</label>
                <input type="number" class="form-control" id="views" name="views" required>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" class="form-control" id="category" name="category" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Video</button>
        </form>
    </div>

    <h2 class="my-4 text-3xl font-bold">Delete Video</h2>
    <div class="form-container">
        <form action="/videos/deleteVideo" method="post">
            <div class="form-group">
                <label for="videoId">Video ID</label>
                <input type="number" class="form-control" id="videoId" name="id" required>
            </div>
            <button type="submit" class="btn btn-danger">Delete Video</button>
        </form>
    </div>
</div>

<!-- Include the footer -->
<jsp:include page="Footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>