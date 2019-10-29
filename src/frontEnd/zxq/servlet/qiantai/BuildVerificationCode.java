package frontEnd.zxq.servlet.qiantai;

//import org.junit.Test;

import java.util.Random;
import java.util.Scanner;

/**
 * 生成一串验证码大小写字母和数字
 */

public class BuildVerificationCode {
    String num ;
    char[] chars ;
    char[] charsM;
   char[] verification;

   //得到verification

    public char[] getVerification() {
        return verification;
    }

    public BuildVerificationCode() {
        String num = "0123456789";
        char[] chars =new char[26];
        char[] charsM = new char[26];
        verification = new char[9];
        Random random = new Random();
        //给chars和charsM赋值
        for(int i = 0;i<=25;i++){
            chars[i] = (char)(97 +i);
            charsM[i] = (char)(65+i);
        }
        //给verification赋值
        for (int i = 1;i<8; i++){
            if(i%2==0){
                verification[i] = charsM[random.nextInt(26)];
            }else if (i%3==0){
                verification[i] = chars[random.nextInt(26)];
            }else {
                verification[i] = num.charAt(random.nextInt(10));
            }

        }


    }

//    @Test
   public void text (){
        BuildVerificationCode b = new BuildVerificationCode();
        int j='a';
        int k = 'A';
        int h = 'z';
        int f = 'Z';

        System.out.println(6%2);
        System.out.println(8%3);
        System.out.println(6%3);
        System.out.println(f);
        System.out.println(b.verification);

    }
}
