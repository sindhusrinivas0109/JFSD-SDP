<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Constitutional Compass</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        p {
            color: #555;
            line-height: 1.8;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            margin-top: 50px;
        }
        footer .container {
            max-width: 1200px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
        }
        footer h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #ffcc00;
        }
        footer p, footer a {
            color: #ccc;
            font-size: 0.9em;
            text-decoration: none;
        }
        footer a:hover {
            color: #fff;
        }
        footer ul {
            list-style: none;
            padding: 0;
        }
        footer ul li {
            margin-bottom: 8px;
        }
        footer .social-icons {
            display: flex;
            gap: 10px;
        }
        footer .social-icons a {
            color: #ccc;
            font-size: 1.5em;
        }
        footer .social-icons a:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body>
	<header>
	    <!-- Include the Navbar -->
	    <jsp:include page="Navbarone.jsp" />
    </header>
    <div class="container">
        <h1>About Constitutional Compass</h1>
        <p>
            Constitutional Compass is a comprehensive tool designed to help users navigate the complexities of constitutional law. 
            Our mission is to provide clear, accurate, and accessible information to empower individuals to understand their rights 
            and responsibilities under the law.
        </p>
        <p>
            Whether you're a student, a legal professional, or simply someone interested in learning more about constitutional law, 
            Constitutional Compass is here to guide you. Our platform offers a wealth of resources, including articles, case studies, 
            and interactive tools, all designed to enhance your understanding of this vital area of law.
        </p>
        <p>
            Join us on this journey to explore the foundations of our legal system and discover how constitutional principles shape 
            our society.
        </p>
    </div>

  
   <!-- Include the footer -->
    <jsp:include page="Footer.jsp" />
    
</body>
</html>
