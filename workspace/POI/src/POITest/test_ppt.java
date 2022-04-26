package POITest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFSlideLayout;
import org.apache.poi.xslf.usermodel.XSLFSlideMaster;

public class test_ppt {
	public static void main(String[] args) {
		String fileCopyPath = "d:/d_other/test.ppt";
		File file = new File("d:/d_other/test1.pptx");
		
		// 빈 ppt를 만든다.
		XMLSlideShow ppt = new XMLSlideShow();
		System.out.println("Avaulable slide layouts:");
		
		for(XSLFSlideMaster master : ppt.getSlideMasters()) {
			for(XSLFSlideLayout layout : master.getSlideLayouts()) {
				System.out.println(layout.getType());
				
			}
			
		}
		/*
		 * List<XSLFSlide> slides = ppt.getSlides();
		 * 
		 * XSLFSlide selectesdslide = slides.get(4);
		 * 
		 * XSLFSlideMaster slideMaster = ppt.getSlideMasters();
		 */
		
	}
	
	
	// 삭제해도 무방할듯?? 저장만 하는 식으로 
//	public static void main(String[] args) {
//		// pptx문서를 생성한다.
//		XMLSlideShow ppt = new XMLSlideShow();
//		
//		
//		
//		try {
//			OutputStream os = new FileOutputStream("d:/d_other/test.pptx");
//			XSLFSlide slide = ppt.createSlide();
//			ppt.write(os);
//			System.out.println("저장완료");
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	}

}

