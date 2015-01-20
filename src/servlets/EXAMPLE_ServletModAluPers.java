package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletModAluPers
 */
@WebServlet("/ServletModAluPers")
public class EXAMPLE_ServletModAluPers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EXAMPLE_ServletModAluPers() {
        super();
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
		negocio.ControladorSGA controlador=(negocio.ControladorSGA)session.getAttribute("controlador");
		String datos[]= new String[5];
		datos[0]=request.getParameter("nombre");
		datos[1]=request.getParameter("apellido");
		datos[2]=request.getParameter("legajo");
		datos[3]=request.getParameter("mail");
		datos[4]=request.getParameter("obs");
		try{
		controlador.registraModAlu(datos);
		response.sendRedirect("/ModificacionExito.html");
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorModificacion.html");
		}
		// TODO Auto-generated method stub
	}

}
