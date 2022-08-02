package Design_Pattern;

abstract class Command {
	protected Robot robot;

	public void setRobot(Robot _robot) {
		this.robot = _robot;
	}

	public abstract void execute();
}



class PickupCommand extends Command {
	public void execute() {
		robot.pickup();
	}
}