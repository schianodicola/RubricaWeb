package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;
import it.rdev.rubrica.model.entities.Email;
import it.rdev.rubrica.model.entities.Phone;

/**
 * Servlet implementation class UpCoServlet
 */
@WebServlet("/UpCoServlet")
public class UpCoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpCoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String reqId = request.getParameter("id");
		
		if(action != null && action.equals("update") && reqId!=null) {
			Set<Email> emails= new HashSet<>();
			Set<Phone> phones= new HashSet<>();
			
			
			Contact c = new Contact();
			c.setId(Integer.parseInt(reqId));
			c.setName(request.getParameter("name"));
			c.setSurname(request.getParameter("surname"));
			
			for(String e: request.getParameterValues("email")) {
				if(e!=null && !e.equals("0")) {
					Email em= new Email();
					em.setEmail(e);
					em.setContact(c);
					emails.add(em);
				}
				
			}
			for(String p: request.getParameterValues("email")) {
				if(p!=null && !p.equals("0")) {
					Phone ph= new Phone();
					ph.setPhone(p);
					ph.setContact(c);
					phones.add(ph);
				}
			}
			
			
			c.setEmails(emails);
			c.setPhones(phones);
			ContactDao.update(c);
		}
		
		List<Contact> contatti= ContactDao.findAllCriteria();
		request.setAttribute("contatti", contatti);
		
		//request.getRequestDispatcher("/CrudServlet").forward(request, response);
		request.getRequestDispatcher("crud.jsp").forward(request, response);
		
		//response.sendRedirect("/RubrigaWeb/CrudServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
