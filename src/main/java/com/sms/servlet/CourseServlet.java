package com.sms.servlet;

import com.sms.dao.CourseDAO;
import com.sms.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/course")
public class CourseServlet extends HttpServlet {
    private final CourseDAO dao = new CourseDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("/jsp/addCourse.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("course", dao.findById(id));
                req.getRequestDispatcher("/jsp/editCourse.jsp").forward(req, resp);
                break;
            case "delete":
                int did = Integer.parseInt(req.getParameter("id"));
                dao.delete(did);
                resp.sendRedirect(req.getContextPath()+"/jsp/courses.jsp");
                break;
            default:
                req.setAttribute("courses", dao.getAll());
                req.getRequestDispatcher("/jsp/courses.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        Course c = new Course();
        c.setCode(req.getParameter("code"));
        c.setTitle(req.getParameter("title"));
        c.setDescription(req.getParameter("description"));
        String credits = req.getParameter("credits");
        c.setCredits((credits == null || credits.isEmpty()) ? 3 : Integer.parseInt(credits));

        if (idStr == null || idStr.isEmpty()) {
            dao.create(c);
        } else {
            c.setId(Integer.parseInt(idStr));
            dao.update(c);
        }
        resp.sendRedirect(req.getContextPath()+"/jsp/courses.jsp");
    }
}
