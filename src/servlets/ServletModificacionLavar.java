package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Lavarropas;
import negocio.ControladorLavarropasNegocio;
/**
 * * ESTE ES EL QUE OBTIENE EL OBJETO SELECCIONADO Y REDIRIGE A LA VENTANA DE MODIFICACION
 * Servlet implementation class ServletModificacionLavar
 */
@WebServlet("/ServletModificacionLavar")
public class ServletModificacionLavar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModificacionLavar() {
        
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
				
		int pID =Integer.parseInt(request.getParameter("idLavarrSelected"));
		
		Lavarropas lavaSelect =controladorLavarropas.getOne(pID);
		
		request.setAttribute("lavarSelect", lavaSelect);
		
		request.getRequestDispatcher("/ModifLavarropas.jsp").forward(request, response);
		
		// TODO Auto-generated method stub
	}

}
