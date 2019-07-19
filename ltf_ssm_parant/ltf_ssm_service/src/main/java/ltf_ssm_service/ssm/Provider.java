package ltf_ssm_service.ssm;

import java.io.IOException;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Provider {
	public static void main(String[] args) throws IOException {
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext-service.xml");
		ac.start();
		// 要等
		System.in.read();// 程序不会立即结束
		ac.close();

	}
}
