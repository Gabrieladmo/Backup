package fatec.poo.model;

import java.util.Calendar;

/**
 *
 * @author Gabi
 */
public class PessoaFisica extends Pessoa{
    
    private String CPF;
    private double Base;
    private int AnoAtual;
    
    public double getBase(){
        return Base;
    }
    
    public String getCPF(){
        return CPF;
    }

    public void setBase(double Base) {
        this.Base = Base;
    }

    public PessoaFisica(String CPF, String nome, int AnoInscricao) {
        super(nome, AnoInscricao);
        this.CPF = CPF;
    }
    
    @Override
    public double calcBonus(int x) {
        return getTotalCompras() > 12000 ? Base*(x - getAnoInscricao()) : 0;
    }
    
}
