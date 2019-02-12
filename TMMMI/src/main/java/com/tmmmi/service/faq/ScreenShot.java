package com.tmmmi.service.faq;

import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

public class ScreenShot{
	
		public static class start {
			
			//클립보드에 복사할 수 있게 해주는 메소드
			public static void setClipboard(Image image) throws Exception{
				
			    if (image == null) throw new IllegalArgumentException("Image가 없습니다"); 
			    ImageSelection transferable = new ImageSelection(image);
			    Toolkit.getDefaultToolkit().getSystemClipboard().setContents(transferable, null);
			    //Toolkit 클래스는 AWT의 컴포넌트를 생성시켜주는 역할을 주목적으로 하는 추상 클래스
			    // Toolkit.getDefaultToolkit().getSystemClipboard() -> 시스템 클립보드를 불러와서 setContents ->그 클립보드에 내용을 셋팅
			    //transferable(이미지)를 클립보드에 복사한다. owner는 클립보드를 소유하는 객체이다. 
			}
	
	  		public static void main(String[] args) throws Exception{
	  			Robot robot = null; // java.awt.Robot클래스는 일반적으로 마우스와 키보드 제어할 수 있게해주는 클래스인데
		                                  // 자바프로그램에서 키보드와 마우스와 연관된 오퍼레이션을 할 수 있게 해줌
	  			try {
			      GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment(); 
			      GraphicsDevice[] screens = ge.getScreenDevices();
			      Rectangle allScreenBounds = new Rectangle();
			      for (GraphicsDevice screen : screens) {
			        Rectangle screenBounds = screen.getDefaultConfiguration().getBounds();
			        allScreenBounds.width += screenBounds.width;
			        allScreenBounds.height = Math.max(allScreenBounds.height, screenBounds.height);
			      }  // 현재 그래픽(모니터 상태값을 가져와서) 사이즈 크기만큼 Rectangle 크기를 설정
			 
			      robot = new Robot(); //Robot 클래스의 객체를 생성
			      BufferedImage screenShot = robot.createScreenCapture(allScreenBounds); //현재 화면을 캡쳐
			     
			      setClipboard(screenShot); //클립보드에 복사
	  			}
	  			catch (Exception e) {
	  				e.printStackTrace();
	  			} 
		  }
	}
}
