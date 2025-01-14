package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="city")
public class City {
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="city_id")
	private int city_id;
	
	@Column(length=100,name="city_name")
	private String city_name;
 
 
public int getCity_id() {
	return city_id;
}
public void setCity_id(int city_id) {
	this.city_id = city_id;
}
public String getCity_name() {
	return city_name;
}
public void setCity_name(String city_name) {
	this.city_name = city_name;
}
@Override
public String toString() {
	return "City [city_id=" + city_id + ", city_name=" + city_name + "]";
}
 
 
}
