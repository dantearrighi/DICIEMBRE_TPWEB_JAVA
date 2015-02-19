package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.ControladorTelevisorNegocio;

/**

 * Servlet implementation class ServletModTelev
 */
@WebServlet("/ServletModTelev")


public class ServletModTelev extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModTelev() {
        
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

		ControladorTelevisorNegocio controladorTelevisor =(ControladorTelevisorNegocio)session.getAttribute("controladorTelevisor");

		
		char pConsumo = request.getParameter("consumo").charAt(0); //Selecciono el primer caracter de la cadena (ademas, el unico)
		String pColor =request.getParameter("color").toUpperCase();
		String pDescripcion =request.getParameter("descripcion");
		float pPeso =Float.parseFloat(request.getParameter("peso"));
		float pPrecio =Float.parseFloat(request.getParameter("precio"));
		int pResolucion =Integer.parseInt(request.getParameter("resolucion"));
		boolean pSintoniz = Boolean.parseBoolean(request.getParameter("sintonizador"));
		
		int pID=Integer.parseInt(request.getParameter("id"));
		
		try{
			controladorTelevisor.UpdateElectro(pID, pPrecio, pPeso, pColor, pConsumo, pResolucion, pSintoniz, pDescripcion);
			response.sendRedirect("/JAVA_TPWEB/ListaTelevisores.jsp"); //Redirigir a MODIFICACION EXITO, NO a la LISTA

		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorModificacion.html"); //No está creada esta vista 2.
		}
		// TODO Auto-generated method stub
	}

}
