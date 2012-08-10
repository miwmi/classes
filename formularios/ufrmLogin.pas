unit ufrmLogin;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ClientDataSetUrb, DB, DBClient, uVariaveisGlobais, Dialogs,
  FMTBcd, Provider, DataSetProviderUrb, SqlExpr, ComCtrls;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    cdsLogin: TClientDataSetUrb;
    Panel1: TPanel;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    txtSistemaSenha: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    txtSistemaUsuario: TEdit;
    Panel6: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlImagem01: TPanel;
    pnlImagem02: TPanel;
    pnlLogo: TPanel;
    imgLogo: TImage;
    dspLogin: TDataSetProviderUrb;
    sqlLogin: TSQLDataSet;
    btnOpcoes: TButton;
    pgcOpcoes: TPageControl;
    tshSistema: TTabSheet;
    tshArqConfig: TTabSheet;
    lblArqConfigINI: TLabel;
    Label6: TLabel;
    txtArqConfigRave: TEdit;
    txtArqConfigINI: TEdit;
    btnArqIni: TButton;
    btnArqRav: TButton;
    OpenDialogINI: TOpenDialog;
    OpenDialogRave: TOpenDialog;
    btnGravar: TButton;
    gbxBancoDados: TGroupBox;
    lblSistemaBDFabricante: TLabel;
    cbxSistemaBDFabricante: TComboBox;
    lblSistemaBDHost: TLabel;
    txtSistemaBDHost: TEdit;
    txtSistemaBDPorta: TEdit;
    lblSistemaBDPorta: TLabel;
    txtSistemaBDEsquema: TEdit;
    lblSistemaBDEsquema: TLabel;
    lblSistemaBDUsuario: TLabel;
    txtSistemaBDUsuario: TEdit;
    lblSistemaBDSenha: TLabel;
    txtSistemaBDSenha: TEdit;
    gbxArqIni: TGroupBox;
    Label5: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label7: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure Frm(Sender: TObject);
    procedure btnOpcoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnArqIniClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iTentaAbrirForm:      integer;
    iTentaAbrirFormTotal: integer;

  end;

{
const
  sSQLUSUARIO = ' SELECT u.ID_Usuario, ' +
                '        u.Login, ' +
                '        u.Senha, ' +
                '        u.Nome, ' +
                '        u.ID_Setor, ' +
                '        u.Ramal, ' +
                '        VERSION() AS VersaoBDServer, ' +
                '        USER() AS UsuarioBD ' +
                ' FROM   usuario u WHERE u.Login = :sLogin';
}

var
  frmLogin:            TfrmLogin;
  iFlag:               Integer;
  sBancoDeDadosNome:   String;
  sBancoDeDadosDriver: String;
////  sBDRadiusDriver:     String;
////  sBDRadiusNome:       String;

implementation

uses ufrmPrincipal;

{$R *.dfm}

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.OKBtnClick(Sender: TObject);
begin
  // Verifica se o usu�rio foi digitado.
  if Self.txtSistemaUsuario.Text = '' then
  begin
    ShowMessage('Voc� deve digitar um login de usu�rio v�lido para entrar no sistema! Voc� tem somente mais ' + IntToStr( 3 - Self.iTentaAbrirForm ) + ' Tentativa(s)!' );
    Self.txtSistemaUsuario.SetFocus;
    Self.ModalResult := 3;
    Exit;
  end;
  // Verifica se a senha foi digitada
  if Self.txtSistemaSenha.Text = '' then
  begin
    ShowMessage('Voc� deve digitar uma senha de usu�rio v�lida para entrar no sistema! Voc� tem somente mais ' + IntToStr( 3 - Self.iTentaAbrirForm ) + ' Tentativa(s)!' );
    Self.txtSistemaSenha.SetFocus;
    Self.ModalResult := 3;
    Exit;
  end;

  // Trata exce��o de conex�o com o banco de dados.
  try
    // CONFIGURA O CONEX�O AO BANCO DE DADOS.
    frmPrincipal.ConexaoBD.Params.Clear;
 {
    // Configura��o para o mysql 5.1 (Delphi 7).
    frmPrincipal.ConexaoBD.Params.Add( 'DriverName='        + cbxSistemaBDFabricante.Text );
    frmPrincipal.ConexaoBD.Params.Add( 'HostName='          + txtSistemaBDHost.Text     );
    frmPrincipal.ConexaoBD.Params.Add( 'Database='          + txtSistemaBDEsquema.Text  );
    frmPrincipal.ConexaoBD.Params.Add( 'User_Name='         + txtSistemaUsuario.Text    );
    frmPrincipal.ConexaoBD.Params.Add( 'Password='          + txtSistemaSenha.Text      );
    frmPrincipal.ConexaoBD.Params.Add( 'BlobSize='          + '-1' );
    frmPrincipal.ConexaoBD.Params.Add( 'ErrorResourceFile=' + '' );
    frmPrincipal.ConexaoBD.Params.Add( 'LocaleCode='        + '0000' );
    frmPrincipal.ConexaoBD.GetDriverFunc := 'getSQLDriverMYSQL50';
    frmPrincipal.ConexaoBD.LibraryName   := 'dbxopenmysql50.dll';
    frmPrincipal.ConexaoBD.VendorLib     := 'libmysql.dll';
}

    // Configura��o para o mysql 5 e Delphi 2007.
    frmPrincipal.ConexaoBD.Params.Add( 'DriverName='        + cbxSistemaBDFabricante.Text );
    frmPrincipal.ConexaoBD.Params.Add( 'HostName='          + txtSistemaBDHost.Text     );
    frmPrincipal.ConexaoBD.Params.Add( 'Database='          + txtSistemaBDEsquema.Text  );
    frmPrincipal.ConexaoBD.Params.Add( 'User_Name='         + txtSistemaUsuario.Text    );
    frmPrincipal.ConexaoBD.Params.Add( 'Password='          + txtSistemaSenha.Text      );
    //frmPrincipal.ConexaoBD.Params.Add( 'BlobSize='          + '-1' );
    //frmPrincipal.ConexaoBD.Params.Add( 'ErrorResourceFile=' + '' );
    //frmPrincipal.ConexaoBD.Params.Add( 'LocaleCode='        + '0000' );
    frmPrincipal.ConexaoBD.GetDriverFunc := 'getSQLDriverMYSQL';
    //frmPrincipal.ConexaoBD.LibraryName   := 'dbxmys30.dll';
    frmPrincipal.ConexaoBD.LibraryName   := 'dbxmys.dll';
    frmPrincipal.ConexaoBD.VendorLib     := 'libmySQL.dll';

    // Ativa conex�o.
    frmPrincipal.ConexaoBD.Connected := False;
    frmPrincipal.ConexaoBD.Connected := True;

    // VERIFICA SE O USU�RIO TEM ACESSO AO BANCO.
    cdsLogin.Active := False;
    cdsLogin.CommandText := ' SELECT u.ID_Usuario, u.Login, u.Senha, u.Nome, u.ID_Setor, u.Ramal, VERSION() AS VersaoBDServer, USER() AS UsuarioBD FROM usuario u WHERE u.Login = ' + '''' + txtSistemaUsuario.Text + '''';
//    cdsLogin.Params.ParamByName('sLogin').Value := QuotedStr(txtSistemaUsuario.Text);
//    sqlLogin.ParamByName('sLogin').Value := '''' + txtSistemaUsuario.Text + '''';
    cdsLogin.Active := True;

    sSistemaUsuarioLogin      := UpperCase( cdsLogin.FieldByName('Login').AsString );
    sSistemaUsuarioNome       := cdsLogin.FieldByName('Nome').AsString;
    sSistemaUsuarioSenha      := cdsLogin.FieldByName('Senha').AsString;
    iSistemaUsuarioMatric     := cdsLogin.FieldByName('ID_Usuario').AsInteger;

    sSistemaBD_IP_ou_HostName := txtSistemaBDHost.Text;
    sSistemaBD_Esquema        := txtSistemaBDEsquema.Text;
    sSistemaBD_Usuario        := cdsLogin.FieldByName('UsuarioBD').AsString;
    sSistemaBD_Versao         := cdsLogin.FieldByName('VersaoBDServer').AsString;

   Except
   On E: Exception Do
     begin
       ShowMessage('Falha na conex�o com o banco de dados. Verifique as op��es de conex�o (Host, Login, Senha e Nome do BD)! Voc� tem somente mais ' + IntToStr( 3 - Self.iTentaAbrirForm ) + ' Tentativa(s)!' );
       Self.txtSistemaUsuario.SetFocus;
       Self.ModalResult := 3;
       Exit;
     end;
  end;
end;

procedure TfrmLogin.Frm(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLogin.btnOpcoesClick(Sender: TObject);
begin
  Self.ModalResult := 4;
  if iFlag = 0 then
  begin
    iFlag             := 1;
    Self.Height       := 258;
    btnOpcoes.Caption := 'Op��es >>>';
    pgcOpcoes.Visible := False;
  end
  else if iFlag = 1 then
  begin
    iFlag             := 0;
    Self.Height       := 441;
    btnOpcoes.Caption := '<<< Op��es';
    pgcOpcoes.Visible := True;
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);

begin
 // RECUPERA INFORMA��ES DO BANCO DE DADOS.
 sBancoDeDadosDriver := iniSistemaArquivoIni.ReadString('BD', 'DriverName', '');

 if sBancoDeDadosDriver = 'MSSQL' then
 begin
   cbxSistemaBDFabricante.ItemIndex := 0;
   sBancoDeDadosNome := 'MS SQL Server';
 end
 else if sBancoDeDadosDriver = 'MySQL' then
 begin
   cbxSistemaBDFabricante.ItemIndex := 1;
   sBancoDeDadosNome := 'MySQL';
 end
 else if sBancoDeDadosDriver = 'MySQL50' then
 begin
   cbxSistemaBDFabricante.ItemIndex := 2;
   sBancoDeDadosNome := 'MySQL';
 end
 else if sBancoDeDadosDriver = 'Oracle' then
 begin
   cbxSistemaBDFabricante.ItemIndex := 3;
   sBancoDeDadosNome := 'Oracle';
 end

 else if sBancoDeDadosDriver = 'MySQLD2007' then
 begin
   cbxSistemaBDFabricante.ItemIndex := 4;
   sBancoDeDadosNome := 'MySQL';
 end;



 txtSistemaBDHost.Text    := iniSistemaArquivoIni.ReadString('BD', 'Host'      ,  '');
 txtSistemaBDPorta.Text   := iniSistemaArquivoIni.ReadString('BD', 'Porta'      , '');
 txtSistemaBDEsquema.Text := iniSistemaArquivoIni.ReadString('BD', 'NomeBD'    ,  '');

 txtSistemaBDUsuario.Text := iniSistemaArquivoIniLocal.ReadString('BD', 'Login'     ,  '');
 txtSistemaBDSenha.Text   := DesCriptografa( iniSistemaArquivoIniLocal.ReadString('BD', 'Senha'     , '') );

 //txtSistemaUsuario.Text   := iniSistemaArquivoIniLocal.ReadString('BD', 'Login'     ,  '');
 //txtSistemaSenha.Text     := DesCriptografa( iniSistemaArquivoIniLocal.ReadString('BD', 'Senha'     , '') );
 txtSistemaUsuario.Text   := txtSistemaBDUsuario.Text;
 txtSistemaSenha.Text     := txtSistemaBDSenha.Text;

 ///////////////////////////////////////////////////////////////////////////////
 // RECUPERA INFORMA��ES DO SISTEMA.                                          //
 ///////////////////////////////////////////////////////////////////////////////
 txtArqConfigINI.Text  := iniSistemaArquivoIni.ReadString('SISTEMA', 'ArquivoINI', '');
 txtArqConfigRave.Text := iniSistemaArquivoIni.ReadString('SISTEMA', 'ArquivoRave', '');
 //                                                                           //
 iFlag                := 1;
 Self.Height          := 258;
 btnOpcoes.Caption    := 'Op��es >>>';
 pgcOpcoes.Visible    := False;
 pgcOpcoes.ActivePage := tshSistema;

 //
 ////sqlLogin.CommandText := sSQLUSUARIO;

{
 sqlLogin.CommandText := ' SELECT u.ID_Usuario, ' +
                         '        u.Login, ' +
                         '        u.Senha, ' +
                         '        u.Nome, ' +
                         '        u.ID_Setor, ' +
                         '        u.Ramal, ' +
                         '        VERSION() AS VersaoBDServer, ' +
                         '        USER() AS UsuarioBD ' +
                         ' FROM   usuario u WHERE u.Login = :sLogin';
}
end;

procedure TfrmLogin.btnGravarClick(Sender: TObject);
begin
 ///////////////////////////////////////////////////////////////////////////////
 // GRAVA INFORMA��ES DO BANCO DE DADOS.                                      //
 ///////////////////////////////////////////////////////////////////////////////
 iniSistemaArquivoIni.WriteString('BD', 'DriverName', cbxSistemaBDFabricante.Text );
 iniSistemaArquivoIni.WriteString('BD', 'Host',       txtSistemaBDHost.Text );
 iniSistemaArquivoIni.WriteString('BD', 'Porta',      txtSistemaBDPorta.Text );
 iniSistemaArquivoIni.WriteString('BD', 'NomeBD',     txtSistemaBDEsquema.Text );

 //iniSistemaArquivoIniLocal.WriteString('BD', 'Login', txtSistemaUsuario.Text );
 //iniSistemaArquivoIniLocal.WriteString('BD', 'Senha', Criptografa( txtSistemaSenha.Text ) );
 ////iniSistemaArquivoIniLocal.WriteString('BD', 'Login', txtSistemaBDUsuario.Text );
 ////iniSistemaArquivoIniLocal.WriteString('BD', 'Senha', Criptografa( txtSistemaBDSenha.Text ) );
 iniSistemaArquivoIniLocal.WriteString('BD', 'Login', txtSistemaBDUsuario.Text );
 iniSistemaArquivoIniLocal.WriteString('BD', 'Senha', Criptografa( txtSistemaBDSenha.Text ) );

 ///////////////////////////////////////////////////////////////////////////////
 // GRAVA INFORMA��ES DO SISTEMA.                                             //
 ///////////////////////////////////////////////////////////////////////////////
 iniSistemaArquivoIni.WriteString('SISTEMA', 'ArquivoINI',  txtArqConfigINI.Text );
 iniSistemaArquivoIni.WriteString('SISTEMA', 'ArquivoRave', txtArqConfigRave.Text );
end;

procedure TfrmLogin.btnArqIniClick(Sender: TObject);
begin
 OpenDialogINI.Execute;
 txtArqConfigINI.Text := OpenDialogINI.FileName;
end;

end.

