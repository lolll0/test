package test.ver;

import java.nio.file.attribute.AclEntry;

import javax.swing.text.Document;

import org.jsoup.Jsoup;

public class movie {
	
	
	
	public static void main(String[] args) {
		String URL = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Document doc;
		
		try {
		 doc = Jsoup.connect(URL).get();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	

}
