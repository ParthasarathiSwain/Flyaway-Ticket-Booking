package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="flight")
public class Flight {
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="flight_id")
    private int flight_id;
	@Column(name="flight_name")
    private String flight_name;
	@Column(name="flight_no")
    private String flight_no;
  
public int getFlight_id() {
	return flight_id;
}
public void setFlight_id(int flight_id) {
	this.flight_id = flight_id;
}

public String getFlight_name() {
	return flight_name;
}
public void setFlight_name(String flight_name) {
	this.flight_name = flight_name;
}
public String getFlight_no() {
	return flight_no;
}
public void setFlight_no(String flight_no) {
	this.flight_no = flight_no;
}
@Override
public String toString() {
	return "Flight [flight_id=" + flight_id + ", flight_name=" + flight_name
			+ ", flight_no=" + flight_no + "]";
}
   
   
   
}
