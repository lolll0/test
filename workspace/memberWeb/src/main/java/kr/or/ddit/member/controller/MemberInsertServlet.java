package kr.or.ddit.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/member/memberInsert.ddit")
@MultipartConfig
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		//String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
		String uploadPath = "D:\\D_Other\\uploadedFiles";

		// 저장될 폴더가 없으면 생성한다.
		File fileUploadDir = new File(uploadPath);
		if (!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("utf-8");
		String memId = request.getParameter("mem_id");
		String memName = request.getParameter("mem_name");
		String memPass = request.getParameter("mem_pass");
		String memTel = request.getParameter("mem_tel");
		String memAddr = request.getParameter("mem_addr");
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(memId);
		memVo.setMem_pass(memPass);
		memVo.setMem_name(memName);
		memVo.setMem_tel(memTel);
		memVo.setMem_addr(memAddr);
		
		// form의 file입력 요소의 name값을 이용하여 Part객체 구하기
		Part part = request.getPart("mem_photo");
		
		if(part != null) {
			String photo = extractFileName(part);
			if(!"".equals(photo)) {
				try {
					part.write(uploadPath + File.separator + photo);
					memVo.setMem_photo(photo);
				}catch(IOException e) {
					memVo.setMem_photo(null);
				}
			}
				
		}
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		
		int cnt = service.insertMember(memVo);
		
		response.sendRedirect(request.getContextPath() + "/member/memberList.ddit" );
	}
	
	private String extractFileName(Part part) {
		String fileName = ""; 
		String contentDisposition = part.getHeader("Content-Disposition");
		String[] items = contentDisposition.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return fileName;
	}

}
