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
			
			//Ŭ�����忡 ������ �� �ְ� ���ִ� �޼ҵ�
			public static void setClipboard(Image image) throws Exception{
				
			    if (image == null) throw new IllegalArgumentException("Image�� �����ϴ�"); 
			    ImageSelection transferable = new ImageSelection(image);
			    Toolkit.getDefaultToolkit().getSystemClipboard().setContents(transferable, null);
			    //Toolkit Ŭ������ AWT�� ������Ʈ�� ���������ִ� ������ �ָ������� �ϴ� �߻� Ŭ����
			    // Toolkit.getDefaultToolkit().getSystemClipboard() -> �ý��� Ŭ�����带 �ҷ��ͼ� setContents ->�� Ŭ�����忡 ������ ����
			    //transferable(�̹���)�� Ŭ�����忡 �����Ѵ�. owner�� Ŭ�����带 �����ϴ� ��ü�̴�. 
			}
	
	  		public static void main(String[] args) throws Exception{
	  			Robot robot = null; // java.awt.RobotŬ������ �Ϲ������� ���콺�� Ű���� ������ �� �ְ����ִ� Ŭ�����ε�
		                                  // �ڹ����α׷����� Ű����� ���콺�� ������ ���۷��̼��� �� �� �ְ� ����
	  			try {
			      GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment(); 
			      GraphicsDevice[] screens = ge.getScreenDevices();
			      Rectangle allScreenBounds = new Rectangle();
			      for (GraphicsDevice screen : screens) {
			        Rectangle screenBounds = screen.getDefaultConfiguration().getBounds();
			        allScreenBounds.width += screenBounds.width;
			        allScreenBounds.height = Math.max(allScreenBounds.height, screenBounds.height);
			      }  // ���� �׷���(����� ���°��� �����ͼ�) ������ ũ�⸸ŭ Rectangle ũ�⸦ ����
			 
			      robot = new Robot(); //Robot Ŭ������ ��ü�� ����
			      BufferedImage screenShot = robot.createScreenCapture(allScreenBounds); //���� ȭ���� ĸ��
			     
			      setClipboard(screenShot); //Ŭ�����忡 ����
	  			}
	  			catch (Exception e) {
	  				e.printStackTrace();
	  			} 
		  }
	}
}
