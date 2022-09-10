package com.adminMenu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBconnect;

/**
 * Servlet implementation class AddEmp1
 */
@WebServlet("/AddEmp1")
public class AddEmp1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmp1() {
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
		int id = 0;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contact = request.getParameter("number");
		String password = request.getParameter("pass");
		String emgcontact = request.getParameter("ecn");
		String dept = request.getParameter("EmpDept");		
		String address = request.getParameter("address");
		try{
			Connection con = DBconnect.dbConnect();
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO employee VALUES(?,?,?,?,?,?,?,?)");
			ps1.setInt(1, id);
			ps1.setString(2, name);
			ps1.setString(3, email);
			ps1.setString(4, contact);
			ps1.setString(5, password);
			ps1.setString(6, emgcontact);
			ps1.setString(7, dept);
			ps1.setString(8, address);
			int rs = ps1.executeUpdate();
			if(rs>0)
			{
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
