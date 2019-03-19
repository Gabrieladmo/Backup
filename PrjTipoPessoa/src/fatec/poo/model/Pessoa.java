package fatec.poo.model;

import java.util.Calendar;

/**
 *
 * @author Gabi
 */
public abstract class Pessoa {
    
    private String nome;
    private int AnoInscricao;
    private double TotalCompras;
    
    public Pessoa(String nome, int AnoInscricao) {
        this.nome = nome;
        this.AnoInscricao = AnoInscricao;
    }
    
    public abstract double calcBonus(int x);
    
    public void addCompras(double x){
        TotalCompras += x;
    }

    public String getNome(){
        return nome;
    }
    
    public int getAnoInscricao(){
        return AnoInscricao;
    }
    
    public double getTotalCompras(){
        return TotalCompras;
    }
   
}
