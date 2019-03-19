package fatec.poo.model;

/**
 *
 * @author Gabi
 */
public class Aluno extends Pessoa{
    private String ra;
    private int escolaridade;

    public Aluno(String ra, String nome) {
        super(nome);
        this.ra = ra;
    }

    public String getRa() {
        return ra;
    }

    public int getEscolaridade() {
        return escolaridade;
    }
    
}
