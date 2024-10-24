package Dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import bean.Admin;
import helper.FactoryProvider;


public class AdminDao {
	
	public void updateAdmin(Admin admin) {
		try {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			session.load(Admin.class, admin.getAdmin_id());
			session.update(admin);
			tx.commit();
		    
		}catch (Exception e) {e.printStackTrace();}
	}
		//add admin
	public void addAdmin(Admin admin) {
		try {
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
		    session.save(admin);
		    tx.commit();
		}catch (Exception e) {e.printStackTrace();}
	}
	
		//view admin
	public List<Admin> viewAdmins(){
		 List<Admin> adminlist=new ArrayList<Admin>();
	 try {
		 Session session=FactoryProvider.getFactory().openSession();
		 Query query = session.createQuery("From Admin");
		 adminlist = query.list();
		}catch(Exception ex) {ex.printStackTrace();}
	 	return adminlist ;
		
	}
	
	//delete admin
	public boolean deleteAdmin(int admin_id){  
		 boolean status=false;
		    try{  
		    	Session session=FactoryProvider.getFactory().openSession();
				Transaction tx=session.beginTransaction();
				Admin admin = session.get(Admin.class, admin_id); 
				if(admin!=null) {
					session.delete(admin);
					tx.commit();
					status=true;
				}
		    }catch(Exception e){System.out.println(e);}  
		  
		    return status;  
		}
	//view admin details by admin Id
	
		public List<Admin> srotAdminByEmpId(int admin_id){
		 List<Admin> adminlist=new ArrayList<Admin>();
		 try {
			 Session session=FactoryProvider.getFactory().openSession();
			 Admin admin = session.get(Admin.class, admin_id);
		     adminlist.add(admin);
		 }catch(Exception ex) {ex.printStackTrace();}
		return adminlist ;
		
	}
	public String getOldPassword(int admin_id) {
		  Session session=FactoryProvider.getFactory().openSession();
		  Query query = session.createQuery("SELECT a.admin_password FROM Admin a WHERE a.admin_id=:id");
		  query.setParameter("id", admin_id);
		 return (String)query.uniqueResult();
	}
	
	public void changePassword(String newPass,int admin_id) {
		 Session session=FactoryProvider.getFactory().openSession();
		 Transaction tx=session.beginTransaction();
		  Query query = session.createQuery("update Admin a set a.admin_password=:new WHERE a.admin_id=:id");
		  query.setParameter("new", newPass);
		  query.setParameter("id", admin_id);
		  query.executeUpdate();
		  tx.commit();
	}
}

		
