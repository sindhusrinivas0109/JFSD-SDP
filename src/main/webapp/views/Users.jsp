<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Users List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 30px;
            font-size: 10rem; /* Increased text size */
        }
        
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            animation: fadeIn 1s ease-in-out;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: #fff;
            font-weight: bold;
        }
        tr {
            transition: background-color 0.3s ease;
        }
        tr:nth-child(even) {
            background-color: #f8f8f8;
        }
        tr:hover {
            background-color: #e0e0e0;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<header>
        <!-- Include the Navbar -->
        <jsp:include page="Navbarone.jsp" />
    </header>
    <h1>Users List</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Location</th>
                <th>Phone Number</th>
                <th>Occupation</th>
                <th>Articles Read</th>
                <th>Discussions</th>
                <th>Achievements</th>
                <th>Total Events</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.location}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.occupation}</td>
                    <td>${user.articlesRead}</td>
                    <td>${user.discussions}</td>
                    <td>${user.achievements}</td>
                    <td>${user.totalEvents}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- Include the footer -->
<jsp:include page="Footer.jsp" />
</body>
</html>