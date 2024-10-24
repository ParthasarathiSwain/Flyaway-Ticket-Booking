package Dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import bean.Flight;
import helper.FactoryProvider;

public class FlightDao {
	//add Flight
	public void addFlight(Flight flight ) {
		try {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(flight);
			tx.commit();
		    
		}catch (Exception e) {e.printStackTrace();}
	}
	
	//view Flight
	public List<Flight> viewFlight(){
		 List<Flight> flightlist=new ArrayList<Flight>();
	 try {
		 Session session=FactoryProvider.getFactory().openSession();
		 Query query = session.createQuery("From Flight");
		 flightlist = query.list();
		}catch(Exception ex) {ex.printStackTrace();}
	 	return flightlist ;
		
	}

	//Delete Flight
	public boolean deleteFlight(int flight_id){  
		 boolean status=false;
		 	Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			Flight flight = session.get(Flight.class, flight_id); 
			if(flight!=null) {
				session.delete(flight);
				tx.commit();
				status=true;
			}
	    return status;    
	}
	//viewFlight details by Id
	
	public  List<Flight> srotFlightByFlightId(int flight_id){
		List<Flight> flightlist=new ArrayList<Flight>();
			 try {
				 Session session=FactoryProvider.getFactory().openSession();
				 Flight flight = session.get(Flight.class, flight_id);
				 flightlist.add(flight);
			 }catch(Exception ex) {ex.printStackTrace();}
		 return flightlist ;
	}

	//update Flight
	public void updateFlight(Flight flight) {
		  try {
				Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				session.load(Flight.class, flight.getFlight_id());
				session.update(flight);
				tx.commit();
		 }catch (Exception e) {e.printStackTrace();}
	}	
}

	

