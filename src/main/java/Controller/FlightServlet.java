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
import Dao.FlightDao;
import bean.Flight;

@WebServlet("/flight")
public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FlightServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		
		 if(event.equals("addFlight")) {
			String flight_name=request.getParameter("flightName");
			String flight_no=request.getParameter("flightNum");
			Flight flight=new Flight();
			flight.setFlight_name(flight_name);
			flight.setFlight_no(flight_no);
			FlightDao flightDao=new FlightDao();
			flightDao.addFlight(flight);
			response.sendRedirect("admin/viewFlights.jsp");
		}
		 else if(event.equals("viewFlight")) {
				FlightDao flightDao=new FlightDao();
				List<Flight> flight = flightDao.viewFlight();
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(flight);
			    out.print(JSONObject);
			}
		 else if(event.equals("delete_flight")) {
				int flight_id=Integer.parseInt(request.getParameter("flight_id"));
				FlightDao flightDao=new FlightDao();
				boolean status=flightDao.deleteFlight(flight_id);
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(status);
			    out.print(JSONObject);
			}
		 else if(event.equals("fatchFlightByflightId")) {
				int flight_id=Integer.parseInt(request.getParameter("flight_id"));
				FlightDao flightDao=new FlightDao();
				List<Flight> flight = flightDao.srotFlightByFlightId(flight_id);
				GsonBuilder gsonBuilder = new GsonBuilder();
			    Gson  gson = gsonBuilder.create();
			    String JSONObject = gson.toJson(flight);
			    System.out.print(JSONObject);
				out.print(JSONObject);
			}else if(event.equals("updateFlight")) {
				int flight_id=Integer.parseInt(request.getParameter("flightId"));
				String flight_name=request.getParameter("flightName");
				String flight_no=request.getParameter("flightNum");
				Flight flight=new Flight();
				flight.setFlight_id(flight_id);
				flight.setFlight_name(flight_name);
				flight.setFlight_no(flight_no);
				FlightDao flightDao=new FlightDao();
				flightDao.updateFlight(flight);
				response.sendRedirect("admin/viewFlights.jsp");
			}
	}

}
