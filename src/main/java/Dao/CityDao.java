package Dao;


import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import bean.City;
import helper.FactoryProvider;


public class CityDao {
	//view City
	public List<City> viewCity(){
		List<City> citylist=new ArrayList<City>();
	 try {
		 Session session=FactoryProvider.getFactory().openSession();
		 Query query = session.createQuery("From City");
		 citylist = query.list();
		}catch(Exception ex) {ex.printStackTrace();}
	 	return citylist ;
		
	}
	
	// add city
	public void addCity(City city) {
		Session session=FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		session.save(city);
		tx.commit();
	}
	

	//Delete City
	public boolean deleteCity(int city_id){  
		 boolean status=false;
		 	Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			City city = session.get(City.class, city_id); 
			if(city!=null) {
				session.delete(city);
				tx.commit();
				status=true;
			}
	    return status;  
	}

	//viewCountry details by Id
	
	public  List<City> srotCityByCityId(int city_id){
		 List<City> citylist=new ArrayList<City>();
			 try {
				 Session session=FactoryProvider.getFactory().openSession();
				 City city = session.get(City.class, city_id);
				 citylist.add(city);
				  
			}catch(Exception ex) {ex.printStackTrace();}
		return citylist ;
	
   }
	//update City
	public void updateCity(City city) {
		try {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.load(City.class, city.getCity_id());
			session.update(city);
			tx.commit();
		}catch (Exception e) {e.printStackTrace();}
	}	
}


