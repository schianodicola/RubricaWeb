package it.rdev.rubrica.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.rdev.rubrica.dto.User;
import it.rdev.rubrica.model.ContactDao;
import it.rdev.rubrica.model.entities.Contact;

/**
 * Servlet implementation class CrudServlet
 */
@WebServlet("/CrudServlet")
public class CrudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrudServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String action = request.getParameter("action");
		if(action != null && action.equals("insert") ) {
			Contact c = new Contact();
			c.setName(request.getParameter("name"));
			c.setSurname(request.getParameter("surname"));	
					
			ContactDao.insert(c);
		}
		
		String reqId = request.getParameter("id");
		if(action != null && action.equals("delete") ) {
			//Contact c = ContactDao.getContact(Integer.parseInt(request.getParameter("id")));
			Contact c = new Contact();
			c.setId(Integer.parseInt(reqId));
			ContactDao.delete(c);
		}
		
		List<Contact> contatti= ContactDao.findAllCriteria();
		request.setAttribute("contatti", contatti);
		
		request.getRequestDispatcher("crud.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
