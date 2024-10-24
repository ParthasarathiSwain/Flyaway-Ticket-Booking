package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import Dao.CountryDao;
import bean.Country;

@WebServlet("/country")
public class CountryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CountryServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		if(event.equals("addCountry")) {
			String country_name=request.getParameter("countryName");
			Country country=new Country();
			country.setCountry_name(country_name);
			CountryDao countryDao=new CountryDao();
			countryDao.addCountry(country);
			response.sendRedirect("admin/country.jsp");
		}else if(event.equals("viewCountry")) {
			CountryDao countryDao=new CountryDao();
			List<Country> country = countryDao.viewCountry();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(country);
			out.print(JSONObject);
		}else if(event.equals("delete_country")) {
			int country_id=Integer.parseInt(request.getParameter("country_id"));
			boolean status=CountryDao.deleteCountry(country_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
		    System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("fatchCountryByCounId")) {
			int country_id=Integer.parseInt(request.getParameter("country_id"));
			CountryDao countryDao=new CountryDao();
			List<Country> country = countryDao.srotCountryByCounId(country_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(country);
	 //  	System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("updateCountry")) {
			int country_id=Integer.parseInt(request.getParameter("country_id"));
			String country_name=request.getParameter("countryName");
			Country country=new Country();
			country.setCountry_id(country_id);
			country.setCountry_name(country_name);
			CountryDao countryDao=new CountryDao();
			countryDao.updateCountry(country);
			response.sendRedirect("admin/country.jsp");
		}
	}

}
