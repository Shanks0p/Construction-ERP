package com.DepartmentMenu;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EmployeeMenu.getset;
import com.database.DBconnect;

/**
 * Servlet implementation class DeptReport2
 */
@WebServlet("/DeptReport2")
public class DeptReport2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptReport2() {
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
		String weather = request.getParameter("weather");
		String wei = request.getParameter("wei");
		String aac = request.getParameter("aac");
		String ain = request.getParameter("ain");
		double wd = Double.parseDouble(request.getParameter("workd"));
		String description = request.getParameter("description");
		String equs = request.getParameter("equs");
		String matd = request.getParameter("matd");
		String matq = request.getParameter("matq");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try{
			Date sd = format.parse(request.getParameter("sd"));
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO reports VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, 0);
			ps1.setInt(2, getset.getPid());
			ps1.setDate(3, new java.sql.Date(sd.getTime()));
			ps1.setString(4,getset.getLname());
			ps1.setString(5,weather);
			ps1.setString(6,wei );
			ps1.setString(7,aac);
			ps1.setString(8,ain);
			ps1.setDouble(9, wd);
			ps1.setString(10, description);
			ps1.setString(11, equs);
			ps1.setString(12, matd);
			ps1.setString(13,matq);
			int rs = ps1.executeUpdate();
			
			if(rs>0)
			{
				response.sendRedirect("ReportS.html");
			}
			else
			{
				response.sendRedirect("ReportUn.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
