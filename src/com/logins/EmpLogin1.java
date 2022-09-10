package com.logins;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EmployeeMenu.getset;
import com.database.DBconnect;

/**
 * Servlet implementation class EmpLogin1
 */
@WebServlet("/EmpLogin1")
public class EmpLogin1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpLogin1() {
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
		int eid = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		try{
			Connection con = DBconnect.dbConnect();
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM employee WHERE id=? AND password=?");
			ps1.setInt(1, eid);
			ps1.setString(2, password);
			getset.setEid(eid);
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				getset.setLname(rs.getString(2));
				response.sendRedirect("EmpMenu.html");
				
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
