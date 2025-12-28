package com.sms.servlet;

import com.sms.dao.TeacherDAO;
import com.sms.model.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/teacher")
public class TeacherServlet extends HttpServlet {
    private final TeacherDAO dao = new TeacherDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("/jsp/addTeacher.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("teacher", dao.findById(id));
                req.getRequestDispatcher("/jsp/editTeacher.jsp").forward(req, resp);
                break;
            case "delete":
                int did = Integer.parseInt(req.getParameter("id"));
                dao.delete(did);
                resp.sendRedirect(req.getContextPath()+"/jsp/teachers.jsp");
                break;
            default:
                req.setAttribute("teachers", dao.getAll());
                req.getRequestDispatcher("/jsp/teachers.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        Teacher t = new Teacher();
        t.setEmpNo(req.getParameter("emp_no"));
        t.setName(req.getParameter("name"));
        t.setEmail(req.getParameter("email"));
        t.setPhone(req.getParameter("phone"));
        t.setDepartment(req.getParameter("department"));

        if (idStr == null || idStr.isEmpty()) {
            dao.create(t);
        } else {
            t.setId(Integer.parseInt(idStr));
            dao.update(t);
        }
        resp.sendRedirect(req.getContextPath()+"/jsp/teachers.jsp");
    }
}
