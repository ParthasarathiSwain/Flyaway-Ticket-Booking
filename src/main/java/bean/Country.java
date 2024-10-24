package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="country")
public class Country {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="country_id")
	private int country_id;
	
	@Column(length=100,name="country_name")
	private String country_name;
	
	public int getCountry_id() {
		return country_id;
	}
	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	@Override
	public String toString() {
		return "Country [country_id=" + country_id + ", country_name=" + country_name + "]";
	}
	
	
}
