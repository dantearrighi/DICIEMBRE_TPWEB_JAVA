package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import negocio.ControladorLavarropasNegocio;

/**
 * Servlet implementation class ServletBajaLava
 */
@WebServlet("/ServletBajaLava")
public class ServletBajaLava extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBajaLava() {
      
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		ControladorLavarropasNegocio controlador = (ControladorLavarropasNegocio)session.getAttribute("controladorLavarropas");
		int vidElectro = Integer.parseInt(request.getParameter("idElectro"));
		controlador.DeleteLavarropa(vidElectro);
		response.sendRedirect("/JAVA_TPWEB/ListaLavarropas.jsp");
		
		
		// TODO Auto-generated method stub
	}

}
