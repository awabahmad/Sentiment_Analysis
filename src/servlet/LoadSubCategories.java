package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import service.Tweet_Services;

/**
 * Servlet implementation class LoadSubCategories
 */
@WebServlet("/LoadSubCategories")
public class LoadSubCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadSubCategories() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("compare.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="SELECT product FROM data WHERE category='"+request.getParameter("category")+"'";
		try {
			PreparedStatement statement = (PreparedStatement) db.JDBC.getConnection().prepareStatement(sql);
			ResultSet set=(ResultSet) statement.executeQuery(sql);
			ArrayList<String> data=new ArrayList<String>();
			if(set.isBeforeFirst())
				while(set.next())
					data.add(set.getString("product"));
			request.setAttribute("data", data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("compare.jsp").forward(request, response);
	}

}
