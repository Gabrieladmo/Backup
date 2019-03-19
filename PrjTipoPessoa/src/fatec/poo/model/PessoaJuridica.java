package fatec.poo.model;

/**
 *
 * @author Gabi
 */
public class PessoaJuridica extends Pessoa{

    private String CGC;
    private double TaxaIncentivo;
    
    public String getCGC(){
        return CGC;
    }
    
    public double getTaxaIncentivo(){
        return TaxaIncentivo;
    }
    
    public void setTaxaIncentivo(double TaxaIncentivo){
        this.TaxaIncentivo = TaxaIncentivo;
    }

    public PessoaJuridica(String CGC, String nome, int AnoInscricao) {
        super(nome, AnoInscricao);
        this.CGC = CGC;
    }
    
    @Override
    public double calcBonus(int x) {
        return (TaxaIncentivo * getTotalCompras() / 100) * (x - getAnoInscricao());
    }
    
}
