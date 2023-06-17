package rw.ac.rca.webapp.web;

import rw.ac.rca.webapp.dao.AddressDAO;
import rw.ac.rca.webapp.dao.CourseDAO;
import rw.ac.rca.webapp.dao.StudentDAO;
import rw.ac.rca.webapp.dao.impl.AddressDAOImpl;
import rw.ac.rca.webapp.dao.impl.CourseDAOImpl;
import rw.ac.rca.webapp.dao.impl.StudentDAOImpl;
import rw.ac.rca.webapp.orm.Address;
import rw.ac.rca.webapp.orm.Course;
import rw.ac.rca.webapp.orm.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Servlet implementation class CreateCourse
 */
public class CreateStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = StudentDAOImpl.getInstance();
    private AddressDAO addressDAO = AddressDAOImpl.getInstance();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");
        System.out.println("The user in session is: " + user);

        if (pageRedirect != null) {
            System.out.println("The print statement is and the only is: " + pageRedirect);
            if (pageRedirect.equals("createstudent")) {
                List<Address> addressList = addressDAO.getAllAddresses();

                request.setAttribute("address", addressList);
                request.getRequestDispatcher("WEB-INF/createStudent.jsp").forward(request, response);
            } else {
                request.setAttribute("CreateUsererror ", "No user found");
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("CreateUsererror ", "No user found");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageRedirect = request.getParameter("page");
        HttpSession httpSession = request.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");

        if (pageRedirect != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (pageRedirect.equals("createstudent")) {
                System.out.println("Thw address id is : " + request.getParameter("address"));
                Address address = addressDAO.getAddressById(Integer.parseInt(request.getParameter("address")));

                Student student = new Student();
                try {
                    boolean isInternational = (Integer.parseInt(request.getParameter("internation")) == 1 ? true : false);
                    boolean isPartTime = (Integer.parseInt(request.getParameter("partTime")) == 1 ? true : false);
                    boolean isRepeating = (Integer.parseInt(request.getParameter("repeating")) == 1 ? true : false);

                    student.setFirstName(request.getParameter("firstName"));
                    student.setLastName(request.getParameter("lastName"));
                    student.setPhoneNumber(request.getParameter("phone"));
                    student.setInternational(isInternational);
                    student.setPartTime(isPartTime);
                    student.setRepeating(isRepeating);
                    student.setDateOfBirth(simpleDateFormat.parse(request.getParameter("birth")));
                    student.setAddress(address);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }

                // Saving the course;
                try {
                    studentDAO.saveStudent(student);
                    request.setAttribute("successStudent", "Successfully created the student");
                    request.getRequestDispatcher("WEB-INF/createStudent.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("CreateStudenterror", "Failed to create the student");
                    request.getRequestDispatcher("WEB-INF/createStudent.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }
}