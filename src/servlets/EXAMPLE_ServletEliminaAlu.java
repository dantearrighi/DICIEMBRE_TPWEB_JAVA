package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletEliminaAlu
 */
@WebServlet("/ServletEliminaAlu")
public class EXAMPLE_ServletEliminaAlu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EXAMPLE_ServletEliminaAlu() {
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
		negocio.Alumno alum=null;
		negocio.ControladorSGA controlador=(negocio.ControladorSGA)session.getAttribute("controlador");
		negocio.Comision comi=(negocio.Comision)session.getAttribute("comision");
		String legajo=request.getParameter("radio");
		ArrayList <negocio.Alumno> alumnos=controlador.BuscaAlumnos(comi);
		for(int i=0;i<alumnos.size();i++)
		{
			if(legajo.equals(alumnos.get(i).getLegajo()))
			{
				alum=alumnos.get(i);
				break;
			}
		}
	
		controlador.bajaAlumno(comi, alum);
		response.sendRedirect("/BajaExito.html");
		
		
		// TODO Auto-generated method stub
	}

}
