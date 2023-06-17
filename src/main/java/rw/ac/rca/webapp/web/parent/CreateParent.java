package rw.ac.rca.webapp.web.parent;

import rw.ac.rca.webapp.dao.ParentDAO;
import rw.ac.rca.webapp.dao.impl.ParentDAOImpl;
import rw.ac.rca.webapp.orm.Parent;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

public class CreateParent extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ParentDAO parentDAO = ParentDAOImpl.getInstance();

    public CreateParent() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageRedirect = req.getParameter("page");
        HttpSession httpSession = req.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");
        System.out.println("The user in session is: " + user);
        if (pageRedirect != null) {
            System.out.println("The print statement is and only is: " + pageRedirect);
            if (pageRedirect.equals("createParent")) {
                req.getRequestDispatcher("WEB-INF/createParent.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "No user found");
                req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error ", "No user found");
            req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageRedirect = req.getParameter("page");
        HttpSession httpSession = req.getSession();
        Object user = httpSession.getAttribute("authenticatedUser");
        if (pageRedirect != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (pageRedirect.equals("createParent")) {
                Parent parent = null;
                try {
                    parent = new Parent(
                            req.getParameter("firstName"),
                            req.getParameter("lastName"),
                            req.getParameter("phoneNumber"),
                            simpleDateFormat.parse(req.getParameter("dateOfBirth"))
                    );
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                try {
                    parentDAO.registerParent(parent);
                    List<Parent> parents = parentDAO.getAllParents();
                    req.setAttribute("success", "Successfully created the parent");
                    req.setAttribute("parents", parents);
                    req.getRequestDispatcher("WEB-INF/parents.jsp").forward(req, resp);
                } catch (Exception e) {
                    req.setAttribute("error","Failed to create Parent");
                    System.out.println("Error, Creating the parent" + e.getMessage());
                    req.getRequestDispatcher("WEB-INF/createParent.jsp").forward(req,resp);
                }
            } else {
                req.getRequestDispatcher("WEB-INF/login.jsp").forward(req , resp);
            }
        } else {
            req.getRequestDispatcher("WEB-INF/login.jsp").forward(req , resp);
        }
    }
}
