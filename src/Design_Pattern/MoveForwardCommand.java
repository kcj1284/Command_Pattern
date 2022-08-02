package Design_Pattern;

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
		return space + "Ä­ ÀÌµ¿</br>";
	}
}