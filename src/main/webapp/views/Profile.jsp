<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Profile - Constitutional Compass</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <style>
        :root {
            --profile-primary: #2c3e50;
            --profile-secondary: #3498db;
            --profile-accent: #e74c3c;
            --profile-bg: #ffffff;
            --profile-text: #2c3e50;
            --profile-border: #eaeaea;
            --profile-success: #2ecc71;
            --profile-shadow: rgba(0, 0, 0, 0.1);
        }

        .profile-container {
            max-width: 1000px;
            margin: 2rem auto;
            background: var(--profile-bg);
            border-radius: 15px;
            box-shadow: 10px 20px 40px var(--profile-shadow);
            overflow: hidden;
        }

        .profile-header {
            position: relative;
            text-align: center;
            padding: 2rem;
            background: linear-gradient(135deg, var(--profile-primary), var(--profile-secondary));
            color: white;
            border-bottom: 4px solid var(--profile-accent);
        }

        .profile-photo-container {
            position: relative;
            display: inline-block;
            margin-bottom: 1rem;
        }

        .profile-photo {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 4px solid white;
            box-shadow: 0 4px 6px var(--profile-shadow);
            transition: transform 0.3s ease;
        }

        .change-photo-btn {
            position: absolute;
            bottom: 0;
            right: 0;
            background: var(--profile-secondary);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            color: white;
            cursor: pointer;
            opacity: 0.8;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px var(--profile-shadow);
        }

        .change-photo-btn:hover {
            opacity: 1;
            transform: scale(1.1);
        }

        .profile-header h1 {
            margin: 1rem 0 0.5rem;
            font-size: 2rem;
        }

        .user-title {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .profile-details {
            padding: 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .detail-item {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 4px var(--profile-shadow);
        }

        .detail-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px var(--profile-shadow);
        }

        .detail-item i {
            color: var(--profile-secondary);
            font-size: 1.5rem;
            width: 24px;
            text-align: center;
        }

        .detail-content {
            flex: 1;
        }

        .detail-content .label {
            display: block;
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 0.25rem;
        }

        .detail-content .value {
            font-weight: 500;
            color: var(--profile-text);
        }

        .detail-item.full-width {
            grid-column: 1 / -1;
        }

        .bio {
            line-height: 1.6;
        }

        .activity-stats {
            padding: 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .stat-card {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 4px var(--profile-shadow);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px var(--profile-shadow);
        }

        .stat-card i {
            font-size: 2rem;
            color: var(--profile-secondary);
            margin-bottom: 1rem;
        }

        .stat-card h3 {
            margin-bottom: 0.5rem;
            color: var(--profile-text);
        }

        .stat-number {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--profile-primary);
        }

        .profile-actions {
            padding: 2rem;
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .btn {
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 25px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 2px 4px var(--profile-shadow);
        }

        .btn i {
            font-size: 1.1rem;
        }

        .btn-edit {
            background: var(--profile-secondary);
            color: white;
        }

        .btn-logout {
            background: var(--profile-accent);
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px var(--profile-shadow);
        }

        /* Event Statistics */
        .event-stats {
            padding: 0 2rem 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .event-card {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 4px var(--profile-shadow);
        }

        .event-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px var(--profile-shadow);
        }

        .event-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .event-title {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--profile-text);
        }

        .event-title i {
            color: var(--profile-secondary);
        }

        .event-count {
            font-size: 1.25rem;
            font-weight: bold;
            color: var(--profile-primary);
        }

        .progress-bar {
            height: 8px;
            background: #e0e0e0;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 0.5rem;
        }

        .progress {
            height: 100%;
            background: linear-gradient(90deg, var(--profile-secondary), var(--profile-success));
            border-radius: 4px;
            transition: width 1s ease-in-out;
        }

        .progress-text {
            font-size: 0.9rem;
            color: #666;
            text-align: right;
        }

        @media (max-width: 768px) {
            .profile-details {
                grid-template-columns: 1fr;
            }
            
            .activity-stats,
            .event-stats {
                grid-template-columns: 1fr;
            }
            
            .profile-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const editButton = document.getElementById('editButton');
        const saveButton = document.getElementById('saveButton');
        const logoutButton = document.getElementById('logoutButton');
        const profileForm = document.getElementById('profileForm');

        // Prevent form submission on any event other than 'Save Changes'
        profileForm.addEventListener('submit', (event) => {
            if (!event.submitter || event.submitter.id !== 'saveButton') {
                event.preventDefault();
            }
        });

        // Edit button functionality
        editButton.addEventListener('click', () => {
            editButton.style.transform = 'scale(0.95)';
            setTimeout(() => {
                editButton.style.transform = 'scale(1)';
            }, 100);

            // Enable inline editing for all fields
            const editableFields = document.querySelectorAll('.value');
            editableFields.forEach((field) => {
                field.contentEditable = true;
                field.style.border = '2px solid var(--profile-secondary)';
                field.style.borderRadius = '4px';
                field.style.padding = '2px 5px';
            });

            // Show the save button
            saveButton.style.display = 'inline-block';
        });

        // Save button functionality
        saveButton.addEventListener('click', (event) => {
            saveButton.style.transform = 'scale(0.95)';
            setTimeout(() => {
                saveButton.style.transform = 'scale(1)';
            }, 100);

            // Confirm before saving changes
            const confirmSave = confirm('Are you sure you want to save the changes?');
            if (confirmSave) {
                // Disable inline editing for all fields
                const editableFields = document.querySelectorAll('.value');
                editableFields.forEach((field) => {
                    field.contentEditable = false;
                    field.style.border = 'none';
                    field.style.padding = '0';
                });

                // Hide the save button
                saveButton.style.display = 'none';

                // Update hidden input fields with the new values
                document.querySelector('input[name="bio"]').value = document.getElementById('bio').innerText;
                document.querySelector('input[name="location"]').value = document.getElementById('location').innerText;
                document.querySelector('input[name="phoneNumber"]').value = document.getElementById('phoneNumber').innerText;
                document.querySelector('input[name="occupation"]').value = document.getElementById('occupation').innerText;

                // Submit the form
                profileForm.submit();
            } else {
                // Prevent form submission if not confirmed
                event.preventDefault();
            }
        });

        // Logout button functionality
        logoutButton.addEventListener('click', () => {
            logoutButton.style.transform = 'scale(0.95)';
            setTimeout(() => {
                logoutButton.style.transform = 'scale(1)';
            }, 100);

            const confirmLogout = confirm('Are you sure you want to logout?');
            if (confirmLogout) {
                document.body.style.opacity = '0';
                document.body.style.transition = 'opacity 0.5s ease';
                setTimeout(() => {
                    window.location.href = '/logout';
                }, 500);
            }
        });
    });

    </script>
</head>
<body>
<header>
    <!-- Include the Navbar -->
    <jsp:include page="Navbarone.jsp" />
</header>

<main>
    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-photo-container">
                <img
                    src="${pageContext.request.contextPath}/${profilePhotoPath}"
                    alt="Profile Photo"
                    class="profile-photo"
                />
            </div>
            <h1>${username}</h1>
            <p class="user-title">${occupation}</p>
        </div>

        <form id="profileForm" action="/updateProfile" method="post">
            <input type="hidden" name="bio" value="${bio}" />
            <input type="hidden" name="location" value="${location}" />
            <input type="hidden" name="phoneNumber" value="${phoneNumber}" />
            <input type="hidden" name="occupation" value="${occupation}" />

            <div class="profile-details">
                <div class="detail-item">
                    <i class="fas fa-user"></i>
                    <div class="detail-content">
                        <span class="label">Username</span>
                        <span class="value" id="username">${username}</span>
                    </div>
                </div>

                <div class="detail-item">
                    <i class="fas fa-envelope"></i>
                    <div class="detail-content">
                        <span class="label">Email</span>
                        <span class="value" id="userEmail">${userEmail}</span>
                    </div>
                </div>

                <div class="detail-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <div class="detail-content">
                        <span class="label">Location</span>
                        <input type="text" class="value" id="location" name="location" placeholder="Enter your location" value="${location}" />
                    </div>
                </div>

                <div class="detail-item">
                    <i class="fas fa-phone"></i>
                    <div class="detail-content">
                        <span class="label">Phone</span>
                        <input type="text" class="value" id="phoneNumber" name="phoneNumber" placeholder="Enter your phone number" value="${phoneNumber}" />
                    </div>
                </div>

                <div class="detail-item">
                    <i class="fas fa-briefcase"></i>
                    <div class="detail-content">
                        <span class="label">Occupation</span>
                        <input type="text" class="value" id="occupation" name="occupation" placeholder="Enter your occupation" value="${occupation}" />
                    </div>
                </div>

                <div class="detail-item full-width">
                    <i class="fas fa-info-circle"></i>
                    <div class="detail-content">
                        <span class="label">Bio</span>
                        <textarea class="value bio" id="bio" name="bio" placeholder="Enter your bio">${bio}</textarea>
                    </div>
                </div>
            </div>

            <div class="activity-stats">
                <div class="stat-card">
                    <i class="fas fa-book-reader"></i>
                    <h3>Saved Books</h3>
                    <p class="stat-number">${articlesRead}</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-comment-dots"></i>
                    <h3>Discussions</h3>
                    <p class="stat-number">${discussions}</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-trophy"></i>
                    <h3>Achievements</h3>
                    <p class="stat-number">${achievements}</p>
                </div>
            </div>

            <div class="event-stats">
                <div class="event-card">
                    <div class="event-header">
                        <div class="event-title">
                            <i class="fas fa-calendar-check"></i>
                            <span>Registered Events</span>
                        </div>
                        <span class="event-count">${registeredEvents}</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress" style="width: ${registeredEventsProgress}%"></div>
                    </div>
                    <div class="progress-text">${registeredEvents} of ${totalEvents} available events</div>
                </div>

                <div class="event-card">
                    <div class="event-header">
                        <div class="event-title">
                            <i class="fas fa-user-check"></i>
                            <span>Attended Events</span>
                        </div>
                        <span class="event-count">${attendedEvents}</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress" style="width: ${attendedEventsProgress}%"></div>
                    </div>
                    <div class="progress-text">${attendedEvents} of ${registeredEvents} registered events</div>
                </div>
            </div>

            <div class="profile-actions">
                <button class="btn btn-edit" id="editButton">
                    <i class="fas fa-edit"></i> Edit Profile
                </button>
                <button class="btn btn-save" id="saveButton" style="display: none;">
                    <i class="fas fa-save"></i> Save Changes
                </button>
                <button class="btn btn-logout" id="logoutButton">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </form>
    </div>
</main>
<!-- Include the footer -->
<jsp:include page="Footer.jsp" />
</body>
</html>