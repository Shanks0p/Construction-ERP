package com.logins;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EmployeeMenu.getset;
import com.database.DBconnect;

/**
 * Servlet implementation class Adminlogin1
 */
@WebServlet("/Adminlogin1")
public class Adminlogin1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminlogin1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try{
			Connection con = DBconnect.dbConnect();
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM admin WHERE Email=? AND password=?");
			ps1.setString(1, email);
			ps1.setString(2, password);
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				getset.setLname("Admin");
				response.sendRedirect("AdminMenu.html");
			}
			else
			{
				response.sendRedirect("InvNum.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
