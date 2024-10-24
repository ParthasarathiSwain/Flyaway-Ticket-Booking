package Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import bean.Booking;
import bean.FlightSchedule;
import bean.PaymentDetails;
import helper.FactoryProvider;

public class BookingDao {
	// add Ticket
		public void ticketBooking(Booking bk) {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(bk);
			tx.commit();
		}
		// add payment
				public void addPayment(PaymentDetails pd) {
					Session session=FactoryProvider.getFactory().openSession();
					Transaction tx=session.beginTransaction();
					session.save(pd);
					tx.commit();
				}
		public int maxIndex() {
			 Session session=FactoryProvider.getFactory().openSession();
			 Query query = session.createQuery("SELECT max(booking_id) FROM Booking ");
			 return (int)query.uniqueResult(); 
		}
		
		public List<Booking> viewTicket(int bk){
			List<Booking> bklist=new ArrayList<Booking>();
		 try {
			
			 Session session=FactoryProvider.getFactory().openSession(); 
			 Transaction tx=session.beginTransaction();
			 Query query = session.createQuery(" Select c.cusName,c.email,f.flight_name,f.scdl_departure,f.scdl_arrival,f.scdl_from,f.scdl_to,f.scdl_distance,b.booking_id,b.booking_fare,b.booking_date,b.total_person,b.booking_class FROM Booking b inner join Customer c on b.cusId=c.cusId inner join FlightSchedule f on b.scdl_id=f.scdl_id WHERE b.booking_id=:bookid ");
			 query.setParameter("bookid", bk); 
			 bklist=query.list();
			 tx.commit();
			}catch(Exception ex) {ex.printStackTrace();}
		 	return bklist ;
			
		}
}
