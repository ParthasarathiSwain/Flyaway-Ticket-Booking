package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Dao.BookingDao;
import bean.Booking;
import bean.FlightSchedule;
import bean.PaymentDetails;
@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookingServlet() {
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String event=request.getParameter("event");
		
		if(event.equals("ticketbooking")) {
			HttpSession session = request.getSession(true);
			int scld_id=Integer.parseInt(request.getParameter("sc_id"));
			int cusId=Integer.parseInt((session.getAttribute("cusId")).toString());
			int total_person=Integer.parseInt(request.getParameter("totalperson"));
			int total_seats=total_person;
			int booking_fare=Integer.parseInt(request.getParameter("totalPrice"));
			String booking_class=request.getParameter("option");
			String booking_date=request.getParameter("date");
			Booking bk=new Booking();
			bk.setBooking_class(booking_class);
			bk.setBooking_date(booking_date);
			bk.setBooking_fare(booking_fare);
			bk.setTotal_seats(total_seats);
			bk.setCusId(cusId);
			bk.setScdl_id(scld_id);
			bk.setTotal_person(total_person);
			BookingDao bkDao=new BookingDao();
			bkDao.ticketBooking(bk);
			response.sendRedirect("payment.jsp?total="+booking_fare);
		}
		else if(event.equals("addpayment")) {
			String acc_holder_name=request.getParameter("hname");
			String card_num=request.getParameter("cnum");
			String ex_date=request.getParameter("exdate");
			String cvv_code=request.getParameter("cvv");
			PaymentDetails pd=new PaymentDetails();
			pd.setAcc_holder_name(acc_holder_name);
			pd.setCard_num(card_num);
			pd.setCvv_code(cvv_code);
			pd.setEx_date(ex_date);
			BookingDao bkDao=new BookingDao();
			bkDao.addPayment(pd);
			response.sendRedirect("viewticket.jsp");
		}
		else if(event.equals("viewTicket")) {
			BookingDao bkDao=new BookingDao();
			int booking_id=bkDao.maxIndex();
			List<Booking> bklist = bkDao.viewTicket(booking_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
		    Gson  gson = gsonBuilder.create();
		    String JSONObject = gson.toJson(bklist);
		System.out.print(JSONObject);
			out.print(JSONObject);
		}
	}

}
