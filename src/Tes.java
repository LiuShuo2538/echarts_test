/**
 * Created by ${LiuShuo} on 7/27/2016.
 */
public class Tes {

    public static void main(String[] args) {
        double value = Math.random() * 1000;
        double[] obj  = new double [1000] ;

        for (int i = 0; i < 1000; i++) {
            obj[i]=value;
            System.out.println(obj[i]);
        }
    }
}
