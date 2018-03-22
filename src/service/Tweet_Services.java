package service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import model.Tweet;
import model.Tweets;
import twitter4j.Query;
import twitter4j.Query.ResultType;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class Tweet_Services {

	public ArrayList<Tweet> getTweets(String q, ResultType r) {
		ArrayList<Tweet> tweets=new ArrayList<Tweet>();
		ConfigurationBuilder cb = new ConfigurationBuilder();
	    cb.setDebugEnabled(true).setOAuthConsumerKey("fHjvQrcIM9tQdmrln0nMFfSfF").setOAuthConsumerSecret("3t2EK3DLh2ItIi6gfZZEB6WSbl4H59GkxULVIgen0xPqNKw5PR")
	       .setOAuthAccessToken("364772577-QSnjZ3dsQjpVlVb9RTLa4xnbQ9iiDbu8W3qs4zb2").setOAuthAccessTokenSecret("VHPlMaKh9ybThlZPumJKvzwbIKbzYA9bPOBbBpNQb1XZh");
	    Twitter twitter = new TwitterFactory(cb.build()).getInstance();
		Query query = new Query(q);
		query.count(100);
		query.setLang("en");
		query.setResultType(r);
		try {
			QueryResult queryResultObject = twitter.search(query);
			for(Status s: queryResultObject.getTweets()){
				Tweet t=new Tweet();
				t.setStatus(s);
				tweets.add(t);
			}
		} catch (TwitterException e) {
			
			e.printStackTrace();
		}
		return tweets;
		
	}

	public boolean cleanTweets(ArrayList<Tweet> tweets){
		for(Tweet t: tweets){
			String data=t.getStatus().getText();
			 data=data.replaceAll("\\W+", " ");
			 data+="\n-9999+\n";
		     t.setClean_data(data);
		}
		return true;
	}
	
	public ArrayList<Tweet> rankTweets(ArrayList<Tweet> tweets){
		Collections.sort(tweets, new Comparator<Tweet>() {

			@Override
			public int compare(Tweet o1, Tweet o2) {
				return Double.compare(o1.getPolarity(), o2.getPolarity());
			}
			
		});
		return tweets;
	}
	
	public Tweets processQuerry(String querry){
		Tweets temp=new Tweets();
		ArrayList<Tweet> tweets=getTweets(querry, ResultType.recent);
		cleanTweets(tweets);
		for(Tweet t: tweets){
			try {
				@SuppressWarnings("resource")
				Socket socket=new Socket("localhost",1012);
				DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
				dOut.write((t.getClean_data()).getBytes());
				dOut.flush();
				BufferedReader dIn=new BufferedReader(new InputStreamReader(socket.getInputStream()));
				String data=dIn.readLine();
				if(Double.parseDouble(data)>0)
					temp.getPositive().add(t);
				else if(Double.parseDouble(data)<0)
					temp.getNegative().add(t);
				
			}
			catch (IOException e) {
	    		System.out.println(e);
	    	}
		}
		int total=temp.getPositive().size()+temp.getNegative().size();
		float pos_percent=temp.getPositive().size();
		 pos_percent/=total;
		 pos_percent*=100;
		float neg_percent=temp.getNegative().size();
		neg_percent/=total;
		neg_percent*=100;
		
		temp.setPos_percent(Math.round(pos_percent));
		temp.setNeg_percent(Math.round(neg_percent));
		
		return temp;
	}
}
