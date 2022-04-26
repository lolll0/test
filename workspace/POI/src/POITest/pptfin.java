package POITest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.commons.compress.utils.IOUtils;
import org.apache.poi.hslf.record.Slide;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.sl.usermodel.PictureData;
import org.apache.poi.sl.usermodel.ShapeType;
import org.apache.poi.xslf.usermodel.SlideLayout;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFHyperlink;
import org.apache.poi.xslf.usermodel.XSLFPictureData;
import org.apache.poi.xslf.usermodel.XSLFPictureShape;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFSlideLayout;
import org.apache.poi.xslf.usermodel.XSLFSlideMaster;
import org.apache.poi.xslf.usermodel.XSLFTextParagraph;
import org.apache.poi.xslf.usermodel.XSLFTextRun;
import org.apache.poi.xslf.usermodel.XSLFTextShape;
import org.apache.poi.xwpf.usermodel.BodyElementType;

public class pptfin {

	public static void main(String[] args) throws IOException {
		
		// 빈 프레젠테이션을 만든다.
		XMLSlideShow ppt = new XMLSlideShow();
		
		
		XSLFSlideMaster slideMaster = ppt.getSlideMasters().get(0);
		
		
		// 슬라이드 스타일
		// 제목만존재
		XSLFSlideLayout titleLayout = slideMaster.getLayout(SlideLayout.TITLE_ONLY);
		// 제목과 내용
		XSLFSlideLayout titleLayout1 = slideMaster.getLayout(SlideLayout.TITLE_AND_CONTENT);
		
		// 슬라이드를 생성한다.createSlide(슬라이드에 적용할 Layout을 지정한다.)
		XSLFSlide slide1 = ppt.createSlide(titleLayout);
		XSLFSlide slide2 = ppt.createSlide(titleLayout1);
		XSLFSlide slide3 = ppt.createSlide(titleLayout1);
		
		// 텍스트를 담을 수 있는 도형 
		XSLFTextShape title1 = slide1.getPlaceholder(0); 
		XSLFTextShape title2 = slide2.getPlaceholder(0);
		XSLFTextShape title3 = slide2.getPlaceholder(0);
				
		
		
		// 슬라이드별 title
		title1.setText("POI");
		
		title2.setText("POI란?");
		XSLFTextShape body = slide2.getPlaceholder(1);
		
		body.clearText();
		// 하이퍼 링크 삽입
		XSLFTextRun textRun = body.addNewTextParagraph().addNewTextRun();
		// 하이퍼링크를 만든다.
		textRun.setText("공식사이트 : https://poi.apache.org/");
		// 하이퍼링크 주소 설정
		XSLFHyperlink link = textRun.createHyperlink();
		link.setAddress("https://www.naver.com");	// 공식사이트와 연결이 되지 않아서 네이버로 하이퍼링크 지정
		
		// 폰트 스타일 설정
		XSLFTextParagraph pa = body.addNewTextParagraph();
		XSLFTextRun run1 = pa.addNewTextRun();
		run1.setText("워드, 엑셀, 파워포인트, 등을 지원한다.");
		// 폰트의 색을 설정한다.
		run1.setFontColor(java.awt.Color.GREEN);
		// 폰트의 크기를 지정한다.
		run1.setFontSize(30.0);
		// 폰트의 굵기를 설정한다. true면 굵게 false면 그대로 설정된다.
		run1.setBold(true);
		// 밑줄을 설정한다.
		run1.setUnderlined(true);
		// 단락 사이의 줄바꿈
		pa.addLineBreak();
		
//		body.addNewTextParagraph().addNewTextRun().setText("공식사이트 : https://poi.apache.org/");
//		body.addNewTextParagraph().addNewTextRun().setText("워드, 엑셀, 파워포인트, 등을 지원한다.");
		body.addNewTextParagraph().addNewTextRun().setText("xml 기반의 *.docx, *.xlsx, *.pptx 등을 지원한다.");
		
		
		// 슬라이드에 이미지 삽입
		File image = new File("d:/d_other/펭귄.jpg");
		
		// 추가할 이미지 파일을 읽고 IOUtils클래스를 이용하여 바이트 배열로 변환
		byte[] picture = IOUtils.toByteArray(new FileInputStream(image));
		// addpicture()를 사용하여 이미지를 추가합니다.	
		XSLFPictureData idx = ppt.addPicture(picture, PictureData.PictureType.GIF);
		// createPicture를 사용하여 슬라이드에 이미지를 포함합니다.						
		XSLFPictureShape pic = slide3.createPicture(idx);
		
		
		
				
		
		File file = new File("d:/d_other/fin.pptx");
	    try {
			FileOutputStream out = new FileOutputStream(file);
			ppt.write(out);
			System.out.println("저장완료");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
