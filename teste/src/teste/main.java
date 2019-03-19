package teste;

import java.util.Set;
import java.util.TreeSet;

public class main {

    public static void main(String[] args) {
        Set mySet = new TreeSet();

        mySet.add(dia.SÁBADO);

        mySet.add(dia.QUARTA);

        mySet.add(dia.SEXTA);

        mySet.add(dia.QUARTA);

        mySet.forEach((d) -> {
            System.out.println(d);
        });
    }
    
}