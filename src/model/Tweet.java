package model;

import twitter4j.Status;

public class Tweet {
	private Status status;
	private double polarity;
	private String clean_data;
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	public double getPolarity() {
		return polarity;
	}
	public void setPolarity(double polarity) {
		this.polarity = polarity;
	}
	public String getClean_data() {
		return clean_data;
	}
	public void setClean_data(String clean_data) {
		this.clean_data = clean_data;
	}
}
