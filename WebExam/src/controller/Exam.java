package controller;

public class Exam {
	public void dddd() {
		int n=1000;
		while(n!=1) {
			if(n%3==0){
			    n=n/3;
			}else if(n%2==0){
			    n=n/2;
			}else{
			    n=n-1;
			}
		}
		System.out.println(n);
	}
}
