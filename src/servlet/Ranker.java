package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import model.Tweets;
import service.Tweet_Services;

/**
 * Servlet implementation class Ranker
 */
@WebServlet("/Ranker")
public class Ranker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Ranker() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="SELECT DISTINCT category FROM data";
		try {
			ArrayList<String> cat=new ArrayList<String>();
			PreparedStatement statement = (PreparedStatement) db.JDBC.getConnection().prepareStatement(sql);
			ResultSet set=(ResultSet) statement.executeQuery(sql);
			if(set.isBeforeFirst())
				while(set.next())
					cat.add(set.getString("category"));
			request.setAttribute("cat", cat);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.getRequestDispatcher("rank.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="SELECT product FROM data WHERE category='"+request.getParameter("category")+"'";
		try {
			ArrayList<String> products=new ArrayList<String>();
			PreparedStatement statement = (PreparedStatement) db.JDBC.getConnection().prepareStatement(sql);
			ResultSet set=(ResultSet) statement.executeQuery(sql);
			Tweet_Services services=new Tweet_Services();
			if(set.isBeforeFirst())
				while(set.next())
					products.add(set.getString("product"));
			ArrayList<Tweets> tweets=new ArrayList<Tweets>();
			for(String temp: products){
				Tweets temp2=new Tweets();
				temp2=services.processQuerry(temp);
				temp2.setName(temp);
				tweets.add(temp2);
			}
			
			tweets.sort(Comparator.comparingInt(Tweets::getNeg_percent));
			request.setAttribute("data", tweets);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("rank.jsp").forward(request, response);
	}

}
