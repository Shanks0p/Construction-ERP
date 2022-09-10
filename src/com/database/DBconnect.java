package com.database;

import java.sql.*;

public class DBconnect {
	static Connection con = null;
	public static Connection dbConnect() {
		if(con==null)
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/consterp","root","");
				System.out.println("Connection established...");
			} 
			catch (Exception e)
			{
				System.out.println(e);
				e.printStackTrace();
			}
		}
		else
		{
			System.out.println("Connection not established...");
		}
		
		return con;
	}

}
