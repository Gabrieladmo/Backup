package managedbeans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import entidades.Aluno;
import java.util.ArrayList;
import java.util.List;

@ManagedBean
@SessionScoped
public class AlunoMB {
	private List<Aluno> listaAluno = new ArrayList<Aluno>();
	private Aluno aluno = new Aluno();

	public void salvar() {
		listaAluno.add(aluno);
		aluno = new Aluno();
	}

	public List<Aluno> getAlunos() {
		return listaAluno;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

}
