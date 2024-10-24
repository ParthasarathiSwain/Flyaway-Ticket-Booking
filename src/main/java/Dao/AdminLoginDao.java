package Dao;

import org.hibernate.Session;
import org.hibernate.query.Query;

import bean.Admin;
import helper.FactoryProvider;



public class AdminLoginDao {
	boolean status;
	public boolean validate(String username,String password) {
		Admin admin=null;
		try {
			 Session session=FactoryProvider.getFactory().openSession();
			 admin = (Admin) session.createQuery("FROM Admin a WHERE a.admin_email = :username").setParameter("username", username).uniqueResult();				 
			 if(admin!=null) {
				 status=true;
			 }
		} catch (Exception e) {e.printStackTrace();}
		return status;
	}
	
	public int getAdminId(String email,String Password) {
		
			  Session session=FactoryProvider.getFactory().openSession();
			  Query query = session.createQuery("SELECT a.admin_id FROM Admin a WHERE a.admin_email=:emailP");
			  query.setParameter("emailP", email);
			  
		
		   return (int)query.uniqueResult();
	}
}
