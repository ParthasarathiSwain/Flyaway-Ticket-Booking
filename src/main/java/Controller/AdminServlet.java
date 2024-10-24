package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import Dao.AdminDao;
import bean.Admin;


@WebServlet("/admin")
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AdminServlet() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		
		if(event.equals("viewAdmin")) {
				AdminDao adminDao=new AdminDao();
				List<Admin> admin = adminDao.viewAdmins();
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(admin);
			    out.print(JSONObject);
		 }else if(event.equals("delete_admin")) {
				int admin_id=Integer.parseInt(request.getParameter("admin_Id"));
				AdminDao admin=new AdminDao();
				boolean status=admin.deleteAdmin(admin_id);
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(status);
			    out.print(JSONObject);
		}else if(event.equals("addAdmin")) {
			String admin_name=request.getParameter("adminName");
			String admin_email=request.getParameter("adminEmail");
			String admin_password=request.getParameter("adminPass");
			String admin_phnum=request.getParameter("adminPNo");
			
			Admin admin=new Admin();
			admin.setAdmin_name(admin_name);
			admin.setAdmin_email(admin_email);
			admin.setAdmin_password(admin_password);
			admin.setAdmin_phnum(admin_phnum);
			AdminDao adminDao=new AdminDao();
			adminDao.addAdmin(admin);
			response.sendRedirect("admin/viewAdmin.jsp");
		}else if(event.equals("fatchAdminById")) {
			int admin_id=Integer.parseInt(request.getParameter("admin_Id"));
			AdminDao adminDao=new AdminDao();
			List<Admin> admin = adminDao.srotAdminByEmpId(admin_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(admin);
		    out.print(JSONObject);
		}else if(event.equals("updateAdmin")) {
			int admin_id=Integer.parseInt(request.getParameter("admin_Id"));
			String admin_name=request.getParameter("adminName");
			String admin_email=request.getParameter("adminEmail");
			String admin_password=request.getParameter("adminPass");
			String admin_phnum=request.getParameter("adminPNo");
			
			Admin admin=new Admin();
			admin.setAdmin_id(admin_id);
			admin.setAdmin_name(admin_name);
			admin.setAdmin_email(admin_email);
			admin.setAdmin_password(admin_password);
			admin.setAdmin_phnum(admin_phnum);
			
			
			AdminDao adminDao=new AdminDao();
			adminDao.updateAdmin(admin);
			response.sendRedirect("admin/viewAdmin.jsp");
		}else if(event.equals("changePassword")){
			HttpSession session = request.getSession(true);
			String userName=(String)(session.getAttribute("username"));
			int admin_id=Integer.parseInt((session.getAttribute("admin_id")).toString());
			String oldPass=request.getParameter("oldPass");
			String newPass=request.getParameter("newPass");
			AdminDao adminDao=new AdminDao();
			String old=adminDao.getOldPassword(admin_id);
			if(old.equals(newPass)){
				out.print("Old Password and New Password Should not be Same!");
			}
			else {
				adminDao.changePassword(newPass,admin_id);
				response.sendRedirect("admin/viewAdmin.jsp");
			}
			
		}
	}//do post
	

}
