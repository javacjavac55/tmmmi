package com.tmmmi.service.faq;
import java.awt.Image;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

	//Transferable 클래스가 implements 함으로써 싱글톤 패턴으로 이미지가 들어온 것을 이미지 데이터(클립보드에서 사용 가능한 형태의 데이터)로 반환
	public class ImageSelection  implements Transferable {

		private Image image;
		
		public ImageSelection(Image image){
			this.image = image;
   }
  
	// 이미지로 들어왔으면 이미지로 데이터를 반환
	public Object getTransferData(DataFlavor flavor) throws UnsupportedFlavorException, IOException {
	    if (!DataFlavor.imageFlavor.equals(flavor)) {
	      throw new UnsupportedFlavorException(flavor);
	    }
	    return this.image;
	}
	
	// image 형태로 들어온건지 확인해주는 메소드
	public boolean isDataFlavorSupported(DataFlavor flavor){
	    return DataFlavor.imageFlavor.equals(flavor);
	 }
	
	 public DataFlavor[] getTransferDataFlavors() {  // DataFlavor 오브젝트의  배열을 반환
	    return new DataFlavor[] { DataFlavor.imageFlavor };
	 }
}
