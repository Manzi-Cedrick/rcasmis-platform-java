<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="headeradmin.jsp">
    <jsp:param value="Home Admin" name="title"/>
</jsp:include>
<div class="bg-white items-center flex flex-row justify-start py-24 px-32">
    <div class="pr-10 min-w-[44vw]">
        <h1 class="text-3xl flex flex-row items-center animate-pulse gap-4 space-x-4 font-bold">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z"/>
            </svg>
            Free School Management Information System
        </h1>
        <p class="text-[16px] pt-8">An IMS is a framework of software that facilitates the collection, storage,
            organization, and distribution of
            information.
            IMSs are used by businesses and organizations of all sizes to manage their data and information.
            IMSs can help to improve efficiency, productivity, and decision-making.
            .</p>
        <div class="py-10">
            <button class="bg-indigo-500 py-8 px-10 flex items-center text-white rounded-md">
                <a href="#" class="hover:text-white hover:underline-offset-0 ">Explore Admins</a>
            </button>
        </div>
    </div>
    <div class="rounded-md">
        <img
                class="rounded-md h-full w-full object-cover"
                src="images/summit.jpeg"
                alt=""
        />
    </div>
</div>
<%@ include file="footer.jsp" %>