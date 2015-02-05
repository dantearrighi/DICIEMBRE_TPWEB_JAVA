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
 * Servlet implementation class ServletAddLavarropas
 */
@WebServlet("/ServletAddLavarropas")
public class ServletAddLavarropas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddLavarropas() {
        
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
		ControladorLavarropasNegocio controladorLavarropas =(ControladorLavarropasNegocio)session.getAttribute("controladorLavarropas");
		
		char pConsumo = request.getParameter("consumo").charAt(0); //Selecciono el primer caracter de la cadena (ademas, el unico)
		String pColor =request.getParameter("color").toUpperCase();
		String pDescripcion =request.getParameter("descripcion");
		float pPeso =Float.parseFloat(request.getParameter("peso"));
		float pPrecio =Float.parseFloat(request.getParameter("precio"));
		float pCarga =Float.parseFloat(request.getParameter("carga"));
		
		try{
		controladorLavarropas.AddLavarropa(pPrecio, pPeso, pColor, pConsumo, pDescripcion, pCarga);
		response.sendRedirect("/JAVA_TPWEB/ListaLavarropas.jsp");
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorAlta.html"); //No está creada esta vista1.
		}
		// TODO Auto-generated method stub
	}

}
