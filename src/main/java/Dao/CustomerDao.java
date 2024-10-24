package Dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import bean.Customer;
import helper.FactoryProvider;
public class CustomerDao {



	//register customer
	public boolean saveCustomer(Customer customer){  
		 boolean status=false;
		try{  
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			if(customer!=null) {
				session.save(customer);
				tx.commit();
				status=true;
			}
			}catch(Exception e){System.out.println(e);}  
		return status;  
		}
	// login validate
	public boolean loginValidate(String username,String password) {
		boolean status=false;
		try {
			 Session session=FactoryProvider.getFactory().openSession();
			 Transaction tx=session.beginTransaction();
			 Query q=  session.createQuery("FROM Customer a WHERE a.email = :username and a.password = :password");	
			 q.setParameter("username",username);
			 q.setParameter("password",password);
			 q.uniqueResult();
			 if(q!=null) {
				 tx.commit();
				 status=true;
			 }
		} catch (Exception e) {e.printStackTrace();}
		return status;
	}
	
	
	public int getCusId(String username,String password) {
		Session session=FactoryProvider.getFactory().openSession();
		Query query=  session.createQuery("SELECT a.cusId FROM Customer a WHERE a.email = :uname ");	
		query.setParameter("uname",username);
		return (int)query.uniqueResult();
}
	
}
