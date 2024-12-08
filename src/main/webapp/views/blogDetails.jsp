<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Blog Details</title>
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
        <article class="blog-post">
            <div class="category-tag">${blog.category}</div>
            <h2>${blog.title}</h2>
            <p class="blog-meta">By ${blog.author} on ${blog.date}</p>
            <p>${blog.content}</p>
            <div class="blog-actions">
                <button onclick="likeBlog('${blog.id}')" class="like-btn">
                    ❤️ ${blog.likes} Likes
                </button>
            </div>
            <div class="comments-section">
                <h3>Comments</h3>
                <c:forEach var="comment" items="${blog.comments}">
                    <div class="comment">
                        <p>${comment.text}</p>
                        <small>- ${comment.author}</small>
                    </div>
                </c:forEach>
                <div class="add-comment">
                    <input type="text" id="comment-${blog.id}" placeholder="Add a comment...">
                    <button onclick="addComment('${blog.id}')">Comment</button>
                </div>
            </div>
        </article>
    </main>

    <script>
        function likeBlog(blogId) {
            fetch('/likeBlog/' + blogId, { method: 'POST' })
                .then(response => response.json())
                .then(data => {
                    document.querySelector(`button[onclick="likeBlog('${blogId}')"]`).textContent = `❤️ ${data.likes} Likes`;
                });
        }

        function addComment(blogId) {
            const commentInput = document.getElementById(`comment-${blogId}`);
            const commentText = commentInput.value.trim();

            if (commentText) {
                fetch('/addComment/' + blogId, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ text: commentText, author: 'Anonymous' })
                }).then(() => {
                    commentInput.value = '';
                    location.reload();
                });
            }
        }
    </script>
</body>
</html>