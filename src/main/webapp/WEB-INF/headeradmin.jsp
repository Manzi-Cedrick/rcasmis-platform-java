<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#home-link, #users-link, #parents-link, #students-link, #marks-link, #courses-link').click(function(event) {
                $('.active').removeClass('active');
                $(this).addClass('active');
            });
        });
    </script>
    <title>${param.title}</title>
    <style>
        .active {
            border-color: indigo;
            color: gray;
            font-weight: bold;
        }
    </style>
</head>
<body>


<nav class="bg-white border-gray-200 ">
    <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-4">
        <a href="http://localhost:8090/rcamis/login.php" class="flex underline-offset-2 hover:text-black items-center">
            <img src="images/rcalogo.png" class="h-8 mr-3" alt="Flowbite Logo"/>
            <span class="self-center text-2xl font-semibold whitespace-nowrap ">RCA-SMIS</span>
        </a>
        <div class="flex items-center">
            <a href="tel:5541251234" class="mr-6 text-sm  text-gray-500  hover:underline">(555) 412-1234</a>
            <div class="text-slate-800 flex flex-row">
                <c:if test="${authenticatedUser !=null}">
                    <b class="flex px-4"><a href="listuser.php?page=profile&&id=${authenticatedUser.id}"></a><img
                            src="icons/user.png"/> <span class="px-4">${authenticatedUser.fullName}</span><a
                            href="login.php?logout=logout"><span class="text-slate-400 hover:text-red-500">Logout</span></a>
                    </b>
                </c:if>
                <c:if test="${authenticatedUser ==null}">
                    | <a href="login.php?"><font color="#ffffff">Login</font></a> |
                </c:if>
            </div>
        </div>
    </div>
</nav>
<div class="bg-gray-200 shadow-md shadow-slate-400">
<%@ include file="menu.jsp" %>
</div>
