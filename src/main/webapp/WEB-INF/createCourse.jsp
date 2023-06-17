<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Course</title>
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
  <h2 class="text-3xl font-semibold ">Create Course</h2>
  <p>Welcome to RCA SMIS Course Creation Please Enter Details!!</p>
  <c:if test="${error != null}">
    <p>
      <span style="color: red"> ${error}</span>
    </p>
  </c:if>
  <c:if test="${success != null}">
    <p>
      <span style="color: green"> ${success}</span>
    </p>
  </c:if>
  <form class="py-4" action="createcourse.php?page=createcourse" method="post">
    <div class="flex flex-row gap-4 justify-between">
      <input type="text" class="w-full" placeholder="Course name" required name="name">
      <input type="text" class="w-full" placeholder="Course code" required name="code">
    </div>
    <div class="flex flex-row gap-4">
      <input type="number" class="w-full" placeholder="Max Students" required name="max">
      <input type="number" class="w-full" placeholder="Min Students" required name="min">
    </div>
    <div class="flex flex-row gap-4">
      <input type="date" class="w-full" placeholder="Start date" required name="start">
      <input type="date" class="w-full" placeholder="End date" required name="end">
    </div>
    <div class="flex flex-row justify-between w-full py-4">
      <button class="bg-slate-500 py-3 px-10 flex items-center justify-center rounded-md text-white">Cancel</button>
      <input type="submit" class="bg-indigo-500 py-3 px-10 flex items-center justify-center rounded-md text-white" value="Create Course">
    </div>
  </form>
  <p>
    <a class="hover:text-sky-500" href="listcourses.php?page=courses&&action=list">
      All Courses
    </a>
  </p>
</div>
</body>
</html>