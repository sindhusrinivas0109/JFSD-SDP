<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Events</title>
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
        .bg-red-500 {
            background-color: #e53e3e;
        }
        .hover\:bg-red-600:hover {
            background-color: #c53030;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold">Manage Events</h1>
            <a href="/admin/events/create" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                Create New Event
            </a>
        </div>
        <c:if test="${not empty message}">
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${message}</span>
            </div>
        </c:if>
        <div class="space-y-4">
            <c:forEach var="event" items="${events}">
                <div class="bg-white rounded-lg shadow-md p-6 flex justify-between items-center">
                    <div>
                        <h3 class="text-xl font-semibold">${event.title}</h3>
                        <p class="text-gray-600">${event.date} at ${event.time}</p>
                        <p class="text-sm text-gray-500">
                            Registered: ${event.registeredUsers.size()} / ${event.capacity}
                        </p>
                    </div>
                    <div class="space-x-2">
                        <a href="/admin/events/edit/${event.id}" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                            Edit
                        </a>
                        <form action="/admin/events/delete" method="post" class="inline">
                            <input type="hidden" name="eventId" value="${event.id}">
                            <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
                                Delete
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>