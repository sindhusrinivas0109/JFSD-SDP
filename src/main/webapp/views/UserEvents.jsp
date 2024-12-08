<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Events</title>
    <style>
        body {
            background-color: #f3f4f6;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .bg-white {
            background-color: #ffffff;
        }
        .rounded-lg {
            border-radius: 0.5rem;
        }
        .shadow-md {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .p-6 {
            padding: 1.5rem;
        }
        .mb-8 {
            margin-bottom: 2rem;
        }
        .text-3xl {
            font-size: 1.875rem;
        }
        .font-bold {
            font-weight: 700;
        }
        .text-xl {
            font-size: 1.25rem;
        }
        .text-gray-600 {
            color: #718096;
        }
        .text-sm {
            font-size: 0.875rem;
        }
        .text-gray-500 {
            color: #a0aec0;
        }
        .font-medium {
            font-weight: 500;
        }
        .bg-blue-500 {
            background-color: #4299e1;
        }
        .text-white {
            color: #ffffff;
        }
        .px-4 {
            padding-left: 1rem;
            padding-right: 1rem;
        }
        .py-2 {
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
        }
        .rounded {
            border-radius: 0.25rem;
        }
        .hover\:bg-blue-600:hover {
            background-color: #3182ce;
        }
        .text-center {
            text-align: center;
        }
        .py-8 {
            padding-top: 2rem;
            padding-bottom: 2rem;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        th, td {
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
        }
        th {
            background-color: #edf2f7;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background-color: #f7fafc;
        }
    </style>
</head>
<body>
    <header>
        <!-- Include the Navbar -->
        <jsp:include page="Navbarone.jsp" />
    </header>
    
    <div class="container">
        <h1 class="text-3xl font-bold mb-8">Registered Events</h1>
        <p class="text-xl mb-4">Welcome, ${sessionScope.user.name} (${sessionScope.user.email})</p>
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Spots Left</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="event" items="${registeredEvents}">
                    <tr>
                        <td>${event.title}</td>
                        <td>${event.date}</td>
                        <td>${event.time}</td>
                        <td>${event.location}</td>
                        <td>${event.capacity - event.registeredUsers.size()} of ${event.capacity}</td>
                        <td>
                            <form action="/events/cancel" method="post">
                                <input type="hidden" name="eventId" value="${event.id}">
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
                                    Cancel Registration
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty registeredEvents}">
            <div class="text-center py-8">
                <p class="text-gray-600">You haven't registered for any events yet.</p>
            </div>
        </c:if>
    </div>
</body>
</html>