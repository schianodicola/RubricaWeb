package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.dto.User;
import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Login Page");
		
		/*
		List<User> users = new ArrayList<>();
		users.add(new User().setPassword("pass01").setUsername("user01"));
		users.add(new User().setPassword("pass02").setUsername("user02"));
		users.add(new User().setPassword("pass03").setUsername("user03"));
		users.add(new User().setPassword("pass04").setUsername("user04"));
		*/
		List<Contact> contatti= ContactDao.findAllCriteria();
	
		
		request.setAttribute("contatti", contatti);
		
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
