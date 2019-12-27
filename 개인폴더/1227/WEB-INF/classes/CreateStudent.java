package javabean;
import java.util.ArrayList;


public class CreateStudent {
	private ArrayList<StudentBean> arr = new ArrayList<StudentBean>(5);
	private String att;

	
	public ArrayList<StudentBean> studentArr(){
		
		StudentBean stu1 = null;
		StudentBean stu2 = null;
		StudentBean stu3 = null;
		StudentBean stu4 = null;
		StudentBean stu5 = null;
		stu1.setId("id001");
		stu1.setName("ȫ�浿");
		stu1.setSnum("001");
		stu1.setYear(2000);
		stu1.setPass("456456");
		stu1.setEmail("qwer11@naver.com");
		arr.add(stu1);
		
		stu2.setId("id002");
		stu2.setName("ȫ�浿");
		stu2.setSnum("002");
		stu2.setYear(2001);
		stu2.setPass("123123");
		stu2.setEmail("qwewww9@naver.com");
		arr.add(stu2);
		
		stu3.setId("id001");
		stu3.setName("ȫ�浿");
		stu3.setSnum("001");
		stu3.setYear(2000);
		stu3.setPass("456456");
		stu3.setEmail("qwer11@naver.com");
		arr.add(stu3);
		
		stu4.setId("id001");
		stu4.setName("ȫ�浿");
		stu4.setSnum("001");
		stu4.setYear(2000);
		stu4.setPass("456456");
		stu4.setEmail("qwer11@naver.com");
		arr.add(stu4);
		
		stu5.setId("id001");
		stu5.setName("ȫ�浿");
		stu5.setSnum("001");
		stu5.setYear(2000);
		stu5.setPass("456456");
		stu5.setEmail("qwer11@naver.com");
		arr.add(stu5);
		return arr;
	}
	void a()
	{
	}


}
