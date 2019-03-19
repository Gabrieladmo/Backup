package fatec.poo.model;

/**
 *
 * @author Gabi
 */
public abstract class Pessoa {
    private String nome;
    private String dtNascimento;
    private String endereco;
    private String cidade;

    public Pessoa(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public String getDtNascimento() {
        return dtNascimento;
    }

    public String getEndereco() {
        return endereco;
    }

    public String getCidade() {
        return cidade;
    }
    
}
