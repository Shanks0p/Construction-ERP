package com.EmployeeMenu;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBconnect;

/**
 * Servlet implementation class AddTEmp3
 */
@WebServlet("/AddTEmp3")
public class AddTEmp3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTEmp3() {
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
		Connection con = DBconnect.dbConnect();
		int tid=0;
		String title = request.getParameter("title");
		String priority = request.getParameter("priority");
		String location = request.getParameter("location");
		int mpr = Integer.parseInt(request.getParameter("manpr"));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String assigner = getset.getLname();
		
		try{
			Date sd = format.parse(request.getParameter("sd"));
			Date ed = format.parse(request.getParameter("ed"));
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO emptask VALUES (?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, tid);
			ps1.setInt(2, getset.getEid());
			ps1.setInt(3, getset.getPid());
			ps1.setString(4,title );
			ps1.setString(5,assigner);
			ps1.setString(6,priority );
			ps1.setString(7,location );
			ps1.setDate(8, new java.sql.Date(sd.getTime()));
			ps1.setDate(9, new java.sql.Date(ed.getTime()));
			ps1.setInt(10, mpr);
			ps1.setString(11, getset.getRde());
			int rs = ps1.executeUpdate();
			
			if(rs>0)
			{
				response.sendRedirect("AddTEmp1.jsp");
			}
			else
			{
				response.sendRedirect("AddTEmp2.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
