<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legal Library</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1.2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
        }
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .read-book-btn {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            transition: all 0.3s ease;
        }
        .read-book-btn:hover {
            background: linear-gradient(to right, #2575fc, #6a11cb);
        }
        #searchQuery::placeholder {
            animation: placeholderAnimation 3s infinite;
        }
        @keyframes placeholderAnimation {
            0% { color: #aaa; }
            50% { color: #777; }
            100% { color: #aaa; }
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-height: 80%;
            overflow-y: auto;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body class="bg-gray-50 pt-20">
    <header>
        <!-- Include the Navbar -->
        <jsp:include page="Navbarone.jsp" />
    </header>

    <%
        class Book {
            String id;
            String title;
            String author;
            String coverUrl;
            String description;
            String pdfUrl;

            Book(String id, String title, String author, String coverUrl, String description, String pdfUrl) {
                this.id = id;
                this.title = title;
                this.author = author;
                this.coverUrl = coverUrl;
                this.description = description;
                this.pdfUrl = pdfUrl;
            }
        }

        List<Book> books = new ArrayList<>();
        books.add(new Book("1", "Introduction to Indian Constitution", "Dr. Durga Das Basu",
                "https://images.unsplash.com/photo-1532634922-8fe0b757fb13?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                "A comprehensive guide to understanding the Indian Constitution and its fundamental principles.",
                "/books/indian-constitution.pdf"));
        books.add(new Book("2", "Constitutional Law of India", "Dr. J.N. Pandey",
                "https://images.unsplash.com/photo-1589829545856-d10d557cf95f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                "An in-depth analysis of Indian Constitutional Law with case studies and precedents.",
                "/books/constitutional-law.pdf"));
    %>

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8">
            <h1 class="text-4xl font-bold text-gray-900 mb-4 md:mb-0">Legal Library</h1>
            <div class="relative">
                <input
                    type="text"
                    id="searchQuery"
                    placeholder="Search books..."
                    class="w-full md:w-64 px-4 py-2 rounded-lg border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    onkeyup="filterBooks()"
                />
            </div>
        </div>

        <div id="booksGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <% for (Book book : books) { %>
                <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-300 book-card" data-title="<%= book.title.toLowerCase() %>" data-author="<%= book.author.toLowerCase() %>">
                    <img src="<%= book.coverUrl %>" alt="<%= book.title %>" class="w-full h-48 object-cover" />
                    <div class="p-4">
                        <h3 class="text-lg font-semibold text-gray-900 mb-1"><%= book.title %></h3>
                        <p class="text-sm text-gray-600 mb-3">By <%= book.author %></p>
                        <p class="text-gray-700 text-sm mb-4 line-clamp-2"><%= book.description %></p>
                        <button onclick="openBookModal('<%= book.title %>', '<%= book.author %>', '<%= book.description %>')" class="w-full bg-blue-600 text-white py-2 rounded-md hover:bg-blue-700 transition-colors duration-200 text-center block read-book-btn">
                            Read Book
                        </button>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <!-- Modal -->
    <div id="bookModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeBookModal()">&times;</span>
            <h2 id="modalTitle" class="text-2xl font-bold mb-4"></h2>
            <p id="modalAuthor" class="text-gray-600 mb-4"></p>
            <p id="modalDescription" class="text-gray-700 mb-4"></p>
            <div id="modalContent" class="text-gray-800">
                <!-- Placeholder text for 10000 words -->
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <!-- Repeat the above paragraph multiple times to simulate 10000 words -->
                <!-- This is just a placeholder, you can replace it with actual content or load a real PDF -->
            </div>
        </div>
    </div>

    <!-- Include the footer -->
    <jsp:include page="Footer.jsp" />

    <script>
        function filterBooks() {
            const query = document.getElementById('searchQuery').value.toLowerCase();
            const books = document.querySelectorAll('.book-card');
            
            books.forEach(book => {
                const title = book.getAttribute('data-title');
                const author = book.getAttribute('data-author');
                const matches = title.includes(query) || author.includes(query);
                book.style.display = matches ? 'block' : 'none';
            });
        }

        function openBookModal(title, author, description) {
            const modal = document.getElementById('bookModal');
            const modalTitle = document.getElementById('modalTitle');
            const modalAuthor = document.getElementById('modalAuthor');
            const modalDescription = document.getElementById('modalDescription');
            const modalContent = document.getElementById('modalContent');

            modalTitle.innerText = title;
            modalAuthor.innerText = 'By ' + author;
            modalDescription.innerText = description;

            // Generate placeholder text for 10000 words
            let placeholderText = '';
            for (let i = 0; i < 100; i++) {
                placeholderText += 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ';
            }
            modalContent.innerText = placeholderText;

            modal.style.display = 'block';
        }

        function closeBookModal() {
            const modal = document.getElementById('bookModal');
            modal.style.display = 'none';
        }

        // Close the modal if the user clicks outside of it
        window.onclick = function(event) {
            const modal = document.getElementById('bookModal');
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        }
    </script>
</body>
</html>