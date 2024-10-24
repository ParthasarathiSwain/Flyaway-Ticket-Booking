package Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import bean.Country;
import helper.FactoryProvider;



public class CountryDao {
	//add Country
	public void addCountry(Country country ) {
		try {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.save(country);
			tx.commit();
		}catch (Exception e) {e.printStackTrace();}
	}
		
	//view Country
		public List<Country> viewCountry(){
			List<Country> countrylist=new ArrayList<Country>();
			try {
				  Session session=FactoryProvider.getFactory().openSession(); 
				  Query query = session.createQuery("From Country");
				  countrylist = query.list();
				}catch(Exception ex) {ex.printStackTrace();}
			return countrylist ;
				
		}
				
		//Delete Country
		public static boolean deleteCountry(int country_id){  
			 boolean status=false;
			try{  
				Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				Country country = session.get(Country.class, country_id);   
				if(country!=null) {
					session.delete(country);
					tx.commit();
					status=true;
				}
				}catch(Exception e){System.out.println(e);}  
			return status;  
			}
		
		
		//viewCountry details by Id
		public  List<Country> srotCountryByCounId(int country_id){
			 List<Country> countrylist=new ArrayList<Country>();
			 try {
				 Session session=FactoryProvider.getFactory().openSession();
				 Country country = session.get(Country.class, country_id);
				 countrylist.add(country);
			}catch(Exception ex) {ex.printStackTrace();}
			return countrylist ;
		}
			
		//update Country
			public void updateCountry(Country country) {
			   try {
					Session session=FactoryProvider.getFactory().openSession();
					Transaction tx=session.beginTransaction();
					session.load(Country.class, country.getCountry_id());
					session.update(country);
					tx.commit();
				}catch (Exception e) {e.printStackTrace();}
			}	
}
