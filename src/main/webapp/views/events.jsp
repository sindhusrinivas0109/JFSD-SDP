<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Constitutional Events</title>
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
        .mb-4 {
            margin-bottom: 1rem;
        }
        .text-xl {
            font-size: 1.25rem;
        }
        .font-semibold {
            font-weight: 600;
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
        .disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        .text-center {
            text-align: center;
        }
        .text-right {
            text-align: right;
        }
        .mt-8 {
            margin-top: 2rem;
        }
        .bg-red-500 {
            background-color: #e53e3e;
        }
        .hover\:bg-red-600:hover {
            background-color: #c53030;
        }
    </style>
</head>
<body>
    <header>
        <!-- Include the Navbar -->
        <jsp:include page="Navbarone.jsp" />
    </header>
    
    <div class="container">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold">Constitutional Events</h1>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <c:forEach var="event" items="${events}">
                <div class="bg-white rounded-lg shadow-md p-6 mb-4">
                    <c:if test="${not empty event.imageUrl}">
                        <img src="${event.imageUrl}" alt="${event.title}" class="w-full h-48 object-cover rounded-md mb-4">
                    </c:if>
                    <h3 class="text-xl font-semibold mb-2">${event.title}</h3>
                    <p class="text-gray-600 mb-4">${event.description}</p>
                    <div class="grid grid-cols-2 gap-4 mb-4">
                        <div>
                            <p class="text-sm text-gray-500">Date</p>
                            <p class="font-medium">${event.date}</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500">Time</p>
                            <p class="font-medium">${event.time}</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500">Location</p>
                            <p class="font-medium">${event.location}</p>
                        </div>
                        <div>
                            <p class="text-sm text-gray-500">Spots Left</p>
                            <p class="font-medium">${event.capacity - event.registeredUsers.size()} of ${event.capacity}</p>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${registeredEvents.contains(event.id)}">
                            <form action="/events/cancel" method="post">
                                <input type="hidden" name="eventId" value="${event.id}">
                                <button type="submit" class="bg-red-500 text-white w-full px-4 py-2 rounded hover:bg-red-600">
                                    Cancel Registration
                                </button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <form action="/events/register" method="post">
                                <input type="hidden" name="eventId" value="${event.id}">
                                <button type="submit" class="bg-blue-500 text-white w-full px-4 py-2 rounded hover:bg-blue-600"
                                        <c:if test="${event.capacity - event.registeredUsers.size() == 0}">disabled</c:if>>
                                    ${event.capacity - event.registeredUsers.size() == 0 ? 'Event Full' : 'Register Now'}
                                </button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>

        

        <!-- Admin Actions Button (Visible only to admins) -->
        <c:if test="${sessionScope.userRole eq 'admin'}">
            <div class="text-right mt-8">
                <a href="/admin/events" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
                    Admin Actions
                </a>
            </div>
        </c:if>
        
    </div>
</body>
</html>