import java.util.HashMap;
import java.util.Map;

public class mandar{
    public static void main(String args[]) {
        Map <Integer , Integer > dic = new HashMap<Integer,Integer>(); 
        dic.put(1, 2); 
        dic.put(2, 3); 
        for(int i = 0 ; i < dic.size() ; i++){
            int a  = dic.get(1); 
            System.out.println(a);

        }

    }
}