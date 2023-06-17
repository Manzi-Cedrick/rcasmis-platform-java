<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="cssfile.css" type="text/css"/>
    <link rel="stylesheet" href="css/displaytag.css" type="text/css"/>
    <link rel="stylesheet" href="css/screen.css" type="text/css"/>
    <link rel="stylesheet" href="css/site.css" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500&display=swap" rel="stylesheet">
    <title>Parent Registrations</title>
    <style>
        * {
            font-family: 'Quicksand', sans-serif;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            font-family: 'Quicksand', sans-serif;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
            font-family: 'Quicksand', sans-serif;
        }

        thead {
            background-color: #29375A;
            color: white;
            font-family: 'Quicksand', sans-serif;
            font-weight: bold;
            font-family: 'Quicksand', sans-serif;
        }
    </style>
</head>
<body>
<div>
    <div>
        <%@ include file="headeradmin.jsp" %>
    </div>
</div>
<div class="lg:px-32 bg-slate-50 min-h-[76vh]">
    <c:if test="${authenticatedUser !=null}">
        <div class="flex flex-row justify-between py-4 ">
            <div class="py-4">
                <h1 class="font-semibold space-y-2 ">List Parents</h1>
                <p class="text-slate-400">List the description of all parents.</p>
            </div>
            <div class="flex flex-row gap-4">
                <button class="bg-indigo-500 text-[14px] flex flex-row gap-4 items-center font-semibold text-white h-10 rounded-md px-6">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    <a href="createparent.php?page=createParent">New Parent</a>
                </button>
                <button class="bg-indigo-500 text-[14px] flex flex-row gap-4 items-center font-semibold text-white h-10 rounded-md px-6">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"/>
                    </svg>
                    <a href="createparent.php?page=createParent">Generate Report</a>
                </button>
            </div>
        </div>
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
            <div class="py-4 flex mx-10 justify-end flex-row">
                <form action="/listparent.php" method="get">
                    <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only ">Search</label>
                    <div class="relative w-[20vw]">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg aria-hidden="true" class="w-5 h-5 text-gray-500 " fill="none" stroke="currentColor"
                                 viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </div>
                        <input type="search" id="default-search" name="id"
                               class="block w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 "
                               placeholder="Search Parent Id" required>
                        <button name="parentregistrationsearch" type="submit"
                                class="text-white absolute right-2.5 bottom-2.5 bg-indigo-500 font-semibold hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg text-sm px-4 py-2">
                            Search
                        </button>
                    </div>
                </form>
            </div>
            <table class="w-full text-sm text-left text-gray-500 ">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50  ">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        ID
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Firstname
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Lastname
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Gender
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Phone Number
                    </th>
                    <th scope="col" class="px-6 py-3" colspan="2" rowspan="1">
                        Actions
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${parents}" var="prt" varStatus="prtstatus">
                    <tr class="bg-white border-b  hover:bg-gray-50 ">
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap ">
                                ${prt.getId()}
                        </th>
                        <td class="px-6 py-4">
                                ${prt.getFirstName()}
                        </td>
                        <td class="px-6 py-4">
                                ${prt.getLastName()}
                        </td>
                        <td class="px-6 py-4">
                                ${prt.getGender()}
                        </td>
                        <td class="px-6 py-4">
                                ${prt.getPhoneNumber()}
                        </td>
                        <td class="px-6 py-4">
                            <a href="#" class="font-medium text-blue-600  hover:underline">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>
<%@ include file="footer.jsp" %>