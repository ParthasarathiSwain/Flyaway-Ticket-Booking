package bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="paymentdetails")
public class PaymentDetails {
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="acc_id")
	private int acc_id;
	
	@Column(name="acc_holder_name")
	private String  acc_holder_name;
	
	@Column(name="card_num")
	private String card_num;
	
	@Column(name="ex_date")
	private String ex_date;
	
	@Column(name="cvv_code")
	private String cvv_code;
	
	@Column(name="booking_id")
	private int booking_id;

	public int getAcc_id() {
		return acc_id;
	}

	public void setAcc_id(int acc_id) {
		this.acc_id = acc_id;
	}

	public String getAcc_holder_name() {
		return acc_holder_name;
	}

	public void setAcc_holder_name(String acc_holder_name) {
		this.acc_holder_name = acc_holder_name;
	}

	public String getCard_num() {
		return card_num;
	}

	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}

	public String getEx_date() {
		return ex_date;
	}

	public void setEx_date(String ex_date) {
		this.ex_date = ex_date;
	}

	public String getCvv_code() {
		return cvv_code;
	}

	public void setCvv_code(String cvv_code) {
		this.cvv_code = cvv_code;
	}

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	@Override
	public String toString() {
		return "AccountDetails [acc_id=" + acc_id + ", acc_holder_name=" + acc_holder_name + ", card_num=" + card_num
				+ ", ex_date=" + ex_date + ", cvv_code=" + cvv_code + ", booking_id=" + booking_id + "]";
	}
	
	
}
