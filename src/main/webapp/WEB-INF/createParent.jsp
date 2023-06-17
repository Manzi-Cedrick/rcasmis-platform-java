<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create Parent</title>
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

    input[type="text"], input[type="password"], input[type="date"], input[type="number"], input[type="email"] {
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
  <h2 class="text-3xl font-semibold ">Create Parent</h2>
  <p>Welcome to RCA SMIS Parent Creation Please Enter Details!!</p>
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
  <form class="py-4" action="createparent.php?page=createParent" method="post">
    <div class="flex flex-row gap-4 justify-between">
      <input type="text" class="w-full" placeholder="First name" required name="firstname">
      <input type="text" class="w-full" placeholder="Last name" required name="lastname">
    </div>
    <div class="flex flex-row gap-4">
      <input type="date" class="w-full" placeholder="Date" required name="dob">
      <input type="email" class="w-full" placeholder="Email" required name="email">
    </div>
    <div class="flex flex-row gap-4">
      <input type="number" class="w-full" placeholder="Phone number" required name="phonenumber">
      <div class="w-full">
        <label>
          <input type="radio" name="gender" value="male">
          Male
        </label>
        <label>
          <input type="radio" name="gender" value="female">
          Female
        </label>
      </div>
    </div>
    <div class="flex flex-row gap-4 justify-between">
      <input type="text" class="w-full" placeholder="Address" required name="address">
      <input type="number" class="w-full" placeholder="Student ID" required name="student">
    </div>
    <div class="flex flex-row justify-between w-full py-4">
      <button class="bg-slate-500 py-3 px-10 flex items-center justify-center rounded-md text-white">Cancel</button>
      <input name="savePrt" type="submit" class="bg-indigo-500 py-3 px-10 flex items-center justify-center rounded-md text-white" value="Create Parent">
    </div>
  </form>
  <p>
    <a class="hover:text-sky-500" href="listparents.php?page=parents&&action=list">
      All Parents
    </a>
  </p>
</div>
</body>
</html>