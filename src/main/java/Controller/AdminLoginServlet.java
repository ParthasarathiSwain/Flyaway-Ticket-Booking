package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AdminLoginDao;
import bean.Admin;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    AdminLoginDao dao ;
    public void init() {
        dao = new AdminLoginDao();
           }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		PrintWriter out=response.getWriter();
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		
		int status = 0;
		int admin_id=0;
		if(dao.validate(username,password))
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			admin_id=dao.getAdminId(username, password);
			session.setAttribute("admin_id", admin_id);
			status=1;
		}
		 // Create a session object if it is already not created.
		
		out.println(status);
		
		
	}

}
