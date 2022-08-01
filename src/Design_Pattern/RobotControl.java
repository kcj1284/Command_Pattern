package Design_Pattern;

import java.util.ArrayList;

public class RobotControl {
	private StringBuilder sb = new StringBuilder();
	private Robot robot = new Robot();
	private ArrayList<Command> commands = new ArrayList<Command>();
	public void addCommand(Command command) {
		commands.add(command);
		sb.append(command.toString());
	}

	public String getHistory() {
		return sb.toString();
	}
	
	public int [] start() {
		for (Command command : commands) {
			command.setRobot(robot);
			command.execute();
		}
		
		commands.clear();
		sb.append("-----------------</br>");
		return robot.show();
	}
	
}