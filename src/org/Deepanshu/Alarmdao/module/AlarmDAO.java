package org.Deepanshu.Alarmdao.module;

import java.sql.*;

import org.Deepanshu.Alarm.dto.Alarm;
public class AlarmDAO 
{
    private Connection GetConnection() throws Exception
    {
    	String url="jdbc:postgresql://localhost:5432/Alarm";
    	String username="postgres";
    	String password="123456";
    	Class.forName("org.postgresql.Driver");
    	Connection conn=DriverManager.getConnection(url,username,password);
    	return conn;
    }
    public int Insert(Alarm alarm) throws Exception 
    {
    	int status=0;
    	try
    	{
    		String query="Insert into alarm2 values(?,?,?,?,?,?,?)";
    		Connection conn=GetConnection();
    		PreparedStatement psmt=conn.prepareStatement(query);
    		psmt.setString(1,alarm.getMname());
    		psmt.setString(2,alarm.getIp());
    		psmt.setString(3,alarm.getPort());
    		psmt.setString(4, alarm.getStatus());
    		psmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
    		psmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
    		psmt.setString(7,alarm.getCategory());
    		status=psmt.executeUpdate();
    		psmt.close();
    		conn.close();
    	}
    	catch(SQLException e)
    	{
    		e.printStackTrace();
    	}
    	if(status>0)
    	{
    		System.out.println("Connection Establish");
    	}
    	return status;
    }
}
