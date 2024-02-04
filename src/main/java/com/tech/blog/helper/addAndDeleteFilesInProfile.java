package com.tech.blog.helper;

import java.io.*;

public class addAndDeleteFilesInProfile {
	public static boolean deleteFile(String path) {
		boolean f = false;
		try {
			File file = new File(path);
			f = file.delete();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public static boolean saveFile(InputStream is ,String path) {
		boolean f = false;
		try {
			// Read data on path
			byte b[] = new byte[is.available()];
			is.read(b);
			
			// Write data on path
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
