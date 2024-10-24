package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class Booking {
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="booking_id")
	private int booking_id;
	
	@Column(name="cusId")
	private int cusId;
	
	@Column(name="booking_fare")
	private int booking_fare;
	
	@Column(name="scdl_id")
	private int scdl_id;
	
	
	
	@Column(name="booking_date")
	private String booking_date;
	
	@Column(name="total_person")
	private int total_person;
	
	@Column(name="booking_class")
	private String booking_class;
	
	@Column(name="total_seats")
	private int total_seats;

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getCusId() {
		return cusId;
	}

	public void setCusId(int cusId) {
		this.cusId = cusId;
	}

	public int getBooking_fare() {
		return booking_fare;
	}

	public void setBooking_fare(int booking_fare) {
		this.booking_fare = booking_fare;
	}

	public int getScdl_id() {
		return scdl_id;
	}

	public void setScdl_id(int scdl_id) {
		this.scdl_id = scdl_id;
	}

	public String getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}

	public int getTotal_person() {
		return total_person;
	}

	public void setTotal_person(int total_person) {
		this.total_person = total_person;
	}

	public String getBooking_class() {
		return booking_class;
	}

	public void setBooking_class(String booking_class) {
		this.booking_class = booking_class;
	}

	public int getTotal_seats() {
		return total_seats;
	}

	public void setTotal_seats(int total_seats) {
		this.total_seats = total_seats;
	}

	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", cusId=" + cusId + ", booking_fare=" + booking_fare
				+ ", scdl_id=" + scdl_id + ", booking_date=" + booking_date + ", total_person=" + total_person
				+ ", booking_class=" + booking_class + ", total_seats=" + total_seats + "]";
	}

	
	
	
} 
 