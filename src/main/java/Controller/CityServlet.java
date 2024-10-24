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
import Dao.CityDao;
import bean.City;



@WebServlet("/city")
public class CityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CityServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		
		 if(event.equals("viewCity")) {
				CityDao cityDao=new CityDao();
				List<City> city = cityDao.viewCity();
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(city);
			    System.out.print(JSONObject);
				out.print(JSONObject);
			} else if(event.equals("addCity")) {
				String city_name=request.getParameter("cityName");
				City city=new City();
				city.setCity_name(city_name);
				CityDao cd=new CityDao();
				cd.addCity(city);
				response.sendRedirect("admin/viewCity.jsp");
			} else if(event.equals("delete_city")) {
				int city_id=Integer.parseInt(request.getParameter("city_id"));
				CityDao cd=new CityDao();
				boolean status=cd.deleteCity(city_id);
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(status);
			    out.print(JSONObject);
			} else if(event.equals("fatchCityByCityId")) {
				int city_id=Integer.parseInt(request.getParameter("city_id"));
				CityDao cityDao=new CityDao();
				List<City> city = cityDao.srotCityByCityId(city_id);
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(city);
			    out.print(JSONObject);
			}else if(event.equals("updateCity")) {
				int city_id=Integer.parseInt(request.getParameter("city_id"));
				String city_name=request.getParameter("CityName");
				City city=new City();
				city.setCity_id(city_id);
				city.setCity_name(city_name);
				CityDao cityDao=new CityDao();
				cityDao.updateCity(city);
				response.sendRedirect("admin/viewCity.jsp");
			}
	}

}

