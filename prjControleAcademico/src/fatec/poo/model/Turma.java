package fatec.poo.model;

/**
 *
 * @author Gabi
 */
public class Turma {
    private String sigla;
    private int qtdevagas;
    private Curso curso;
    private Professor professor;
    private Aluno alunos[] = new Aluno[5];
    private int numalu;

    public Turma(String sigla, int qtdevagas) {
        this.sigla = sigla;
        this.qtdevagas = qtdevagas;
    }

    public String getSigla() {
        return sigla;
    }

    public int getQtdevagas() {
        return qtdevagas;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
    }

    public Curso getCurso() {
        return curso;
    }

    public Professor getProfessor() {
        return professor;
    }
    
    public void addAluno(Aluno aluno){
        if(numalu < qtdevagas){
            alunos[numalu] = new Aluno(aluno.getRa(), aluno.getNome());
            numalu++;
        }else{
            System.out.println("\nLimite de Alunos Atingido!");
        }
    }
    
    public void listarAlunos(){
        System.out.println("\t\tLista de Frequência\n\n");
        System.out.println("Sigla do Curso:    " + curso.getSigla() + "\tNome do Curso: " + curso.getDescricao());
        System.out.println("\nSigla Turma:       " + getSigla());
        System.out.println("\nNome do Professor: " + professor.getNome());
        System.out.println("\n\n\tNome do Aluno\n");
        
        for(int i = 0; i < numalu; i++){
            System.out.println((i+1) + " - " + alunos[i].getNome());
        }
    }
}
