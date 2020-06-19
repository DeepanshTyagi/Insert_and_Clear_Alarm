package org.Deepanshu.Alarm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.Deepanshu.Alarm.dto.Alarm;
import org.Deepanshu.Alarmdao.module.AlarmDAO;

/**
 * Servlet implementation class AlarmServlet
 */
@WebServlet("/AlarmServlet")
public class AlarmServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlarmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private AlarmDAO alarmdao;
    public void init()
    {
    	alarmdao=new AlarmDAO();
    }
    
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String mname=request.getParameter("mname");
		String ip=request.getParameter("ip");
		String port=request.getParameter("port");
		String status=request.getParameter("status");
		String category=request.getParameter("category");
		
		Alarm alarm=new Alarm();
		alarm.setMname(mname);
		alarm.setIp(ip);
		alarm.setPort(port);
		alarm.setStatus(status);
		alarm.setCategory(category);
		
		int result=0;
		try 
		{
			result=alarmdao.Insert(alarm);
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0)
		{
			RequestDispatcher dispatcher=request.getRequestDispatcher("sucess.jsp");
			dispatcher.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
