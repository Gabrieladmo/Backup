import fatec.poo.model.Pessoa;
import fatec.poo.model.PessoaFisica;
import fatec.poo.model.PessoaJuridica;
import java.util.Calendar;
import java.util.Scanner;


/**
 *
 * @author Gabi
 */
public class Aplic {

    public static void main(String[] args) {
        
        Scanner entrada = new Scanner(System.in);
        Pessoa matPes[] = new Pessoa[20];
        int ope, ano;
        String nome, doc, tipo;
        double valor = 0, base;
        
        for(int i=0; i < matPes.length; i++){
            System.out.println("1 - Cadastrar Pessoa Física");
            System.out.println("2 - Cadastrar Pessoa Jurídica");
            System.out.println("3 - Listar");
            System.out.println("4 - Sair");
            System.out.println("\n\nDigite a opção:\n");
            
            ope = entrada.nextInt();
                    
            if(ope == 1 || ope == 2){
                entrada.nextLine();
                System.out.println("Digite o Nome: ");
                nome = entrada.nextLine();     
                
                if(ope == 1){
                    System.out.println("Digite o CPF: ");
                }else{
                    System.out.println("Digite o CGC: ");
                }
                
                doc = entrada.nextLine();
                
                System.out.println("Digite o Ano de Inscrição: ");
                ano = entrada.nextInt();
                
                if(ope == 1){
                    matPes[i] = new PessoaFisica(doc, nome, ano);
                    System.out.println("Digite o Salário Base: ");
                    base = entrada.nextDouble();
                    ((PessoaFisica) matPes[i]).setBase(base);
                }else{
                    matPes[i] = new PessoaJuridica(doc, nome, ano);
                    System.out.println("Digite a Taxa de Incentivo: ");
                    base = entrada.nextDouble();
                    ((PessoaJuridica) matPes[i]).setTaxaIncentivo(base);
                }
                
                do{
                    System.out.println("Digite o Valor da Compra (0 para parar): ");
                    valor = entrada.nextDouble();
                    matPes[i].addCompras(valor);
                }while (valor != 0 );
                
            }else if(ope == 3){
                System.out.printf("\n%-15s %-20s %-25s %15s %15s\n", "Tipo", "CPF/CGC", "Nome", "Ano Inscrição", "Bônus");
                
                for(int j = 0; j < matPes.length; j++){
                    tipo = (matPes[j] instanceof PessoaFisica) ? "Pessoa Física" : "Pessoa Jurídica";
                    doc = (matPes[j] instanceof PessoaFisica) ? ((PessoaFisica) matPes[j]).getCPF() : ((PessoaJuridica) matPes[j]).getCGC();
                    System.out.printf("\n%-15s %-20s %-25s %15s %15s\n\n", tipo, doc, matPes[j].getNome(), matPes[j].getAnoInscricao(), "R$ " + matPes[j].calcBonus(Calendar.getInstance().get(Calendar.YEAR)));
                }
            }else
                break;
        }
        
    }
    
}
