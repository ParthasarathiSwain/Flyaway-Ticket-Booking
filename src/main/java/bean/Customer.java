package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customer")
public class Customer {
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="cusId")
	private int cusId;
	
	@Column(length=100,name="cusName")
	private String cusName;
	
	@Column(length=12,name="mobileNo")
	private String mobileNo;
	
	@Column(length=10,name="password")
	private String password;
	
	@Column(length=100,name="email")
	private String email;
	
	@Column(length=200,name="address")
	private String address;
	
	public int getCusId() {
		return cusId;
	}
	public void setCusId(int cusId) {
		this.cusId = cusId;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Customer [cusId=" + cusId + ", cusName=" + cusName + ", mobileNo=" + mobileNo + ", password=" + password
				+ ", email=" + email + ", address=" + address + "]";
	}
	
}
