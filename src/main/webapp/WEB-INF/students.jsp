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
  <title>Students Registrations</title>
  <style>
    *{
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
  <%@ include file="headeradmin.jsp" %>
</div>
<div class="lg:px-32 bg-slate-50 min-h-[76vh]">
  <c:if test="${authenticatedUser !=null}">
    <div class="flex flex-row justify-between py-4 ">
      <div class="py-4">
        <h1 class="font-semibold space-y-2 ">List Students</h1>
        <p class="text-slate-400">List the description of all students.</p>
      </div>
      <div class="flex flex-row gap-4">
        <button class="bg-indigo-500 text-[14px] flex flex-row gap-4 items-center font-semibold text-white h-10 rounded-md px-6">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
               stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"/>
          </svg>
          <a href="createstudent.php?page=createstudent">New Student</a>
        </button>
        <button class="bg-indigo-500 text-[14px] flex flex-row gap-4 items-center font-semibold text-white h-10 rounded-md px-6">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
               stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"/>
          </svg>
          <a href="/createstudent.php?page=createstudent">Generate Report</a>
        </button>
      </div>
    </div>
    <div class="bg-white">
      <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500 ">
          <thead class="text-xs text-gray-700 uppercase bg-gray-50  ">
          <tr>
            <th scope="col" class="p-4">
              <div class="flex items-center">
                <input id="checkbox-all-search" type="checkbox"
                       class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ">
                <label for="checkbox-all-search" class="sr-only">checkbox</label>
              </div>
            </th>
            <th scope="col" class="px-6 py-3">
              ID
            </th>
            <th scope="col" class="px-6 py-3">
              First Name
            </th>
            <th scope="col" class="px-6 py-3">
              Last Name
            </th>
            <th scope="col" class="px-6 py-3">
              Phone number
            </th>
            <th scope="col" class="px-6 py-3">
              Date of Birth
            </th>
            <th scope="col" class="px-6 py-3">
              Address
            </th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${students}" var="csr" varStatus="usrStatus">
            <tr class="bg-white border-b  hover:bg-gray-50 ">
              <td class="w-4 p-4">
                <div class="flex items-center">
                  <input ${csr.id} type="checkbox" name="usrIds"
                                   class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 ">
                  <label class="sr-only">checkbox</label>
                </div>
              </td>
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap ">
                  ${csr.id}
              </th>
              <td class="px-6 py-4">
                  ${csr.firstName}
              </td>
              <td class="px-6 py-4">
                  ${csr.lastName}
              </td>
              <td class="px-6 py-4">
                  ${csr.phoneNumber}
              </td>
              <td class="px-6 py-4">
                  ${csr.dateOfBirth}
              </td>
              <td class="px-6 py-4">
                  ${csr.address}
              </td>
              <td class="px-6 py-4">
                <a href="#" class="font-medium text-blue-600  hover:underline">Edit</a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </c:if>
</div>
<%@ include file="footer.jsp" %>