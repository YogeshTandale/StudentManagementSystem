package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    private final StudentDAO dao = new StudentDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("/jsp/addStudent.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Student s = dao.findById(id);
                req.setAttribute("student", s);
                req.getRequestDispatcher("/jsp/editStudent.jsp").forward(req, resp);
                break;
            case "delete":
                int did = Integer.parseInt(req.getParameter("id"));
                dao.delete(did);
                resp.sendRedirect(req.getContextPath()+"/jsp/students.jsp");
                break;
            default:
                req.setAttribute("students", dao.getAll());
                req.getRequestDispatcher("/jsp/students.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        Student s = new Student();
        s.setRegNo(req.getParameter("reg_no"));
        s.setFirstName(req.getParameter("first_name"));
        s.setLastName(req.getParameter("last_name"));
        s.setEmail(req.getParameter("email"));
        s.setPhone(req.getParameter("phone"));
        String dob = req.getParameter("dob");
        if (dob != null && !dob.isEmpty()) s.setDob(Date.valueOf(dob));
        s.setGender(req.getParameter("gender"));
        s.setAddress(req.getParameter("address"));
        String courseId = req.getParameter("course_id");
        if (courseId != null && !courseId.isEmpty()) s.setCourseId(Integer.parseInt(courseId));
        if (idStr == null || idStr.isEmpty()) {
            dao.create(s);
        } else {
            s.setId(Integer.parseInt(idStr));
            dao.update(s);
        }
        resp.sendRedirect(req.getContextPath()+"/jsp/students.jsp");
    }
}
