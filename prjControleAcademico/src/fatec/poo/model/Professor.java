package fatec.poo.model;

/**
 *
 * @author Gabi
 */
public class Professor extends Pessoa {
    private String regfunc;
    private int titularidade;
    private int areaAtuacao;

    public Professor(String regfunc, String nome) {
        super(nome);
        this.regfunc = regfunc;
    }

    public String getRegfunc() {
        return regfunc;
    }

    public int getTitularidade() {
        return titularidade;
    }

    public int getAreaAtuacao() {
        return areaAtuacao;
    }
    
}
