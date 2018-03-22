package servlet;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import model.Tweet;
import model.Tweets;
import service.Tweet_Services;
import twitter4j.Query.ResultType;

/**
 * Servlet implementation class Compare
 */
@WebServlet("/Compare")
public class Compare extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Compare() {
        super();
        // TODO Auto-generated constructor stub
    }


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
		request.getRequestDispatcher("compare.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String compare1=request.getParameter("compare1");
		String compare2=request.getParameter("compare2");
		Tweet_Services services=new Tweet_Services();
		Tweets comp1=services.processQuerry(compare1);
		Tweets comp2=services.processQuerry(compare2);
		
		if(comp1.getPos_percent()>=comp2.getPos_percent()){
				request.setAttribute("better_name", compare1);
				request.setAttribute("better_percent", comp1.getPos_percent());
		}else if(comp1.getPos_percent()<comp2.getPos_percent()){
				request.setAttribute("better_name", compare2);
				request.setAttribute("better_percent", comp2.getPos_percent());
		}
		request.setAttribute("compare1", compare1);
		request.setAttribute("compare2", compare2);
		request.setAttribute("compare1_negative", comp1.getNegative());
		request.setAttribute("compare2_negative", comp2.getNegative());
		request.getRequestDispatcher("compare.jsp").forward(request, response);
	}
	

}
