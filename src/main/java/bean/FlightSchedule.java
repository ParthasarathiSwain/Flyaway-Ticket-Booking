package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="flight_schedule")
public class FlightSchedule {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		@Column(name="scdl_id")
		private int scdl_id;
		
		@Column(name="scdl_arrival")
		private String scdl_arrival;
		
		@Column(name="scdl_departure")
		private String scdl_departure;
		
		@Column(name="scdl_distance")
		private String scdl_distance;
		
		@Column(name="scdl_from")
		private String scdl_from;
		
		@Column(name="scdl_to")
		private String scdl_to;
		
		@Column(name="total_time")
		private String total_time;
		
		@Column(name="ticket_price")
		private String ticket_price;
		
		@Column(name="flight_name")
		private String flight_name;
		
		@Column(name="total_seats")
		private String total_seats;
		
		@Column(name="scdl_date")
		private String scdl_date;
		
		public String getScdl_date() {
			return scdl_date;
		}
		public void setScdl_date(String scdl_date) {
			this.scdl_date = scdl_date;
		}
		public String getTotal_seats() {
			return total_seats;
		}
		public void setTotal_seats(String total_seats) {
			this.total_seats = total_seats;
		}
		public String getFlight_name() {
			return flight_name;
		}
		public void setFlight_name(String flight_name) {
			this.flight_name = flight_name;
		}
		public int getScdl_id() {
			return scdl_id;
		}
		public void setScdl_id(int scdl_id) {
			this.scdl_id = scdl_id;
		}
		public String getScdl_arrival() {
			return scdl_arrival;
		}
		public void setScdl_arrival(String scdl_arrival) {
			this.scdl_arrival = scdl_arrival;
		}
		public String getScdl_departure() {
			return scdl_departure;
		}
		public void setScdl_departure(String scdl_departure) {
			this.scdl_departure = scdl_departure;
		}
		public String getScdl_distance() {
			return scdl_distance;
		}
		public void setScdl_distance(String scdl_distance) {
			this.scdl_distance = scdl_distance;
		}
		public String getScdl_from() {
			return scdl_from;
		}
		public void setScdl_from(String scdl_from) {
			this.scdl_from = scdl_from;
		}
		public String getScdl_to() {
			return scdl_to;
		}
		public void setScdl_to(String scdl_to) {
			this.scdl_to = scdl_to;
		}
		public String getTotal_time() {
			return total_time;
		}
		public void setTotal_time(String total_time) {
			this.total_time = total_time;
		}
		public String getTicket_price() {
			return ticket_price;
		}
		public void setTicket_price(String ticket_price) {
			this.ticket_price = ticket_price;
		}
		@Override
		public String toString() {
			return "FlightSchedule [scdl_id=" + scdl_id + ", scdl_arrival=" + scdl_arrival + ", scdl_departure="
					+ scdl_departure + ", scdl_distance=" + scdl_distance + ", scdl_from=" + scdl_from + ", scdl_to="
					+ scdl_to + ", total_time=" + total_time + ", ticket_price=" + ticket_price + ", flight_name="
					+ flight_name + ", total_seats=" + total_seats + ", scdl_date=" + scdl_date + "]";
		}
		
		
		
		
		
}
  