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
 * Servlet implementation class ServletModAluPers
 */
@WebServlet("/ServletAddElectro")
public class ServletAddElectro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddElectro() {
        
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
		int pPeso =Integer.parseInt(request.getParameter("peso"));
		float pPrecio =Float.parseFloat(request.getParameter("precio"));
		
		try{
		controladorElectro.AddElectro(pPrecio, pPeso, pColor, pConsumo, pDescripcion);
		response.sendRedirect("/JAVA_TPWEB/ListaElectrodomesticos.jsp");
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorAlta.html"); //No está creada esta vista.
		}
		// TODO Auto-generated method stub
	}

}
