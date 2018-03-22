package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.AbstractDocument.Content;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.oracle.jrockit.jfr.ContentType;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button=request.getParameter("button");
		if(button.equals("Login")){
			String email=request.getParameter("email");
			String pass=request.getParameter("password");
			String sql="SELECT username,password FROM user WHERE email='"+email+"'";
			try {
				PreparedStatement statement=(PreparedStatement) db.JDBC.getConnection().prepareStatement(sql);
				ResultSet set=(ResultSet) statement.executeQuery(sql);
				if(set.isBeforeFirst()){
				while(set.next()){
					if(set.getString("password").equals(pass)){
						 HttpSession session=request.getSession(true); 
						 session.setAttribute("name",set.getString("username"));
					     response.sendRedirect("index.jsp");
					}
					else{
						request.setAttribute("Status", "Invalid Login Details");
						request.getRequestDispatcher("index.jsp").forward(request, response);
						}
					}
				}else{
					   request.setAttribute("Status", "Invalid Login Details");
					   request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(button.equals("Create account")){
				String sql="INSERT INTO user (`username`, `password`, `email`) VALUES (?,?,?)";
				try {
					PreparedStatement statement=(PreparedStatement) db.JDBC.getConnection().prepareStatement(sql);
					statement.setString(1, request.getParameter("cusername"));
					statement.setString(2, request.getParameter("cpassword"));
					statement.setString(3, request.getParameter("cemail"));
					statement.executeUpdate();
					HttpSession session=request.getSession(true);  
				    session.setAttribute("name",request.getParameter("cusername"));
				    response.sendRedirect("index.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
	}
}
