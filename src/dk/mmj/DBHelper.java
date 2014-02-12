package dk.mmj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBHelper 
{
	private static final String _URL = 
			"jdbc:mysql://localhost:3306/test";
	private Connection _conn = null;
	private Statement _statement = null;
	ResultSet _rs = null;
	
	public DBHelper()
	{
	   try {
			Class.forName("com.mysql.jdbc.Driver");
			_conn = DriverManager.getConnection(_URL, "root", "");
	        _statement = _conn.createStatement();      
	   } catch (Exception e) {
    	  e.printStackTrace();
       }	
	}
	
	
	public ResultSet executeQuery(String queryStr)
	{
		try {
			_rs = _statement.executeQuery(queryStr);
		} catch (SQLException e) {
			e.printStackTrace();
			_rs = null;
		} 
		
		return _rs;
	}
	
	
	public int executeNonQuery(String nonQueryStr)
	{
		int numberOfAffectedRows = 0;
		try {
			numberOfAffectedRows = _statement.executeUpdate(nonQueryStr);
		} catch (SQLException e) {
			e.printStackTrace();
			numberOfAffectedRows = 0;
		} 
		return numberOfAffectedRows;
	}
	
	
	public void close()
	{
		try 
		{
			if(_rs != null)
			{
			   _rs.close();
			
			}
			if(_conn != null)
			{
			   _conn.close();
		}
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}
