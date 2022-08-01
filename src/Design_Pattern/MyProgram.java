package Design_Pattern;

public class MyProgram {

	public static void main(String[] args) {
		RobotControl robotKit = new RobotControl();

		robotKit.addCommand(new MoveForwardCommand(2));
		robotKit.addCommand(new TurnCommand(Robot.Direction.LEFT));
		robotKit.addCommand(new MoveForwardCommand(1));
		robotKit.addCommand(new TurnCommand(Robot.Direction.RIGHT));
		robotKit.addCommand(new PickupCommand());

		robotKit.start();

		// 2 ĭ ����n
		// �������� ������ȯ
		// 1 ĭ ����
		// ���������� ������ȯ
		// ���� ���� ������
	}
}