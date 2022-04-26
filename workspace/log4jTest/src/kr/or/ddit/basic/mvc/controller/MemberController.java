package kr.or.ddit.basic.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import kr.or.ddit.basic.mvc.service.IMemberService;
import kr.or.ddit.basic.mvc.service.MemberServiceImpl;
import kr.or.ddit.basic.mvc.vo.MemberVO;
import kr.or.ddit.util.CryptoUtil;

/*
 	1. 회원정보 중에서 회원 ID는 양방향 암호화로 변환하여 DB에 저장하고 화면에 보여줄 때는
 	원래의 데이터로 복원하여 보여준다.
 	2. 비밀번호는 단방향 알고리즘으로 암호화하여 DB에 저장한다.
 */


public class MemberController {
	private Scanner scan = new Scanner(System.in);
	String key = "a1b2c3d4e5f6g7h8"; 
	
	// Controller는 Service를 호출한다.
	private IMemberService service;

	public MemberController() {
//		service = new MemberServiceImpl();
		service = MemberServiceImpl.getInstance();
	}

	// 시작 메서드
	public void startMember() throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		while (true) {
			int choice = displayMenu();
			switch (choice) {
			case 1: // 추가
				insertMember();
				break;
			case 2: // 수정
				updateMember();
				break;
			case 3: // 삭제
				deleteMember();
				break;
			case 4: // 전체 출력
               displayMember();
				break;
			case 5: // 수정
               updateMember2();
				break;
			case 0: // 작업 끝
				System.out.println("작업을 마칩니다.");
				return;
			default:
				System.out.println("번호를 잘못 입력했습니다. 다시입력하세요.");
			}
		}
	}
	
	private void updateMember2() throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		scan.nextLine();
		String memId;

		System.out.print("수정할 회원의 ID 입력 : ");
		memId = scan.nextLine();
		
		memId = CryptoUtil.encryptoAES256(memId, key);
		
		int count = service.getMemberCount(memId);
		
		if(count == 0) {
			memId = CryptoUtil.decryptoAES256(memId, key);
			System.out.println("입력한 " + memId + "는 등록되지 않은 id입니다.");
			return;
		}
		
		String updateField = null;
		String updateTitle = null;
		int num;
		
		do {
			System.out.println("수정할 항목을 선택하세요.");
			System.out.println("1.비밀번호 2.회원이름 3.전화번호 4.회원주소");
			System.out.println("---------------------------------");
			System.out.print("선택 >> ");
			num = scan.nextInt();
			
			switch(num) {
			case 1 :		//비밀번호
				updateField = "mem_pass";
				updateTitle = "비밀번호";
				break;
			case 2 :		//이름
				updateField = "mem_name";
				updateTitle = "이름";
				break;
			case 3 :		//전화번호
				updateField = "mem_tel";
				updateTitle = "전화번호";
				break;
			case 4 :		//주소
				updateField = "mem_addr";
				updateTitle = "주소";
				break;
			default :	
				System.out.println("번호를 잘못 선택했습니다.");
			}	
		}while(num < 1 || num > 5);
		
		scan.nextLine();
		System.out.print("새로운 " + updateTitle + " >> ");
		String updateData = scan.nextLine();
		
		if("mem_pass".equals(updateField)) {
			updateData = CryptoUtil.sha512(updateData);
		}
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("memid", memId);
		paramMap.put("field", updateField);
		paramMap.put("data", updateData);
		
		int cnt = service.updateMember2(paramMap);
		if(cnt >0) {
			memId = CryptoUtil.decryptoAES256(memId, key);
			System.out.println(memId + " 회원의 "+ updateTitle +" 수정 성공");
		}else {
			System.out.println("수정 실패");
		}
			
	}
	
	
	private void displayMember() throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException  {
		List<MemberVO> list = service.getAllMember();
		
		System.out.println();
		System.out.println("--------------------------------------------------------");
		System.out.println("ID	비밀번호	이름	전화번호		주소");
		System.out.println("--------------------------------------------------------");

		if(list == null || list.size() == 0) {
			System.out.println("출력할 자료가 하나도 없습니다.");
		} else {
			for(MemberVO memVo : list) {
				
				System.out.println(CryptoUtil.decryptoAES256(memVo.getMem_id(), key)  +"\t" + memVo.getMem_pass() + "\t" + memVo.getMem_name() 
										+ "\t" + memVo.getMem_tel() + "\t" + memVo.getMem_addr());
				System.out.println("--------------------------------------------------------");
			}
		}

	}

	//삭제
	private void deleteMember() throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		scan.nextLine();
		String memId;
		System.out.print("삭제할 회원의 ID 입력 : ");
		memId = scan.nextLine();
		memId = CryptoUtil.encryptoAES256(memId, key);
		int count = service.getMemberCount(memId);

		if (count == 0) {
			memId = CryptoUtil.decryptoAES256(memId, key);
			System.out.println("입력한 " + memId + "는 등록되지 않은 id입니다.");
			return;
		}

		int cnt = service.deleteMember(memId);
		if (cnt > 0) {
			memId = CryptoUtil.decryptoAES256(memId, key);
			System.out.println(memId + "회원정보 삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
	}

	//수정
	private void updateMember() throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		scan.nextLine();
		String memId;

		System.out.print("수정할 회원의 ID 입력 : ");
		memId = scan.nextLine();
		memId = CryptoUtil.encryptoAES256(memId, key);
		int count = service.getMemberCount(memId);
		
		if (count == 0) {
			memId = CryptoUtil.decryptoAES256(memId, key);
			System.out.println("입력한 " + memId + "는 등록되지 않은 id입니다.");
			return;
		}

		System.out.print("비밀번호 입력 : ");
		String memPass = scan.nextLine();
		String result1 = CryptoUtil.sha512(memPass);

		System.out.print("회원이름 입력 : ");
		String memName = scan.nextLine();

		System.out.print("전화번호 입력 : ");
		String memTel = scan.nextLine();

		System.out.print("주소 입력 : ");
		String memAddr = scan.nextLine();

		MemberVO memVo = new MemberVO();
		memVo.setMem_id(memId);
		memVo.setMem_pass(result1);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_addr(memAddr);

		int cnt = service.updateMember(memVo);
		if (cnt > 0) {
			memId = CryptoUtil.decryptoAES256(memId, key);
			System.out.println(memId + "회원정보 수정 성공");
		} else {
			System.out.println("수정 실패");
		}

	}

	// 회원 정보를 추가(입력)하는 메서드
	// DB에 직접적으로 접속하는 부분이 있어서는 안된다.
	private void insertMember() throws NoSuchAlgorithmException, UnsupportedEncodingException, InvalidKeyException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		System.out.println();
		System.out.println("추가할 회원 정보를 입력하세요.");

		// 자료 추가에서 '회원 ID'는 중복되지 않는다.
		// 중복되면 다시 입력받는다.
		int count = 0; // 입력한 회원ID의 개수가 저장될 변수

		String memId; // 회원ID가 저장될 변수
		String resultid;
		do {
			System.out.println("회원ID >> ");
			memId = scan.next();
			resultid = CryptoUtil.encryptoAES256(memId, key);

			count = service.getMemberCount(memId);

			if (count > 0) {
				memId = CryptoUtil.decryptoAES256(memId, key);
				System.out.println(memId + "는(은) 이미 등록된 ID입니다.");
				System.out.println("다른 회원ID를 입력하세요.");
			}
		} while (count > 0);

		System.out.println("비밀번호 >> ");
		String memPass = scan.next();
		String result = CryptoUtil.sha512(memPass);

		System.out.println("회원이름 >> ");
		String memName = scan.next();

		System.out.println("전화번호 >> ");
		String memTel = scan.next();

		scan.nextLine(); // 입력 버퍼 비우기
		System.out.println("회원주소 >> ");
		String memAddr = scan.nextLine();

		// service -> dao 를 거쳐 데이터를 보내야한다.
		// 입력한 데이터를 VO객체에 저장한다.
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(resultid);
		memVo.setMem_pass(result);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_addr(memAddr);

		int cnt = service.insertMember(memVo);

		if (cnt > 0) {
			System.out.println("회원정보 추가 성공!!!");
		} else {
			System.out.println("회원정보 추가 실패~~~");
		}
	}

	private int displayMenu() {
		System.out.println();
		System.out.println(" == 작 업 선 택 ==");
		System.out.println(" 1. 자 료 추 가");
		System.out.println(" 2. 자 료 수 정");
		System.out.println(" 3. 자 료 삭 제");
		System.out.println(" 4. 전 체 자 료 출 력");
		System.out.println(" 5. 자 료 수 정 2");
		System.out.println(" 0. 작 업 끝...");
		System.out.println("-------------------");
		System.out.println("원하는 작업번호 >> ");
		return scan.nextInt();
	}

	public static void main(String[] args) throws InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException, NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		new MemberController().startMember();
	}

}