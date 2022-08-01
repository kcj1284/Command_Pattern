package Design_Pattern;

public class Robot {
	int x;
	int y;
	Direction di;

	Robot() {
		this.x = 4;
		this.y = 8;
		this.di = Direction.UP;
	}

	public enum Direction {
		LEFT, RIGHT, UP, DOWN
	}

	public void moveForward(int go) {
		switch (this.di) {
		case LEFT:
			this.x -= go;
			break;
		case UP:
			this.y -= go;
			break;
		case RIGHT:
			this.x += go;
			break;
		case DOWN:
			this.y -= go;
			break;
		}
	}

	public int[] show() {
		int[] state = { this.y, this.x };
		return state;
	}

	public void turn(Direction _direction) {
		this.di = _direction;
	}

	public void pickup() {
		System.out.println("앞의 물건 집어들기");
	}

	public void charge() {
		this.x = 4;
		this.y = 8;
	}
}