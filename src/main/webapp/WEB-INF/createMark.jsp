<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Mark</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f2f2f2;
        }

        h2 {
            text-align: center;
            color: #333333;
            font-family: 'Quicksand', sans-serif;
        }

        p, a {
            text-align: center;
            font-family: 'Quicksand', sans-serif;
            text-decoration: none;
        }

        input[type="text"], input[type="password"], input[type="date"], input[type="number"] {
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            background-color: #f2f2f2;
            color: #333333;
            font-size: 16px;
        }

        option {
            color: #333333;
        }

    </style>
</head>
<body>
<div class="bg-white max-w-[40vw] px-8 py-4 mx-auto mt-[10%]">
    <h2 class="text-3xl font-semibold ">Create Mark</h2>
    <p>Welcome to RCA SMIS Mark Creation Please Enter Details!!</p>
    <c:if test="${message != null}">
        <p>
            <span style="color: red"> ${message}</span>
        </p>
    </c:if>
    <form class="py-4" action="createmark.php?page=createMark" method="post">
        <input type="text" class="w-full" placeholder="Student name" required name="studentname">
        <input type="text" class="w-full" placeholder="Subject name" required name="subject">
        <input type="number" class="w-full" placeholder="Marks " required name="marks_obtained">
        <div class="flex flex-row justify-between w-full py-4">
            <button class="bg-slate-500 py-3 px-10 flex items-center justify-center rounded-md text-white">Cancel
            </button>
            <input type="submit" class="bg-indigo-500 py-3 px-10 flex items-center justify-center rounded-md text-white"
                   value="Create Mark">
        </div>
    </form>
    <p>
        <a class="hover:text-sky-500" href="listmarks.php?page=marks&&action=list">
            All Marks
        </a>
    </p>
</div>
</body>
</html>