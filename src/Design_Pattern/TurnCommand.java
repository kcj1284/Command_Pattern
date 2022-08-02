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
			return "�������� ";
		case UP:
			return "�������� ";
		case RIGHT:
			return "���������� ";
		case DOWN:
			return "�Ʒ��� ";
		}
		return "";
	}
}