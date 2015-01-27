package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.ControladorElectrodomesticoNegocio;

/**
 * Servlet implementation class ServletModElectro
 */
@WebServlet("/ServletModElectro")
public class ServletModElectro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModElectro() {
        
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
		ControladorElectrodomesticoNegocio controladorElectro =(ControladorElectrodomesticoNegocio)session.getAttribute("controladorElectro");
		
		char pConsumo = request.getParameter("consumo").charAt(0); //Selecciono el primer caracter de la cadena (ademas, el unico)
		String pColor =request.getParameter("color").toUpperCase();
		String pDescripcion =request.getParameter("descripcion");
		float pPeso =Float.parseFloat(request.getParameter("peso"));
		float pPrecio =Float.parseFloat(request.getParameter("precio"));
		int pID=Integer.parseInt(request.getParameter("id"));
		
		try{
			controladorElectro.UpdateElectro(pID, pPrecio, pPeso, pColor, pConsumo, pDescripcion);
		response.sendRedirect("/JAVA_TPWEB/ListaElectrodomesticos.jsp"); //Redirigir a MODIFICACION EXITO, NO a la LISTA
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorModificacion.html"); //No está creada esta vista 2.
		}
		// TODO Auto-generated method stub
	}

}
