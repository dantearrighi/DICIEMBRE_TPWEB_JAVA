package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import negocio.ControladorElectrodomesticoNegocio;

/**
 * Servlet implementation class ServletBajaElectro
 */
@WebServlet("/ServletBajaElectro")
public class ServletBajaElectro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBajaElectro() {
      
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
		
		ControladorElectrodomesticoNegocio controlador = (ControladorElectrodomesticoNegocio)session.getAttribute("controladorElectro");
		int vidElectro = Integer.parseInt(request.getParameter("idElectro"));
		controlador.DeleteElectro(vidElectro);
		response.sendRedirect("/BajaElectroExito.html");
		
		
		// TODO Auto-generated method stub
	}

}
