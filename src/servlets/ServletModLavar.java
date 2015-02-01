package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.ControladorLavarropasNegocio;

/**
 * ESTE ES EL QUE MODIFICA
 * Servlet implementation class ServletModLavar
 */
@WebServlet("/ServletModLavar")
public class ServletModLavar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModLavar() {
        
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
		ControladorLavarropasNegocio controladorLavar =(ControladorLavarropasNegocio)session.getAttribute("controladorLavar");
		
		char pConsumo = request.getParameter("consumo").charAt(0); //Selecciono el primer caracter de la cadena (ademas, el unico)
		String pColor =request.getParameter("color").toUpperCase();
		String pDescripcion =request.getParameter("descripcion");
		float pPeso =Float.parseFloat(request.getParameter("peso"));
		float pCarga =Float.parseFloat(request.getParameter("carga"));
		float pPrecio =Float.parseFloat(request.getParameter("precio"));
		int pID=Integer.parseInt(request.getParameter("id"));
		
		try{
			controladorLavar.UpdateElectro(pID, pPrecio, pPeso, pColor, pConsumo, pCarga, pDescripcion);
		response.sendRedirect("/JAVA_TPWEB/ListaLavarropas.jsp"); //Redirigir a MODIFICACION EXITO, NO a la LISTA
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorModificacion.html"); //No está creada esta vista 2.
		}
		// TODO Auto-generated method stub
	}

}
