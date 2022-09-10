package com.adminMenu;

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
 * Servlet implementation class comment1
 */
@WebServlet("/comment1")
public class comment1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public comment1() {
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
		String comment = request.getParameter("cbox");
		int cid = 0;
		Connection con = DBconnect.dbConnect();
		try
		{
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO comment VALUES(?,?,?,?)");
			ps1.setInt(1, cid);
			ps1.setInt(2, getset.getPid());
			ps1.setString(3, getset.getLname());
			ps1.setString(4, comment);
			int rs = ps1.executeUpdate();
			if(rs>0)
			{
				response.sendRedirect("Comment.jsp");
			}
			else
			{
				response.sendRedirect("ccomment.html");
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
