package kr.or.ddit.basic.tcp;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.net.UnknownHostException;

public class TcpClient01 {

	public static void main(String[] args) throws IOException, IOException {
		// 현재 자신 컴퓨터를 나타내는 방법
		// 1) 원래의 IP주소 : 예) 192.168.34.38
		// 2) 지정된 IP주소 : 127.0.0.1
		// 3) 원래의 컴퓨터이름 : 예) DESKTOP-AADMQ3L
		// 4) 지정된 컴퓨터이름 : localhost 
		
		
		Socket socket = new Socket("192.168.34.38", 7777);
		
		// 이 부분은 서버와 연결이 완료된 이후에 실행되는 코드이다.
		System.out.println("서버에 연결되었습니다.");
		System.out.println();
		
		// 서버에서 보낸 메시지를 받아서 화면에 출력하기
		InputStream is = socket.getInputStream();
		DataInputStream dis = new DataInputStream(is);
		
		// 서버가 보낸 데이터 받아서 출력
		System.out.println("서버에서 보낸 메시지 : " + dis.readUTF());
		System.out.println();
		
		System.out.println("연결을 종료합니다.");
		
		dis.close();
		socket.close();
		
		// 자바의 위치 경로에 들어가서 창에 cmd를 치고 서버와 클라이언트의 동시 진행 상황을 볼 수 있다.
		// D:\A_TeachingMaterial\03_HighJava\workspace\javaNetWorkTest\bin 이걸 지우고 cmd를 친다.
		
	}

}
