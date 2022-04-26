package kr.or.ddit.basic.stream;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

public class PhoneBook {
	
	private HashMap<String, Phone> phoneMap;
	private Scanner scan;
	
	/*
	 Scanner객체의 입력 메서드의 특징
	 - next(), nextInt(), nextDouble(),....등
	 	==> 사이띄기, Tab키, Enter키를 구분 문자로 분리해서 분리된 자료만 읽어간다.
	 	
	 - nextLine()
	 	==> 한 줄 단위로 입력한다. 즉, 자료를 입력하고 Enter키를 누르면 Enter키까지 읽어간다.
	 	
	 - Scanner는 입력한 값이 입력 버퍼에 먼저 저장된 후에 차례로 꺼내와서 처리된다.
	 */
	
//	1) '6. 전화번호 저장' 메뉴를 추가하고 구현한다.
//	(이 때 저장파일명은 'phoneData.dat'로 한다.)
//	2) 프로그램이 시작될 때 저장된 파일이 있으면 그 데이터를 읽어와 map에 셋팅한다.
//	3) 프로그램을 종료할 때 Map의 데이터가 수정되거나, 추가 또는 삭제되면 저장 후 종료되도록 한다. 
	
	
	
	// 생성자
	public PhoneBook() {
		phoneMap = new HashMap<String, Phone>();
		scan = new Scanner(System.in);
		load();
		
	}
	
	private void load() {
		try {
			File file = new File("d:/d_other/phoneData.dat");
			
			FileInputStream fin = new FileInputStream(file);
			BufferedInputStream bin = new BufferedInputStream(fin);
			ObjectInputStream oin = new ObjectInputStream(bin);
			
			phoneMap = (HashMap<String, Phone>) oin.readObject();
			
			oin.close();
			if(phoneMap != null) {
				System.out.println("저장된 전화번호를 불러옵니다.");
			}
		} catch (EOFException e) {
			// TODO: handle exception
		}catch (IOException e) {
			// TODO: handle exception
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
		}
		
	}

	public static void main(String[] args) {
		new PhoneBook().start();
	}
	
	
	// 프로그램을 시작하는 메서드
	private void start() {
		System.out.println();
		System.out.println("**********************************");
		System.out.println("    전화번호 관리 프로그램 ");
		System.out.println("**********************************");
		System.out.println();
		
		while(true) {
			int choice = displayMenu();
			switch(choice) {
			case 1 : insert(); // 등록
				break;
			case 2 : update(); // 수정
				break;
			case 3 : delete();	// 삭제
				break;
			case 4 : search();		// 검색
				break;
			case 5 : displayAll(); // 전체 출력
				break;
			case 6 : save();
				break;
			case 0 :
				System.out.println("프로그램을 종료합니다.");
				return;
			default :
					System.out.println("작업 번호를 잘못 입력했습니다.");
					System.out.println("다시 선택하세요.");
			}
		}
	}
	
	private void save() {
		try {
			FileOutputStream fout = new FileOutputStream("d:/d_other/phoneData.dat");
			BufferedOutputStream bout = new BufferedOutputStream(fout);
			ObjectOutputStream oout = new ObjectOutputStream(bout);
			
			System.out.println("전화번호부 저장 시작!!");
			oout.writeObject(phoneMap);
			System.out.println("전화번호부 저장 완료!!");
			
			oout.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 전화번호 정보를 검색하는 메서드		
	private void search() {
		System.out.println();
		System.out.println("검색할 전화번호 정보를 입력하세요...");
		System.out.println("이름 >>");
		String name = ScanUtil.nextLine();
		
		//입력한 사람의 이름이 전화번호 정보 에 없으면
		if(!phoneMap.containsKey(name)) {
			System.out.println(name + "씨는 등록되지 않은 사람입니다.");
			System.out.println("삭제 작업을 마칩니다.");
			return;
		}
		
		Phone p = phoneMap.get(name);
		System.out.println(name + "씨의 전화번호 정보");
		System.out.println("=======================");
		System.out.println(" 이름 : " + p.getName());
		System.out.println(" 전화번호 : " + p.getTel());
		System.out.println(" 주소 : " + p.getAddr());
		System.out.println("=======================");
		
	}
	
	// 전화번호 정보를 삭제하는 메서드
	private void delete() {
		System.out.println();
		System.out.println("삭제할 전화번호 정보를 입력하세요...");
		System.out.println("이름 >>");
		String name = ScanUtil.nextLine();
		if(!phoneMap.containsKey(name)) {
			System.out.println(name + "씨는 등록되지 않은 사람입니다.");
			System.out.println("삭제 작업을 마칩니다.");
			return;
		}
		
		phoneMap.remove(name);
		
		System.out.println(name + "씨 전화번호 정보 삭제 완료!!!");
		
	}
	// 전화번호 정보를 수정하는 메서드
	private void update() {
		System.out.println();
		System.out.println("수정할 전화번호 정보를 입력하세요.");
		System.out.println("이름 >>");
		String name = ScanUtil.nextLine();
		
		// 입력한 사람의 이름이 전화번호 정보에 없을경우	
		if(!phoneMap.containsKey(name)) {
			System.out.println(name + "씨는 등록되지 않은 사람입니다.");
			System.out.println("수정 작업을 마칩니다.");
			return;
		}
		
		System.out.println("주소 >>");
		String addr = ScanUtil.nextLine();
		
		System.out.println("전화번호 >>");
		String tel = ScanUtil.nextLine();
		
		phoneMap.put(name, new Phone(name, addr, tel));
		System.out.println(name + "씨의 전화번호 정보 수정완료!!!");
	}
	
	// 전화번호 정보 전체 자료를 출력하는 메서드
	private void displayAll() {
		System.out.println();
		
		// 모든 key값 가져오기
		Set<String> phoneKeySet = phoneMap.keySet();
		
		System.out.println("---------------------------------------");
		System.out.println("번호\t이름\t전화번호\t주소     ");
		System.out.println("---------------------------------------");
		if(phoneKeySet.size() == 0) {
			System.out.println("등록된 전화번호 정보가 하나도 없습니다.");
		}else {
			int cnt = 0; // 번호 출력용 변수
			for(String name : phoneKeySet) {
				cnt++;
				Phone p = phoneMap.get(name);
				System.out.println(cnt + "\t" + name + "\t" + p.getTel() + "\t" + p.getAddr());
			}
		}
		System.out.println("---------------------------------------");
		System.out.println("출력 끝...");
	}
	
	// 새로운 전화번호 정보를 등록하는 메서드
	private void insert() {
		System.out.println();
		System.out.println("새롭게 등록할 전화번호 정보를 입력하세요.");
		System.out.println("이름 >>");
		String name = ScanUtil.nextLine();
		
		// 이미 등록된 사람인지 여부를 검사한다.
		if(phoneMap.containsKey(name)) {
			System.out.println(name + "씨는 이미 등록된 사람입니다.");
			return;
		}
		
		System.out.println("전화번호 >>");
		String tel = ScanUtil.nextLine();
		
		System.out.println("주소 >>");	
		String addr = ScanUtil.nextLine();
		
		phoneMap.put(name, new Phone(name, addr, tel));
		
		System.out.println(name + "씨 전화번호 등록 완료!!!");
	}
	
	// 메뉴를 출력하고 작업 번호를 입력받아 반환하는 메서드
	private int displayMenu() {
		System.out.println();
		System.out.println("-------------------------------");
		System.out.println();
		System.out.println("1. 전화번호 등록");
		System.out.println("2. 전화번호 수정");
		System.out.println("3. 전화번호 삭제");
		System.out.println("4. 전화번호 검색");
		System.out.println("5. 전화번호 전체 출력");
		System.out.println("6. 전화번호 저장");
		System.out.println("0. 프로그램 종료");
		System.out.println("-------------------------------");
		System.out.println("번호 입력 >");
		int num = ScanUtil.nextInt();
		return num;
	}

}

// 하나의 전화번호 정보가 저장될 class 작성
class Phone1 implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String addr;
	private String tel;
	
	//생성자
	public Phone1(String name, String addr, String tel) {
		super();
		this.name = name;
		this.addr = addr;
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "Phone [name=" + name + ", addr=" + addr + ", tel=" + tel + "]";
	}
	
	
}