<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${event != null ? 'Edit' : 'Create'} Event</title>
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
        .text-3xl {
            font-size: 1.875rem;
        }
        .font-bold {
            font-weight: 700;
        }
        .mb-8 {
            margin-bottom: 2rem;
        }
        .text-sm {
            font-size: 0.875rem;
        }
        .font-medium {
            font-weight: 500;
        }
        .text-gray-700 {
            color: #4a5568;
        }
        .mt-1 {
            margin-top: 0.25rem;
        }
        .block {
            display: block;
        }
        .w-full {
            width: 100%;
        }
        .rounded-md {
            border-radius: 0.375rem;
        }
        .border-gray-300 {
            border-color: #d1d5db;
        }
        .shadow-sm {
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }
        .focus\:border-indigo-500:focus {
            border-color: #667eea;
        }
        .focus\:ring-indigo-500:focus {
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.5);
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-3xl font-bold mb-8">${event != null ? 'Edit' : 'Create'} Event</h1>
        <form action="${event != null ? '/admin/events/update' : '/admin/events/create'}" method="post" class="space-y-4">
            <c:if test="${event != null}">
                <input type="hidden" name="id" value="${event.id}">
            </c:if>
            <div>
                <label class="block text-sm font-medium text-gray-700">Title</label>
                <input type="text" name="title" value="${event.title}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Description</label>
                <textarea name="description" rows="4" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">${event.description}</textarea>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Date</label>
                    <input type="date" name="date" value="${event.date}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Time</label>
                    <input type="time" name="time" value="${event.time}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                </div>
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Location</label>
                <input type="text" name="location" value="${event.location}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Capacity</label>
                <input type="number" name="capacity" value="${event.capacity}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>
            <div>
                <label class="block text-sm font-medium text-gray-700">Image URL (optional)</label>
                <input type="text" name="imageUrl" value="${event.imageUrl}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>
            <button type="submit" class="w-full bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                ${event != null ? 'Update Event' : 'Create Event'}
            </button>
        </form>
    </div>
</body>
</html>