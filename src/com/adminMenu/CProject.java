package com.adminMenu;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;




import com.database.DBconnect;


//This annotation defines the maximum
//file size which can be taken.
@MultipartConfig(maxFileSize = 16177215)


/**
 * Servlet implementation class CProject
 */
@WebServlet("/CProject")
public class CProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CProject() {
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
		String address = request.getParameter("address1");
		Part part = request.getPart("image1");
		InputStream inputimg = null;
		inputimg = part.getInputStream();
		
		try{
			Connection con = DBconnect.dbConnect();
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO project VALUES(?,?,?,?)");
			ps1.setInt(1, id);
			ps1.setString(2, name);
			ps1.setString(3, address);
			ps1.setBlob(4, inputimg);
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
