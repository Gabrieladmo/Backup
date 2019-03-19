package padrao;

import fatec.poo.model.Aluno;
import fatec.poo.model.Curso;
import fatec.poo.model.Professor;
import fatec.poo.model.Turma;

/**
 *
 * @author Gabi
 */
public class Aplic {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Professor professor = new Professor("01","Gabriela");
        Curso curso = new Curso("ECO", "Economia", "120");
        Turma turma = new Turma("A01",10);
        Aluno aluno1 = new Aluno("01","Gabriel");
        Aluno aluno2 = new Aluno("02","Ana");
        Aluno aluno3 = new Aluno("03","Clara");
        Aluno aluno4 = new Aluno("04","Lívia");
        Aluno aluno5 = new Aluno("05","Rafael");
        
        turma.addAluno(aluno1);
        turma.addAluno(aluno2);
        turma.addAluno(aluno3);
        turma.addAluno(aluno4);
        turma.addAluno(aluno5);
        turma.setCurso(curso);
        turma.setProfessor(professor);
        
        turma.listarAlunos();
    }
    
}
