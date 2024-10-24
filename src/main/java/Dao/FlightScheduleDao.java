package Dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import bean.FlightSchedule;
import helper.FactoryProvider;

public class FlightScheduleDao {
	//add flight schedule
	
	public void addFlightSchedule(FlightSchedule fs ) {
		try {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(fs);
			tx.commit();
		}catch (Exception e) {e.printStackTrace();}
	}
	
	
	
	//view FlightSchedule
			public List<FlightSchedule> viewFlightSchedule(){
				List<FlightSchedule> flightSchedulelist=new ArrayList<FlightSchedule>();
			 try {
				
				 Session session=FactoryProvider.getFactory().openSession(); 
				  Query query = session.createQuery("From FlightSchedule");
				  flightSchedulelist = query.list();
				 
				}catch(Exception ex) {ex.printStackTrace();}
			 	return flightSchedulelist ;
				
			}
	//view AvilableFlight viewAvilableFlights
			public List<FlightSchedule> viewAvilableFlights(FlightSchedule fs){
				List<FlightSchedule> flightSchedulelist=new ArrayList<FlightSchedule>();
			 try {
				
				 Session session=FactoryProvider.getFactory().openSession(); 
				 Transaction tx=session.beginTransaction();
				 Query query = session.createQuery(" FROM FlightSchedule a WHERE a.scdl_from=:from and a.scdl_to=:to and a.scdl_date=:dt");
				 query.setParameter("from", fs.getScdl_from());
				 query.setParameter("to", fs.getScdl_to());
				 query.setParameter("dt", fs.getScdl_date());
				 flightSchedulelist=query.list();
				 tx.commit();
				}catch(Exception ex) {ex.printStackTrace();}
			 	return flightSchedulelist ;
				
			}
			//Delete FlightSchedule
			public static boolean deleteFlightSchedule(int scdl_id){  
				 boolean status=false;
				try{  
					Session session=FactoryProvider.getFactory().openSession();
					Transaction tx=session.beginTransaction();
					FlightSchedule fs = session.get(FlightSchedule.class, scdl_id);   
					if(fs!=null) {
						session.delete(fs);
						tx.commit();
						status=true;
					}
					}catch(Exception e){System.out.println(e);}  
				return status;  
				}
			

			//viewFlightSchedule  details by Id
			public  List<FlightSchedule> srotFlightScheduleById(int scdl_id){
				System.out.println("Dao "+scdl_id);
				 List<FlightSchedule> fslist=new ArrayList<FlightSchedule>();
				 try {
					 Session session=FactoryProvider.getFactory().openSession();
					 FlightSchedule fs = session.get(FlightSchedule.class, scdl_id);
					 fslist.add(fs);
				}catch(Exception ex) {ex.printStackTrace();}
				return fslist ;
			}
			
			//update FlightSchedule
			public void updateFlightSchedule(FlightSchedule fs) {
			   try {
					Session session=FactoryProvider.getFactory().openSession();
					Transaction tx=session.beginTransaction();
					session.load(FlightSchedule.class, fs.getScdl_id());
					session.update(fs);
					tx.commit();
				}catch (Exception e) {e.printStackTrace();}
			}	
}
