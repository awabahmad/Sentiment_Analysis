package servlet;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import model.Tweet;
import service.Tweet_Services;
import twitter4j.Query.ResultType;


@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Search() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String querry=request.getParameter("querry");
		ArrayList<Tweet> positive=new ArrayList<Tweet>();
		ArrayList<Tweet> negative=new ArrayList<Tweet>();
		Tweet_Services services=new Tweet_Services();
		ArrayList<Tweet> tweets=services.getTweets(querry, ResultType.recent);
		services.cleanTweets(tweets);
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
					positive.add(t);
				else if(Double.parseDouble(data)<0)
					negative.add(t);
				
			}
			catch (IOException e) {
	    		System.out.println(e);
	    	}
		}
		positive=services.rankTweets(positive);
		negative=services.rankTweets(negative);
		int total=positive.size()+negative.size();
		float pos_percent=positive.size();
		 pos_percent/=total;
		 pos_percent*=100;
		float neg_percent=negative.size();
		neg_percent/=total;
		neg_percent*=100;
		request.setAttribute("positive_tweets", positive);
		request.setAttribute("negative_tweets", negative);
		request.setAttribute("pos_percentage", pos_percent);
		request.setAttribute("neg_percent", neg_percent);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
