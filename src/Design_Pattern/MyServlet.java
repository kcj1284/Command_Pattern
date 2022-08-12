package Design_Pattern;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Design_Pattern.Robot.Direction;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RobotControl robot = new RobotControl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void service(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		if (request.getParameter("cmd").equals("start")) {
			System.out.println("start");
			int [] position = robot.start();
			System.out.println(position[0] + "," + position[1]);
			request.setAttribute("position", position[0] + "," + position[1]);
		}
		else {
			Robot.Direction direction = Robot.Direction.UP;
			switch (request.getParameter("turn")) {
			case "UP":
				direction = Robot.Direction.UP;
				break;
			case "RIGHT":
				direction = Robot.Direction.RIGHT;
				break;
			case "DOWN":
				direction = Robot.Direction.DOWN;
				break;
			case "LEFT":
				direction = Robot.Direction.LEFT;
				break;
			
			}
			int go = Integer.valueOf(request.getParameter("go"));
			robot.addCommand(new TurnCommand(direction));
			robot.addCommand(new MoveForwardCommand(go));
		}
		
		request.setAttribute("history", robot.getHistory());
		response.setContentType("text/html; charset=EUC-KR");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Robot_Remote.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
