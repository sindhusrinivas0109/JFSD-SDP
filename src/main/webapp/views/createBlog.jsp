<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Blog</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <nav>
        <a href="/">Home</a>
        <a href="/blogs" aria-current="page">Constitutional Blog</a>
        <a href="/page2">Other page</a>
    </nav>
    <main>
        <h1>Create a New Blog</h1>
        <form action="/createBlog" method="post">
            <input type="text" name="title" placeholder="Enter article title" required>
            <select name="category" required>
                <option value="">Select Category</option>
                <option value="Constitutional Rights">Constitutional Rights</option>
                <option value="Supreme Court">Supreme Court</option>
                <option value="Civil Liberties">Civil Liberties</option>
                <option value="Legal Analysis">Legal Analysis</option>
                <option value="Democracy">Democracy</option>
            </select>
            <textarea name="content" placeholder="Write your analysis..." required rows="4"></textarea>
            <input type="text" name="author" placeholder="Your name" required>
            <button type="submit">Publish Article</button>
        </form>
    </main>
</body>
</html>