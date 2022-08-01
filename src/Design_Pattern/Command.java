package Design_Pattern;

abstract class Command {
	protected Robot robot;

	public void setRobot(Robot _robot) {
		this.robot = _robot;
	}

	public abstract void execute();
}

class MoveForwardCommand extends Command {
	int space;

	public MoveForwardCommand(int _space) {
		space = _space;
	}

	public void execute() {
		robot.moveForward(space);
	}

	@Override
	public String toString() {
		return space + "ĭ �̵�</br>";
	}
}

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

class PickupCommand extends Command {
	public void execute() {
		robot.pickup();
	}
}

class ChargeCommand extends Command {
	public void execute() {
		robot.charge();
	}
	public void charge() {
	}
	
}