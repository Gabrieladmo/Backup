/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fatec.poo.view;

import fatec.poo.control.Conexao;
import fatec.poo.control.DaoCurso;
import fatec.poo.model.Curso;
import java.awt.Component;
import java.awt.HeadlessException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author 0030481711016
 */
public class frmCurso extends javax.swing.JFrame {

    /**
     * Creates new form GuiCurso
     */
    public frmCurso() {
        initComponents();
    }
    
    private void limparCampos() {
        for (Component component : getContentPane().getComponents()) {
            if (!(component instanceof JLabel)) {
                component.setEnabled(false);
            }
            if (component instanceof JTextField) {
                ((JTextField) component).setText("");
            } else if (component instanceof JFormattedTextField) {
                ((JFormattedTextField) component).setValue("");
            } else if (component instanceof JComboBox) {
                ((JComboBox) component).setSelectedIndex(0);
            }
        }
        
        txtSiglaCurso.setEnabled(true);
        btnConsultar.setEnabled(true);
        btnSair.setEnabled(true);
    }

    private void alterarEstado(Component[] componentes, boolean estado) {
        for (Component componente : componentes) {
            componente.setEnabled(estado);
        }
    }
    
    private Curso formToObject(){
        Curso curso = new Curso(txtSiglaCurso.getText(), txtNomeCurso.getText());
        curso.setCargaHoraria(Integer.valueOf(txtCargaHor.getText()));
        curso.setDataVigencia(txtDataVig.getText().replaceAll("[^0-9]", ""));
        curso.setValor(Double.valueOf(txtValCurso.getText().replace(".", "").replace(",", ".")));
        curso.setValorHoraInstrutor(Double.valueOf(txtValHorInst.getText().replace(".", "").replace(",", ".")));
        curso.setPrograma(txtProgCurso.getText());
        
        return curso;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lblSiglaCurso = new javax.swing.JLabel();
        lblNomeCurso = new javax.swing.JLabel();
        lblCargaHor = new javax.swing.JLabel();
        lblValorCurso = new javax.swing.JLabel();
        lblProgCurso = new javax.swing.JLabel();
        txtSiglaCurso = new javax.swing.JTextField();
        txtNomeCurso = new javax.swing.JTextField();
        txtCargaHor = new javax.swing.JTextField();
        txtProgCurso = new javax.swing.JTextField();
        lblDataVigencia = new javax.swing.JLabel();
        txtDataVig = new javax.swing.JFormattedTextField();
        lblDataVigencia1 = new javax.swing.JLabel();
        txtValCurso = new javax.swing.JFormattedTextField();
        btnConsultar = new javax.swing.JButton();
        btnInserir = new javax.swing.JButton();
        btnAlterar = new javax.swing.JButton();
        btnExcluir = new javax.swing.JButton();
        btnSair = new javax.swing.JButton();
        txtValHorInst = new javax.swing.JFormattedTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Cadastrar Curso");
        setMinimumSize(new java.awt.Dimension(586, 250));
        setName("frmCurso"); // NOI18N
        setPreferredSize(new java.awt.Dimension(586, 230));
        setResizable(false);
        setSize(new java.awt.Dimension(586, 230));
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        lblSiglaCurso.setText("Sigla curso");

        lblNomeCurso.setText("Nome curso");

        lblCargaHor.setText("Carga horária");

        lblValorCurso.setText("Valor curso");

        lblProgCurso.setText("Programa do curso");

        txtNomeCurso.setEnabled(false);

        txtCargaHor.setEnabled(false);

        txtProgCurso.setEnabled(false);

        lblDataVigencia.setText("Data de vigência");

        try {
            txtDataVig.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.MaskFormatter("##/##/####")));
        } catch (java.text.ParseException ex) {
            ex.printStackTrace();
        }
        txtDataVig.setEnabled(false);

        lblDataVigencia1.setText("Valor hora instrutor");

        txtValCurso.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#,##0.00"))));
        txtValCurso.setEnabled(false);

        btnConsultar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/fatec/poo/view/icon/pesq.png"))); // NOI18N
        btnConsultar.setText("Consultar");
        btnConsultar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnConsultarActionPerformed(evt);
            }
        });

        btnInserir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/fatec/poo/view/icon/add.png"))); // NOI18N
        btnInserir.setText("Inserir");
        btnInserir.setEnabled(false);
        btnInserir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnInserirActionPerformed(evt);
            }
        });

        btnAlterar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/fatec/poo/view/icon/Alterar.png"))); // NOI18N
        btnAlterar.setText("Alterar");
        btnAlterar.setEnabled(false);
        btnAlterar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAlterarActionPerformed(evt);
            }
        });

        btnExcluir.setIcon(new javax.swing.ImageIcon(getClass().getResource("/fatec/poo/view/icon/Eraser.png"))); // NOI18N
        btnExcluir.setText("Excluir");
        btnExcluir.setEnabled(false);
        btnExcluir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExcluirActionPerformed(evt);
            }
        });

        btnSair.setIcon(new javax.swing.ImageIcon(getClass().getResource("/fatec/poo/view/icon/exit.png"))); // NOI18N
        btnSair.setText("Sair");
        btnSair.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSairActionPerformed(evt);
            }
        });

        txtValHorInst.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#,##0.00"))));
        txtValHorInst.setEnabled(false);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(76, 76, 76)
                        .addComponent(lblSiglaCurso)
                        .addGap(4, 4, 4)
                        .addComponent(txtSiglaCurso, javax.swing.GroupLayout.PREFERRED_SIZE, 71, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(71, 71, 71)
                        .addComponent(lblNomeCurso)
                        .addGap(4, 4, 4)
                        .addComponent(txtNomeCurso, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(37, 37, 37)
                        .addComponent(lblProgCurso)
                        .addGap(4, 4, 4)
                        .addComponent(txtProgCurso, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(37, 37, 37)
                        .addComponent(btnConsultar)
                        .addGap(6, 6, 6)
                        .addComponent(btnInserir, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(6, 6, 6)
                        .addComponent(btnAlterar, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(6, 6, 6)
                        .addComponent(btnExcluir, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(6, 6, 6)
                        .addComponent(btnSair, javax.swing.GroupLayout.PREFERRED_SIZE, 99, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(61, 61, 61)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(lblValorCurso)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtValCurso, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(71, 71, 71)
                                .addComponent(lblDataVigencia1))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(lblCargaHor)
                                .addGap(4, 4, 4)
                                .addComponent(txtCargaHor, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(67, 67, 67)
                                .addComponent(lblDataVigencia)))
                        .addGap(10, 10, 10)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtDataVig, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtValHorInst, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(20, 20, 20))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addComponent(lblSiglaCurso))
                    .addComponent(txtSiglaCurso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addComponent(lblNomeCurso))
                    .addComponent(txtNomeCurso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(txtCargaHor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtDataVig, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblCargaHor)
                            .addComponent(lblDataVigencia))))
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(lblValorCurso)
                            .addComponent(txtValCurso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(txtValHorInst, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(lblDataVigencia1)))
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addComponent(lblProgCurso))
                    .addComponent(txtProgCurso, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(btnConsultar)
                    .addComponent(btnInserir)
                    .addComponent(btnAlterar)
                    .addComponent(btnExcluir)
                    .addComponent(btnSair))
                .addContainerGap(20, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        Conexao con = new Conexao("BD1711046", "BD1711046");
        con.setDriver("oracle.jdbc.driver.OracleDriver");
        con.setConnectionString("jdbc:oracle:thin:@apolo:1521:xe");
        daoCurso = new DaoCurso(con.conectar()); 
    }//GEN-LAST:event_formWindowOpened

    private void btnConsultarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnConsultarActionPerformed
        if (txtSiglaCurso.getText().trim().length() > 0) {
            Curso curso = daoCurso.consultar(txtSiglaCurso.getText());
            
            alterarEstado(getContentPane().getComponents(), true);
            txtSiglaCurso.setEnabled(false);
            btnConsultar.setEnabled(false);
            
            if(curso != null){
                btnInserir.setEnabled(false);
                txtNomeCurso.setText(curso.getNome());
                txtCargaHor.setText(String.valueOf(curso.getCargaHoraria()));
                txtDataVig.setText(curso.getDataVigencia());
                txtValCurso.setValue(curso.getValor());
                txtValHorInst.setValue(curso.getValorHoraInstrutor());
                txtProgCurso.setText(curso.getPrograma());
            }else{
                btnAlterar.setEnabled(false);
                btnExcluir.setEnabled(false);
            }
            
            txtNomeCurso.requestFocus();
        }else{
            JOptionPane.showMessageDialog(this, "Informe uma sigla de curso!", "Sigla do Curso", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnConsultarActionPerformed

    private void btnSairActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSairActionPerformed
        dispose();
    }//GEN-LAST:event_btnSairActionPerformed

    private void btnInserirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnInserirActionPerformed
        try {
            Curso curso = formToObject();
            daoCurso.inserir(curso);
            JOptionPane.showMessageDialog(this, "O Curso foi inserido com sucesso!", "Cadastro", JOptionPane.INFORMATION_MESSAGE);
            limparCampos();
        } catch (HeadlessException e) {
            JOptionPane.showMessageDialog(this, "ERRO: " + e.getMessage(), "ERRO!", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnInserirActionPerformed

    private void btnAlterarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAlterarActionPerformed
        try {
            Curso curso = formToObject();
            daoCurso.alterar(curso);
            JOptionPane.showMessageDialog(this, "O Curso foi alterado com sucesso!", "Alteração", JOptionPane.INFORMATION_MESSAGE);
            limparCampos();
        } catch (HeadlessException e) {
            JOptionPane.showMessageDialog(this, "ERRO: " + e.getMessage(), "ERRO!", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnAlterarActionPerformed

    private void btnExcluirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExcluirActionPerformed
        try {
            Curso curso = new Curso(txtSiglaCurso.getText(), txtNomeCurso.getText());
            daoCurso.excluir(curso);
            JOptionPane.showMessageDialog(this, "O Curso foi excluído com sucesso!", "Exclusão", JOptionPane.INFORMATION_MESSAGE);
            limparCampos();
        } catch (HeadlessException e) {
            JOptionPane.showMessageDialog(this, "ERRO: " + e.getMessage(), "ERRO!", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnExcluirActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Windows".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(frmCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frmCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frmCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frmCurso.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frmCurso().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAlterar;
    private javax.swing.JButton btnConsultar;
    private javax.swing.JButton btnExcluir;
    private javax.swing.JButton btnInserir;
    private javax.swing.JButton btnSair;
    private javax.swing.JLabel lblCargaHor;
    private javax.swing.JLabel lblDataVigencia;
    private javax.swing.JLabel lblDataVigencia1;
    private javax.swing.JLabel lblNomeCurso;
    private javax.swing.JLabel lblProgCurso;
    private javax.swing.JLabel lblSiglaCurso;
    private javax.swing.JLabel lblValorCurso;
    private javax.swing.JTextField txtCargaHor;
    private javax.swing.JFormattedTextField txtDataVig;
    private javax.swing.JTextField txtNomeCurso;
    private javax.swing.JTextField txtProgCurso;
    private javax.swing.JTextField txtSiglaCurso;
    private javax.swing.JFormattedTextField txtValCurso;
    private javax.swing.JFormattedTextField txtValHorInst;
    // End of variables declaration//GEN-END:variables
    DaoCurso daoCurso;
}
