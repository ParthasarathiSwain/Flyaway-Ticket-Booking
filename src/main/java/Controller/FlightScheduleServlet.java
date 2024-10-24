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
import Dao.FlightScheduleDao;
import bean.FlightSchedule;

@WebServlet("/schedulde")
public class FlightScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FlightScheduleServlet() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		System.out.println(event);
		if(event.equals("addFlightSchedulde")) {
			String scdl_from=request.getParameter("from");
			String flight_name=request.getParameter("fname");
			String scdl_arrival=request.getParameter("arrival");
			String scdl_to=request.getParameter("to");
			String scdl_departure=request.getParameter("deptarture");
			String scdl_distance=request.getParameter("totaldistance");
			String total_time=request.getParameter("totalTime");
			String ticket_price=request.getParameter("ticketprice");
			String total_seats=request.getParameter("totalseats");
			String scdl_date=request.getParameter("scdldate");
			FlightSchedule fs=new FlightSchedule();
			fs.setScdl_arrival(scdl_arrival);
			fs.setFlight_name(flight_name);
			fs.setScdl_departure(scdl_departure);
			fs.setScdl_distance(scdl_distance);
			fs.setScdl_to(scdl_to);
			fs.setScdl_from(scdl_from);
			fs.setTicket_price(ticket_price);
			fs.setTotal_time(total_time);
			fs.setTotal_seats(total_seats);
			fs.setScdl_date(scdl_date);
			
			FlightScheduleDao ssdlDao=new FlightScheduleDao();
			ssdlDao.addFlightSchedule(fs);
			response.sendRedirect("admin/viewFlightSchedule.jsp");
		}else if(event.equals("viewFlightSche")) {
			FlightScheduleDao ssdlDao=new FlightScheduleDao();
			List<FlightSchedule> flightSchedule = ssdlDao.viewFlightSchedule();
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(flightSchedule);
			out.print(JSONObject);
		}else if(event.equals("delete_flightSchedule")) {
			int scdl_id=Integer.parseInt(request.getParameter("scdl_id"));
			boolean status=FlightScheduleDao.deleteFlightSchedule(scdl_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(status);
	//      System.out.print(JSONObject);
			out.print(JSONObject);
		}else if(event.equals("fatchFlightSchedule")) {
			int scdl_id=Integer.parseInt(request.getParameter("scdl_id"));
			FlightScheduleDao fsd=new FlightScheduleDao();
			List<FlightSchedule> flightSchedule = fsd.srotFlightScheduleById(scdl_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(flightSchedule);
	 //  	System.out.print(JSONObject);
			out.print(JSONObject);
		}
		else if(event.equals("updateFlightSchedulde")) {
			int scdl_id=Integer.parseInt(request.getParameter("scdl_id"));
			String scdl_from=request.getParameter("from");
			String flight_name=request.getParameter("fname");
			String scdl_arrival=request.getParameter("arrival");
			String scdl_to=request.getParameter("to");
			String scdl_departure=request.getParameter("deptarture");
			String scdl_distance=request.getParameter("totaldistance");
			String total_time=request.getParameter("totalTime");
			String ticket_price=request.getParameter("ticketprice");
			String total_seats=request.getParameter("totalseats");
			String scdl_date=request.getParameter("scdldate");
			FlightSchedule fs=new FlightSchedule();
			fs.setScdl_id(scdl_id);		
			fs.setScdl_arrival(scdl_arrival);
			fs.setFlight_name(flight_name);
			fs.setScdl_departure(scdl_departure);
			fs.setScdl_distance(scdl_distance);
			fs.setScdl_to(scdl_to);
			fs.setScdl_from(scdl_from);
			fs.setTicket_price(ticket_price);
			fs.setTotal_time(total_time);
			fs.setTotal_seats(total_seats);
			fs.setScdl_date(scdl_date);
			FlightScheduleDao ssdlDao=new FlightScheduleDao();
			ssdlDao.updateFlightSchedule(fs);
			response.sendRedirect("admin/viewFlightSchedule.jsp");
		}
		else if(event.equals("viewAvilableFlight")){
			String scdl_from=request.getParameter("source");
			String scdl_to=request.getParameter("destination");
			String scdl_date=request.getParameter("scdldate");
			FlightSchedule fs=new FlightSchedule();
			fs.setScdl_from(scdl_from);
			fs.setScdl_to(scdl_to);
			fs.setScdl_date(scdl_date);
			FlightScheduleDao ssdlDao=new FlightScheduleDao();
			List<FlightSchedule> flightSchedule = ssdlDao.viewAvilableFlights(fs);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(flightSchedule);
		    out.print(JSONObject);
		}
		else if(event.equals("getScheduleFlight")){
			System.out.println("servlet "+event);
			int scdl_id=Integer.parseInt(request.getParameter("scdl_id"));
			System.out.println("servlet "+scdl_id);
			FlightScheduleDao ssdlDao=new FlightScheduleDao();
			List<FlightSchedule> flightSchedule = ssdlDao.srotFlightScheduleById(scdl_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(flightSchedule);
		    System.out.println(JSONObject);
		    out.print(JSONObject);
		}
	}

}
