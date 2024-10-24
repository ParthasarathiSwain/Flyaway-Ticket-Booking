package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import Dao.CustomerDao;
import bean.Customer;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public CustomerServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		
		 if(event.equals("registerCustomer")) {
				String cusName=request.getParameter("uname");
				System.out.println(cusName);
				String mobileNo=request.getParameter("mobileno");
				String password=request.getParameter("password");
				String cpassword=request.getParameter("cpass");
				String email=request.getParameter("emailid");
				String address=request.getParameter("addrs");
				Customer customer=new Customer();
				customer.setAddress(address);
				customer.setCusName(cusName);
				customer.setEmail(email);
				customer.setPassword(password);
				customer.setMobileNo(mobileNo);
				CustomerDao cd=new CustomerDao();
				if(password.equals(cpassword)) {
					boolean status=cd.saveCustomer(customer);
					GsonBuilder gsonBuilder = new GsonBuilder();
				    Gson  gson = gsonBuilder.create();
				    String JSONObject = gson.toJson(status);
				    out.print(JSONObject);
				}
			}else if(event.equals("loginCustomer")) {
				String username = request.getParameter("email");
				String password = request.getParameter("password");
				CustomerDao cd=new CustomerDao();
				boolean status=false;
				int cusId=0;
				if(cd.loginValidate(username,password)) {
					HttpSession session = request.getSession(true);
					session.setAttribute("username", username);
					cusId=cd.getCusId(username,password);
					session.setAttribute("cusId", cusId);
					status=true;
					GsonBuilder gsonBuilder = new GsonBuilder();
				    Gson  gson = gsonBuilder.create();
				    String JSONObject = gson.toJson(status);
				    out.print(JSONObject);
				}
			}
	}


	

}
