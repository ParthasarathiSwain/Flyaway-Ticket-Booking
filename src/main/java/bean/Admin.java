package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class Admin {
		@Id	
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="admin_id")
		private int admin_id;
		
		@Column(length=100,name="admin_name")
		private String admin_name;
		@Column(length=100,name="admin_email")
		private String admin_email;
		@Column(name="admin_password")
		private String admin_password;
		@Column(name="admin_phnum")
		private String admin_phnum;
	//setter & getter

		public int getAdmin_id() {
			return admin_id;
		}
		public void setAdmin_id(int admin_id) {
			this.admin_id = admin_id;
		}
		public String getAdmin_name() {
			return admin_name;
		}
		public void setAdmin_name(String admin_name) {
			this.admin_name = admin_name;
		}
		public String getAdmin_email() {
			return admin_email;
		}
		public void setAdmin_email(String admin_email) {
			this.admin_email = admin_email;
		}
		public String getAdmin_password() {
			return admin_password;
		}
		public void setAdmin_password(String admin_password) {
			this.admin_password = admin_password;
		}
		
		public String getAdmin_phnum() {
			return admin_phnum;
		}
		public void setAdmin_phnum(String admin_phnum) {
			this.admin_phnum = admin_phnum;
		}
		
		@Override
		public String toString() {
			return "Admin [admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_email=" + admin_email
					+ ", admin_password=" + admin_password + ", admin_phnum=" + admin_phnum
					+ "]";
		}
		

}
