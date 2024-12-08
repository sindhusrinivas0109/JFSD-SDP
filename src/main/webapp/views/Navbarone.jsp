<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
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
        }

        .navbar-menu {
            display: flex;
            gap: 1.5rem;
            list-style: none;
        }

        .navbar-menu a {
            color: #ffffff;
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
            color: white;
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
        <nav class="navbar">
            <div class="navbar-brand">
                <i class="fas fa-book-open"></i> Constitution Compass
            </div>
            <div class="navbar-auth">
                <a href="#" class="profile-link">
                    <i class="fas fa-user-circle"></i> ${sessionScope.username}
                </a>
                <div class="dropdown">
                    <a href="/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    <a href="/Profile"><i class="fas fa-user-circle"></i> Profile</a>
                </div>
            </div>
        </nav>
    </header>
    <script>
        // JavaScript to handle the dropdown functionality
        document.addEventListener('DOMContentLoaded', function() {
            const profileLink = document.querySelector('.profile-link');
            const dropdown = document.querySelector('.dropdown');

            profileLink.addEventListener('click', function(event) {
                event.preventDefault();
                dropdown.classList.toggle('show');
            });

            // Close the dropdown if the user clicks outside of it
            window.addEventListener('click', function(event) {
                if (!event.target.matches('.profile-link')) {
                    if (dropdown.classList.contains('show')) {
                        dropdown.classList.remove('show');
                    }
                }
            });
        });
    </script>
</body>
</html>