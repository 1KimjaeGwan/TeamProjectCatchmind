package catchmind;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import catchmind.vo.MemberVO;

public class MainThread extends Thread{
	
	public MemberController memberController;

	@Override
	public void run() {
		ObjectInputStream ois = null;
		try {
			while(true) {
				if(isInterrupted()) {break;}
				Object obj = null;
				ois = new ObjectInputStream(ClientMain.socket.getInputStream());
				if((obj = ois.readObject()) != null) {
					System.out.println(obj);
					if(obj instanceof MemberVO) {
						memberController.receiveData((MemberVO)obj);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("n");
		}
	}
	
	public void sendData(Object o) {
		ObjectOutputStream oos = null;
		try {
			oos = new ObjectOutputStream(ClientMain.socket.getOutputStream());
			oos.writeObject(o);
			oos.flush();
		} catch (IOException e) {
			
		}
	}
}
