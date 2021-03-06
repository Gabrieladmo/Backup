package fatec.pweb.managedbeans;

import java.io.Serializable;
import java.util.List;

import javax.enterprise.inject.Alternative;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import fatec.pweb.model.APrazo;
import fatec.pweb.model.AVista;
import fatec.pweb.model.Aluno;
import fatec.pweb.model.Curso;
import fatec.pweb.model.Instrutor;
import fatec.pweb.model.Matricula;
import fatec.pweb.model.Turma;
import fatec.pweb.service.APrazoService;
import fatec.pweb.service.AVistaService;
import fatec.pweb.service.AlunoService;
import fatec.pweb.service.CursoService;
import fatec.pweb.service.InstrutorService;
import fatec.pweb.service.MatriculaService;
import fatec.pweb.service.TurmaService;
import fatec.pweb.util.Util;

@ManagedBean
@ViewScoped
public class MatriculaMB implements Serializable {

	private static final long serialVersionUID = 1L;
	private Curso curso = new Curso();
	private CursoService cursoService = new CursoService();
	private List<Curso> cursos;
	private Turma turma = new Turma();
	private TurmaService turmaService = new TurmaService();
	private List<Turma> turmas;
	private Aluno aluno = new Aluno();
	private AlunoService alunoService = new AlunoService();
	private Matricula matricula = new Matricula();
	private MatriculaService matriculaService = new MatriculaService();
	private APrazo aPrazo = new APrazo();
	private APrazoService aPrazoService = new APrazoService();
	private AVista aVista = new AVista();
	private AVistaService aVistaService = new AVistaService();

	private String focus = "txtDtMatricula";
	private String selecionado = "rdbAvista";

	private boolean campoCpf = false;
	private boolean rdbAprazo = false;
	private boolean rdbAvista = false;
	private boolean habilitarCorpo = false;
	private boolean modoInsercao = false;
	private boolean modoAlteracao = false;
	private boolean compoAprazo = false;
	private boolean compoAvista = false;

	public MatriculaMB() {
		cursos = cursoService.getCursos();
		if (cursos.size() > 0) {
			curso = cursos.get(0);
			turmas = curso.getTurmas();
			if (turmas.size() > 0) {
				turma = turmas.get(0);
			}
		}

		liberaCpf();
	}

	public void trocaCurso() {
		turmas = turmaService.getTurmasByCurso(curso);
		if (turmas.size() > 0)
			turma = turmas.get(0);

		else
			turma = null;

		liberaCpf();
	}

	public void liberaCpf() {
		if (turma != null) {
			campoCpf = true;
		} else {
			campoCpf = false;
		}
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

	public List<Curso> getCursos() {
		return cursos;
	}

	public Turma getTurma() {
		return turma;
	}

	public void setTurma(Turma turma) {
		this.turma = turma;
	}

	public List<Turma> getTurmas() {
		return turmas;
	}

	public void setTurmas(List<Turma> turmas) {
		this.turmas = turmas;
	}

	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}

	public boolean isHabilitarCorpo() {
		return habilitarCorpo;
	}

	public void setHabilitarCorpo(boolean habilitarCorpo) {
		this.habilitarCorpo = habilitarCorpo;
	}

	public boolean isModoInsercao() {
		return modoInsercao;
	}

	public void setModoInsercao(boolean modoInsercao) {
		this.modoInsercao = modoInsercao;
	}

	public boolean isModoAlteracao() {
		return modoAlteracao;
	}

	public void setModoAlteracao(boolean modoAlteracao) {
		this.modoAlteracao = modoAlteracao;
	}

	public Matricula getMatricula() {
		return matricula;
	}

	public void setMatricula(Matricula matricula) {
		this.matricula = matricula;
	}

	public String getFocus() {
		return focus;
	}

	public void setFocus(String focus) {
		this.focus = focus;
	}

	public void salvar() {

		if (aPrazo != null) {
			aPrazo = aPrazoService.salvar(aPrazo);
			aVista = null;
		} else {
			aVista = aVistaService.salvar(aVista);
			aPrazo = null;
		}

		matricula.setAprazo(aPrazo);
		matricula.setAvista(aVista);

		matricula = matriculaService.salvar(matricula);
		if (modoInsercao) {
			Util.addInfo("Inser��o", "A matr�cula foi inserida com sucesso!");
		} else {
			Util.addInfo("Altera��o", "A matr�cula foi alterada com sucesso!");
		}

		aVista = new AVista();
		aPrazo = new APrazo();
		matricula = new Matricula();

		habilitarCorpo = false;
		modoAlteracao = false;
		modoInsercao = false;
		focus = "txtCpf";

	}

	public void remover() {

		if (matricula.getAprazo() != null) {
			aPrazo = matricula.getAprazo();
		} else {
			aVista = matricula.getAvista();
		}

		matriculaService.remover(matricula);
		if (aPrazo != null) {
			aPrazoService.remover(aPrazo);
		} else {
			aVistaService.remover(aVista);
		}

		Util.addInfo("Exclus�o", "A matr�cula foi exclu�da com sucesso!");

		aVista = new AVista();
		aPrazo = new APrazo();
		matricula = new Matricula();

		habilitarCorpo = false;
		modoAlteracao = false;
		modoInsercao = false;
		focus = "txtCpf";

	}

	public void consultar() {
		if (Util.validarCPF(aluno.getCpf().replaceAll("[^0-9]", ""))) {
			InstrutorService instrutorService = new InstrutorService();
			Instrutor instrutor = new Instrutor();
			instrutor.setCpf(aluno.getCpf());
			instrutor = instrutorService.getById(instrutor);
			
			if (instrutor != null) {
				Util.addErro("CPF Inv�lido", "O CPF j� est� sendo utilizado por um instrutor.");
				focus = "txtCpf";
			} else {
				Aluno consultaAluno = alunoService.getById(aluno);

				habilitarCorpo = true;
				if (consultaAluno != null) {
					Matricula consultaMatricula = matriculaService.getMatriculaByIds(aluno.getCpf(),
					turma.getSiglaTurma());
					
					if (consultaMatricula != null) {
						matricula = consultaMatricula;
						modoAlteracao = true;
						modoInsercao = false;
						if (matricula.getAprazo() != null) {
							compoAprazo = true;
							aPrazo = aPrazoService.getAprazoById(matricula.getAprazo().getCodigo());
						} else {
							compoAvista = true;
							aVista = aVistaService.getAvistaById(matricula.getAvista().getCodigo());
						}

					} else {
						modoAlteracao = false;
						modoInsercao = true;
					}

				} else {
					Util.addErro("404 - N�o Encontrado", "Aluno n�o encontrado nos registros.");
					focus = "txtCpf";
				}
				focus = "txtCpf";
			}
		} else {
			Util.addErro("CPF Inv�lido", "Por favor, digite um CPF v�lido.");
			focus = "txtCpf";
		}
	}

	public boolean isCompoAprazo() {
		return compoAprazo;
	}

	public void setCompoAprazo(boolean compoAprazo) {
		this.compoAprazo = compoAprazo;
	}

	public boolean isCompoAvista() {
		return compoAvista;
	}

	public void setCompoAvista(boolean compoAvista) {
		this.compoAvista = compoAvista;
	}

	public String getSelecionado() {
		return selecionado;
	}

	public void setSelecionado(String selecionado) {
		this.selecionado = selecionado;
	}

	public boolean isCampoCpf() {
		return campoCpf;
	}

	public void setCampoCpf(boolean campoCpf) {
		this.campoCpf = campoCpf;
	}

	public APrazo getaPrazo() {
		return aPrazo;
	}

	public void setaPrazo(APrazo aPrazo) {
		this.aPrazo = aPrazo;
	}

	public AVista getaVista() {
		return aVista;
	}

	public void setaVista(AVista aVista) {
		this.aVista = aVista;
	}

	
}
