package com.xu.utils;

import java.util.Random;

public class RandomName {
	public static String getRandomName() {
	    String val = "";
	    Random random = new Random();
	    for (int i = 0; i < 6; i++) {
	        // �����ĸ��������
	        String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
		// �ַ���
		if ("char".equalsIgnoreCase(charOrNum)) {
		    // ȡ�ô�д��ĸ����Сд��ĸ
		    int choice = random.nextInt(2) % 2 == 0 ? 65 : 97;
		    val += (char) (choice + random.nextInt(26));
		} else if ("num".equalsIgnoreCase(charOrNum)) { // ����
		    val += String.valueOf(random.nextInt(10));
		}
	    }
	    return val;
	}
}
