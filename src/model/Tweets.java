package model;

import java.util.ArrayList;

public class Tweets {
	private String name;
	private ArrayList<Tweet> positive;
	private ArrayList<Tweet> negative;
	private int pos_percent,neg_percent;
	public Tweets(){
		positive=new ArrayList<Tweet>();
		negative=new ArrayList<Tweet>();
	}
	public ArrayList<Tweet> getPositive() {
		return positive;
	}
	public void setPositive(ArrayList<Tweet> positive) {
		this.positive = positive;
	}
	public ArrayList<Tweet> getNegative() {
		return negative;
	}
	public void setNegative(ArrayList<Tweet> negative) {
		this.negative = negative;
	}
	public int getPos_percent() {
		return pos_percent;
	}
	public void setPos_percent(int pos_percent) {
		this.pos_percent = pos_percent;
	}
	public int getNeg_percent() {
		return neg_percent;
	}
	public void setNeg_percent(int neg_percent) {
		this.neg_percent = neg_percent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
