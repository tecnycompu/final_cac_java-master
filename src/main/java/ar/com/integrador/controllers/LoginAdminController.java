package ar.com.integrador.controllers;


import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.com.integrador.dao.iOradorDAO;
import ar.com.integrador.dao.implement.OradorDAOMysqlImpl;
import ar.com.integrador.domain.Orador;

//un servelet es una clase que extiende de httpServlet
//http://localhost:8080/integrador//FindAllOradorController
@WebServlet("/LoginAdminController")


public class LoginAdminController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Capturar los parámetros que vienen en el request enviado por el form
        String nombre = req.getParameter("nombre");
        String password = req.getParameter("password");

        // Validar las credenciales en la base de datos
        if (validarCredenciales(nombre, password)) {
            // Si las credenciales son válidas, redirigir al dashboard
            req.getSession().setAttribute("usuario", nombre); // Guardar el nombre de usuario en la sesión
            resp.sendRedirect(req.getContextPath() + "/DashboardOradorController");
        } else {
            // Si las credenciales no son válidas, redirigir al formulario de login con un mensaje de error
            req.setAttribute("error", "Credenciales incorrectas");
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    private boolean validarCredenciales(String nombre, String password) {
        // Aquí deberías consultar la base de datos para verificar las credenciales
        // Puedes usar tu clase OradorDAOMysqlImpl para realizar la consulta
        iOradorDAO oradorDAO = new OradorDAOMysqlImpl();
        // Ejemplo de método que podrías tener en tu DAO para verificar credenciales
        return oradorDAO.validarCredenciales(nombre, password);
    }
}


// public class LoginAdminController  extends HttpServlet {
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//capturo los parametros que viene en el request enviado por el form
//		String nombre= req.getParameter("nombre");//name de input
//		String password = req.getParameter("password");
//		// si el user y la contraseña se validan y estan ok te deja entrar al dashboard
//		getServletContext().getRequestDispatcher("/DashboardOradorController").forward(req, resp);
//		
//	}
// }
