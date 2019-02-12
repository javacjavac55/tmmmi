package com.tmmmi.service.faq;
import java.awt.Image;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

	//Transferable Ŭ������ implements �����ν� �̱��� �������� �̹����� ���� ���� �̹��� ������(Ŭ�����忡�� ��� ������ ������ ������)�� ��ȯ
	public class ImageSelection  implements Transferable {

		private Image image;
		
		public ImageSelection(Image image){
			this.image = image;
   }
  
	// �̹����� �������� �̹����� �����͸� ��ȯ
	public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException, IOException {
	    if (!DataFlavor.imageFlavor.equals(flavor)) {
	      throw new UnsupportedFlavorException(flavor);
	    }
	    return this.image;
	}
	
	// image ���·� ���°��� Ȯ�����ִ� �޼ҵ�
	public boolean isDataFlavorSupported(DataFlavor flavor){
	    return DataFlavor.imageFlavor.equals(flavor);
	 }
	
	 public DataFlavor[] getTransferDataFlavors() {  // DataFlavor ������Ʈ��  �迭�� ��ȯ
	    return new DataFlavor[] { DataFlavor.imageFlavor };
	 }
}
