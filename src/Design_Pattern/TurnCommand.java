package Design_Pattern;

class TurnCommand extends Command {
	Robot.Direction direction;

	public TurnCommand(Robot.Direction _direction) {
		direction = _direction;
	}

	public void execute() {
		robot.turn(direction);
	}

	@Override
	public String toString() {
		switch (direction) {
		case LEFT:
			return "왼쪽으로 ";
		case UP:
			return "위쪽으로 ";
		case RIGHT:
			return "오른쪽으로 ";
		case DOWN:
			return "아래로 ";
		}
		return "";
	}
}