unit ufrmModeloRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmModeloMDIChild, DBCtrls, Buttons, StdCtrls, Mask, DB,
  DataSourceUrb, DBClient, ClientDataSetUrb, Provider, Grids, DBGrids,
  RpDefine, RpCon, RpConDS, ExtCtrls;

type
  TfrmModeloRelatorio = class(TfrmModeloMDIChild)
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    txtDataInicial: TMaskEdit;
    txtDataFinal: TMaskEdit;
    dspManifestos: TDataSetProvider;
    cdsManifestos: TClientDataSetUrb;
    dtsManifestos: TDataSourceUrb;
    rdtsManifestos_Antigo: TRvDataSetConnection;
    dspSituacaoOrigem: TDataSetProvider;
    cdsSituacaoOrigem: TClientDataSetUrb;
    dtsSituacaoOrigem: TDataSourceUrb;
    cdsSituacaoOrigemID_Situacao: TIntegerField;
    cdsSituacaoOrigemDescricao: TStringField;
    lblTituloRelat: TLabel;
    txtTituloRelat: TEdit;
    dspEmpresaGeradoraOrigem: TDataSetProvider;
    cdsEmpresaGeradoraOrigem: TClientDataSetUrb;
    dtsEmpresaGeradoraOrigem: TDataSourceUrb;
    cdsEmpresaGeradoraOrigemID_Fantasia: TIntegerField;
    cdsEmpresaGeradoraOrigemDescricao: TStringField;
    btnVisualizarImpressao: TBitBtn;
    gbxEmpresaGeradora: TGroupBox;
    btnGeradoraIncluir: TSpeedButton;
    btnGeradoraIncluirTodos: TSpeedButton;
    btnGeradoraExcluir: TSpeedButton;
    btnGeradoraExcluirTodos: TSpeedButton;
    gbxSituacaoManifesto: TGroupBox;
    lstEmpresaGeradoraOrigem: TDBLookupListBox;
    lstEmpresaGeradoraDestino: TDBLookupListBox;
    cdsEmpresaGeradoraDestino: TClientDataSetUrb;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dtsEmpresaGeradoraDestino: TDataSourceUrb;
    lstSituacaoOrigem: TDBLookupListBox;
    btnSituacaoIncluir: TSpeedButton;
    btnSituacaoIncluirTodos: TSpeedButton;
    btnSituacaoExcluir: TSpeedButton;
    btnSituacaoExcluirTodos: TSpeedButton;
    lstSituacaoDestino: TDBLookupListBox;
    gbxResiduo: TGroupBox;
    btnResiduoIncluir: TSpeedButton;
    btnResiduoIncluirTodos: TSpeedButton;
    btnResiduoExcluir: TSpeedButton;
    btnResiduoExcluirTodos: TSpeedButton;
    DBLookupListBox4: TDBLookupListBox;
    DBLookupListBox5: TDBLookupListBox;
    rdgTipoManifesto: TRadioGroup;
    dspResiduoOrigem: TDataSetProvider;
    cdsResiduoOrigem: TClientDataSetUrb;
    dtsResiduoOrigem: TDataSourceUrb;
    cdsResiduoOrigemID_Residuo: TIntegerField;
    cdsResiduoOrigemDescricao: TStringField;
    cdsSituacaoDestino: TClientDataSetUrb;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    dtsSituacaoDestino: TDataSourceUrb;
    cdsResiduoDestino: TClientDataSetUrb;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    dtsResiduoDestino: TDataSourceUrb;
    btnSalvarTitulo: TSpeedButton;
    gbxEmpresaReceptora: TGroupBox;
    btnReceptoraIncluir: TSpeedButton;
    btnReceptoraIncluirTodos: TSpeedButton;
    btnReceptoraExcluir: TSpeedButton;
    btnReceptoraExcluirTodos: TSpeedButton;
    lstEmpresaReceptoraDestino: TDBLookupListBox;
    lstEmpresaReceptoraOrigem: TDBLookupListBox;
    dspEmpresaReceptoraOrigem: TDataSetProvider;
    cdsEmpresaReceptoraOrigem: TClientDataSetUrb;
    dtsEmpresaReceptoraOrigem: TDataSourceUrb;
    dtsEmpresaReceptoraDestino: TDataSourceUrb;
    cdsEmpresaReceptoraDestino: TClientDataSetUrb;
    IntegerField5: TIntegerField;
    StringField5: TStringField;
    cdsEmpresaReceptoraOrigemID_Empresa: TIntegerField;
    cdsEmpresaReceptoraOrigemRazaoSocial: TStringField;
    cdsManifestosNomeFantasia: TStringField;
    cdsManifestosGerDtEntrega: TSQLTimeStampField;
    cdsManifestosRazaoSocialRecep: TStringField;
    cdsManifestosProcedencia: TStringField;
    cdsManifestosResiduo: TStringField;
    cdsManifestosGerID_Empresa: TIntegerField;
    cdsManifestosRazaoSocial: TStringField;
    cdsManifestosNumero: TStringField;
    cdsManifestosQuantidade: TFMTBCDField;
    cdsManifestosCDF: TStringField;
    cdsManifestosRecepID_Empresa: TIntegerField;
    cdsManifestosID_Residuo: TIntegerField;
    cdsManifestosValorMercado: TFloatField;
    cdsManifestosValorReceber: TFloatField;
    cdsManifestosID_Situacao: TIntegerField;
    cdsManifestosSituacao: TStringField;
    cdsManifestosID_Fantasia: TIntegerField;
    cdsManifestosEndereco: TStringField;
    cdsManifestosMunicipio: TStringField;
    cdsManifestosUF: TStringField;
    cdsManifestosResponsavel: TStringField;
    cdsManifestosID_Procedencia: TIntegerField;
    cdsManifestosObs: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVisualizarImpressaoClick(Sender: TObject);
    procedure btnGeradoraIncluirClick(Sender: TObject);
    procedure btnGeradoraIncluirTodosClick(Sender: TObject);
    procedure btnGeradoraExcluirClick(Sender: TObject);
    procedure btnGeradoraExcluirTodosClick(Sender: TObject);
    procedure btnSituacaoIncluirClick(Sender: TObject);
    procedure btnSituacaoIncluirTodosClick(Sender: TObject);
    procedure btnSituacaoExcluirTodosClick(Sender: TObject);
    procedure btnSituacaoExcluirClick(Sender: TObject);
    procedure btnResiduoIncluirClick(Sender: TObject);
    procedure btnResiduoExcluirTodosClick(Sender: TObject);
    procedure btnResiduoIncluirTodosClick(Sender: TObject);
    procedure btnResiduoExcluirClick(Sender: TObject);
    procedure btnReceptoraIncluirClick(Sender: TObject);
    procedure btnReceptoraIncluirTodosClick(Sender: TObject);
    procedure btnReceptoraExcluirClick(Sender: TObject);
    procedure btnReceptoraExcluirTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
//    function GetFirstSelection(List: TCustomListBox): Integer;
    function GetFirstSelection(List: TClientDataSetUrb): Integer;
    procedure SetButtonsEmpresaGeradora;
    procedure SetButtonsSituacao;
    procedure SetButtonsResiduo;
    procedure SetButtonsEmpresaReceptora;
  end;

var
  frmModeloRelatorio: TfrmModeloRelatorio;

implementation

uses ufrmPrincipal;

{$R *.dfm}

procedure TfrmModeloRelatorio.FormCreate(Sender: TObject);
begin
  inherited;

  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  //  FORMATA, INICIALIZA E CONFIGURA OS COMPONENTES DE DATA.                 //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  txtDataInicial.Text := '01/01' + Copy(DateToStr(Date),6,5);
  txtDataFinal.Text   := DateToStr(Date);
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  //  FORMATA, INICIALIZA E CONFIGURA OS COMPONENTES DA EMPRESA GERADORA.     //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  frmPrincipal.sqlDataSet.CommandText := 'SELECT f.ID_Fantasia, f.Descricao FROM fantasia f order by 2';
  cdsEmpresaGeradoraOrigem.Active := True;
  cdsEmpresaGeradoraDestino.CreateDataSet;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  //  FORMATA, INICIALIZA E CONFIGURA OS COMPONENTES DA EMPRESA RECEPTORA.    //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  frmPrincipal.sqlDataSet.CommandText := 'SELECT e.ID_Empresa, e.RazaoSocial FROM empresa e order by 2';
  cdsEmpresaReceptoraOrigem.Active := True;
  cdsEmpresaReceptoraDestino.CreateDataSet;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  //  FORMATA, INICIALIZA E CONFIGURA OS COMPONENTES DA SITUA��O DO MANIFESTO.//
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  frmPrincipal.sqlDataSet.CommandText := 'SELECT s.ID_Situacao, s.Descricao FROM situacao s  WHERE ( s.ID_Situacao > 1 ) order by 2';
  cdsSituacaoOrigem.Active  := True;
  cdsSituacaoDestino.CreateDataSet;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  //  FORMATA, INICIALIZA E CONFIGURA OS COMPONENTES DO RES�DUO DO MANIFESTO. //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  frmPrincipal.sqlDataSet.CommandText := 'SELECT r.ID_Residuo, r.Descricao FROM residuo r ORDER BY r.Descricao';
  cdsResiduoOrigem.Active := True;
  cdsResiduoDestino.CreateDataSet;
end;


procedure TfrmModeloRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsEmpresaGeradoraOrigem.Active := False;
  cdsEmpresaGeradoraDestino.Free;

  cdsEmpresaReceptoraOrigem.Active := False;
  cdsEmpresaReceptoraDestino.Free;

  cdsSituacaoOrigem.Active        := False;
  cdsSituacaoDestino.Free;

  cdsResiduoOrigem.Active         := False;
  cdsResiduoDestino.Free;
end;

procedure TfrmModeloRelatorio.btnVisualizarImpressaoClick(
  Sender: TObject);
var
 sReceptor:         string;
 sGerID_Empresa:    string;
 sDtInicial:        string;
 sDtFinal:          string;
 sTituloPeriodo:    string;
 sTituloPrincipal:  string;
 sTipoManifesto:    string;
 sEmpresaGeradora:  string;
 sEmpresaReceptora: string;
 sSituacao:         string;
 sResiduo:          string;
begin
  inherited;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // CRITICA OS VALORES DIGITADOS PELO USU�RIO.                               //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  if cdsEmpresaGeradoraDestino.RecordCount = 0 then
   begin
    ShowMessage('Voc� deve selecionar ao menos uma "Empresa Geradora".');
    Exit;
   end;

  if cdsEmpresaReceptoraDestino.RecordCount = 0 then
   begin
    ShowMessage('Voc� deve selecionar ao menos uma "Empresa Receptora".');
    Exit;
   end;

  if cdsSituacaoDestino.RecordCount = 0 then
   begin
    ShowMessage('Voc� deve selecionar ao menos uma "Situa��o do Manifesto".');
    Exit;
   end;

  if cdsResiduoDestino.RecordCount = 0 then
   begin
    ShowMessage('Voc� deve selecionar ao menos um "Res�duo".');
    Exit;
   end;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // ATRIBUI��O DE VARI�VEIS.                                                 //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////

  // verificar como vai ficar o sReceptor
  //sReceptor         := cdsNomeFantasiaID_Empresa.AsString;
  sGerID_Empresa    := cdsEmpresaGeradoraOrigemID_Fantasia .AsString;
  sTipoManifesto    := '';
  sSituacao         := '';
  sEmpresaGeradora  := '';
  sEmpresaReceptora := '';
  sResiduo          := '';
  sDtInicial        := FormatDateTime('yyyymmdd', StrToDate(txtDataInicial.Text));
  sDtFinal          := FormatDateTime('yyyymmdd', StrToDate(txtDataFinal.Text));
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // VERIFICA SE OS MANIF. SELECIONADOS S�O "SEM CDF", "COM CDF" OU "AMBOS".  //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  if rdgTipoManifesto.ItemIndex = 0 then
   begin
     sTipoManifesto := '          ( m.CDF IS NULL or m.CDF = ''''            ) and ';
   end
  else if rdgTipoManifesto.ItemIndex = 1 then
   begin
     sTipoManifesto := '          ( m.CDF IS NOT NULL or m.CDF <> ''''            ) and ';
   end
  else if rdgTipoManifesto.ItemIndex = 2 then
   begin
     sTipoManifesto := ''
   end;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // VERIFICA/PROCESSA AS SITUA��ES SELECIONADAS.                             //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  cdsSituacaoDestino.First;
  while not cdsSituacaoDestino.Eof do
   begin
     sSituacao := sSituacao + cdsSituacaoDestino.FieldByName('ID_Situacao').AsString + ',';
     cdsSituacaoDestino.Next;
   end;
  sSituacao := Copy(sSituacao, 1, Length(sSituacao) -1);
  sSituacao := '( m.ID_Situacao IN (' + sSituacao + ') ) and' ;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // VERIFICA/PROCESSA AS EMPRESAS GERADORAS SELECIONADAS.                    //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  cdsEmpresaGeradoraDestino.First;
  while not cdsEmpresaGeradoraDestino.Eof do
   begin
     sEmpresaGeradora := sEmpresaGeradora + cdsEmpresaGeradoraDestino.FieldByName('ID_Fantasia').AsString + ',';
     cdsEmpresaGeradoraDestino.Next;
   end;
  sEmpresaGeradora := Copy(sEmpresaGeradora, 1, Length(sEmpresaGeradora) -1);
  sEmpresaGeradora := '( e.ID_Fantasia IN (' + sEmpresaGeradora + ') ) and' ;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // VERIFICA/PROCESSA AS EMPRESAS RECEPTORAS SELECIONADAS.                   //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  cdsEmpresaReceptoraDestino.First;
  while not cdsEmpresaReceptoraDestino.Eof do
   begin
     sEmpresaReceptora := sEmpresaReceptora + cdsEmpresaReceptoraDestino.FieldByName('ID_Empresa').AsString + ',';
     cdsEmpresaReceptoraDestino.Next;
   end;
  sEmpresaReceptora := Copy(sEmpresaReceptora, 1, Length(sEmpresaReceptora) -1);
  sEmpresaReceptora := '( m.RecepID_Empresa IN (' + sEmpresaReceptora + ') ) and' ;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // VERIFICA/PROCESSA OS RES�DUOS SELECIONADAS.                              //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  cdsResiduoDestino.First;
  while not cdsResiduoDestino.Eof do
   begin
     sResiduo := sResiduo + cdsResiduoDestino.FieldByName('ID_Residuo').AsString + ',';
     cdsResiduoDestino.Next;
   end;
  sResiduo := Copy(sResiduo, 1, Length(sResiduo) -1);
  sResiduo := '( m.ID_Residuo IN (' + sResiduo + ') ) and' ;
  //////////////////////////////////////////////////////////////////////////////
  //                                                                          //
  // MONTA A INSTRU��O SQL.                                                   //
  //                                                                          //
  //////////////////////////////////////////////////////////////////////////////
  frmPrincipal.sqlDataSet.CommandText := ' SELECT '                                                  +
                                          '          m.GerDtEntrega, '                                +
                                          '          m.GerID_Empresa, '                               +
                                          '          e.RazaoSocial, '                                 +
                                          '          m.Numero, '                                      +
                                          '          m.Quantidade, '                                  +
                                          '          m.CDF, '                                         +
                                          '          m.RecepID_Empresa, '                             +
                                          '          m.ID_Residuo, '                                  +
                                          '          r.Descricao AS Residuo, '                        +
                                          '          r.ValorMercado, '                                +
//                                          '          m.Quantidade * r.ValorMercado AS ValorReceber, ' +
                                          '          (m.Quantidade * r.ValorMercado) * 1000 AS ValorReceber, ' +
                                          '          m.ID_Situacao, '                                 +
                                          '          s.Descricao AS Situacao, '                       +
                                          '          e.ID_Fantasia, '                                 +
                                          '          f.Descricao AS NomeFantasia, '                   +
                                          '          e.Endereco, '                                    +
                                          '          e.Municipio, '                                   +
                                          '          e.UF, '                                          +
                                          '          e.Responsavel '                                  +
                                          ' FROM '                                                    +
                                          '          manifesto m, '                                   +
                                          '          residuo r, '                                     +
                                          '          empresa e, '                                     +
                                          '          fantasia f, '                                    +
                                          '          situacao s '                                     +
                                          ' WHERE '                                                   +
                                          sTipoManifesto                                              +
                                          sSituacao                                                   +
                                          sEmpresaGeradora                                            +
                                          sEmpresaReceptora                                           +
                                          sResiduo                                                    +
                                          '          ( m.GerDtEntrega         >= ' + sDtInicial + ' ) and ' +
                                          '          ( m.GerDtEntrega         <= ' + sDtFinal   + ' ) and ' +
                                          '          ( m.ID_Residuo           = r.ID_Residuo  ) and ' +
                                          '          ( m.GerID_Empresa        = e.ID_Empresa  ) and ' +
                                          '          ( e.ID_Fantasia          = f.ID_Fantasia ) and ' +
                                          '          ( m.ID_Situacao          = s.ID_Situacao ) '     +
                                          ' ORDER BY 15, 1 ';

  cdsManifestos.Active := False;
  cdsManifestos.Active := True;

  sTituloPeriodo   := 'Per�odo de ' + txtDataInicial.Text + ' at� ' + txtDataFinal.Text;
  sTituloPrincipal := txtTituloRelat.Text;

  frmPrincipal.rvpGestao_Empresarial.SetParam('TituloListaCDFPendentes', 'Verificar' );
  frmPrincipal.rvpGestao_Empresarial.SetParam('TituloPeriodo', sTituloPeriodo );
  frmPrincipal.rvpGestao_Empresarial.SetParam('TituloPrincipal', sTituloPrincipal );



//  frmPrincipal.rvpFerpan.ExecuteReport('rptPagamentoSucata');
  frmPrincipal.rvpGestao_Empresarial.ExecuteReport('rptPagamentoReciclaveis');


end;

procedure TfrmModeloRelatorio.btnGeradoraIncluirClick(Sender: TObject);
var
  Index: Integer;
begin
  inherited;
//  Index := GetFirstSelection(SrcList);
//  MoveSelected(SrcList, DstList.Items);
//  SetItem(SrcList, Index);

  cdsEmpresaGeradoraDestino.Insert;
  cdsEmpresaGeradoraDestino.FieldByName('ID_Fantasia').AsInteger := cdsEmpresaGeradoraOrigemID_Fantasia.AsInteger;
  cdsEmpresaGeradoraDestino.FieldByName('Descricao').AsString  := cdsEmpresaGeradoraOrigemDescricao.AsString;
  cdsEmpresaGeradoraDestino.Post;

  cdsEmpresaGeradoraOrigem.Delete;

  SetButtonsEmpresaGeradora;
end;

procedure TfrmModeloRelatorio.btnGeradoraIncluirTodosClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
{
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I],
      SrcList.Items.Objects[I]);
  SrcList.Items.Clear;
  SetItem(SrcList, 0);
}


  cdsEmpresaGeradoraOrigem.First;
  while not cdsEmpresaGeradoraOrigem.Eof do
   begin
     cdsEmpresaGeradoraDestino.Insert;
     cdsEmpresaGeradoraDestino.FieldByName('ID_Fantasia').AsInteger := cdsEmpresaGeradoraOrigemID_Fantasia.AsInteger;
     cdsEmpresaGeradoraDestino.FieldByName('Descricao').AsString  := cdsEmpresaGeradoraOrigemDescricao.AsString;
     cdsEmpresaGeradoraDestino.Post;

     cdsEmpresaGeradoraOrigem.Delete;
   end;

  SetButtonsEmpresaGeradora;
end;

procedure TfrmModeloRelatorio.btnGeradoraExcluirClick(Sender: TObject);
var
  Index: Integer;
begin
  inherited;
{
  Index := GetFirstSelection(DstList);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
}

  cdsEmpresaGeradoraOrigem.Insert;
  cdsEmpresaGeradoraOrigem.FieldByName('ID_Fantasia').AsInteger := cdsEmpresaGeradoraDestino.FieldByName('ID_Fantasia').AsInteger;
  cdsEmpresaGeradoraOrigem.FieldByName('Descricao').AsString    := cdsEmpresaGeradoraDestino.FieldByName('Descricao').AsString;
  cdsEmpresaGeradoraOrigem.Post;

  cdsEmpresaGeradoraDestino.Delete;

  SetButtonsEmpresaGeradora;
end;

procedure TfrmModeloRelatorio.btnGeradoraExcluirTodosClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
{
  for I := 0 to DstList.Items.Count - 1 do
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  DstList.Items.Clear;
  SetItem(DstList, 0);
}

  cdsEmpresaGeradoraDestino.First;
  while not cdsEmpresaGeradoraDestino.Eof do
   begin
     cdsEmpresaGeradoraOrigem.Insert;
     cdsEmpresaGeradoraOrigem.FieldByName('ID_Fantasia').AsInteger := cdsEmpresaGeradoraDestino.FieldByName('ID_Fantasia').AsInteger;
     cdsEmpresaGeradoraOrigem.FieldByName('Descricao').AsString    := cdsEmpresaGeradoraDestino.FieldByName('Descricao').AsString;
     cdsEmpresaGeradoraOrigem.Post;

     cdsEmpresaGeradoraDestino.Delete;
   end;

  SetButtonsEmpresaGeradora;

end;

procedure TfrmModeloRelatorio.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtonsEmpresaGeradora;
end;

procedure TfrmModeloRelatorio.MoveSelected(List: TCustomListBox; Items: TStrings);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TfrmModeloRelatorio.SetButtonsEmpresaGeradora;
var
  OrigemVazio:  Boolean;
  DestinoVazio: Boolean;
begin
  OrigemVazio  := cdsEmpresaGeradoraOrigem.RecordCount  = 0;
  DestinoVazio := cdsEmpresaGeradoraDestino.RecordCount = 0;

  btnGeradoraIncluir.Enabled      := not OrigemVazio;
  btnGeradoraIncluirTodos.Enabled := not OrigemVazio;
  btnGeradoraExcluir.Enabled      := not DestinoVazio;
  btnGeradoraExcluirTodos.Enabled := not DestinoVazio;
end;

procedure TfrmModeloRelatorio.SetButtonsSituacao;
var
  OrigemVazio:  Boolean;
  DestinoVazio: Boolean;
begin
  OrigemVazio  := cdsSituacaoOrigem.RecordCount  = 0;
  DestinoVazio := cdsSituacaoDestino.RecordCount = 0;

  btnSituacaoIncluir.Enabled      := not OrigemVazio;
  btnSituacaoIncluirTodos.Enabled := not OrigemVazio;
  btnSituacaoExcluir.Enabled      := not DestinoVazio;
  btnSituacaoExcluirTodos.Enabled := not DestinoVazio;
end;

procedure TfrmModeloRelatorio.SetButtonsResiduo;
var
  OrigemVazio:  Boolean;
  DestinoVazio: Boolean;
begin
  OrigemVazio  := cdsResiduoOrigem.RecordCount  = 0;
  DestinoVazio := cdsResiduoDestino.RecordCount = 0;

  btnResiduoIncluir.Enabled      := not OrigemVazio;
  btnResiduoIncluirTodos.Enabled := not OrigemVazio;
  btnResiduoExcluir.Enabled      := not DestinoVazio;
  btnResiduoExcluirTodos.Enabled := not DestinoVazio;
end;


procedure TfrmModeloRelatorio.SetButtonsEmpresaReceptora;
var
  OrigemVazio:  Boolean;
  DestinoVazio: Boolean;
begin
  OrigemVazio  := cdsEmpresaReceptoraOrigem.RecordCount  = 0;
  DestinoVazio := cdsEmpresaReceptoraDestino.RecordCount = 0;

  btnReceptoraIncluir.Enabled      := not OrigemVazio;
  btnReceptoraIncluirTodos.Enabled := not OrigemVazio;
  btnReceptoraExcluir.Enabled      := not DestinoVazio;
  btnReceptoraExcluirTodos.Enabled := not DestinoVazio;
end;


{
function TfrmRelatListaCDFPendentes.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;
}

function TfrmModeloRelatorio.GetFirstSelection(List: TClientDataSetUrb): Integer;
begin
//  for Result := 0 to List.RecordCount - 1 do
//    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;





procedure TfrmModeloRelatorio.btnSituacaoIncluirClick(
  Sender: TObject);
begin
  inherited;
  cdsSituacaoDestino.Insert;
  cdsSituacaoDestino.FieldByName('ID_Situacao').AsInteger := cdsSituacaoOrigemID_Situacao.AsInteger;
  cdsSituacaoDestino.FieldByName('Descricao').AsString    := cdsSituacaoOrigemDescricao.AsString;
  cdsSituacaoDestino.Post;

  cdsSituacaoOrigem.Delete;

  SetButtonsSituacao;

end;

procedure TfrmModeloRelatorio.btnSituacaoIncluirTodosClick(
  Sender: TObject);
begin
  inherited;

  cdsSituacaoOrigem.First;
  while not cdsSituacaoOrigem.Eof do
   begin
     cdsSituacaoDestino.Insert;
     cdsSituacaoDestino.FieldByName('ID_Situacao').AsInteger := cdsSituacaoOrigemID_Situacao.AsInteger;
     cdsSituacaoDestino.FieldByName('Descricao').AsString  := cdsSituacaoOrigemDescricao.AsString;
     cdsSituacaoDestino.Post;

     cdsSituacaoOrigem.Delete;
   end;

  SetButtonsSituacao;

end;

procedure TfrmModeloRelatorio.btnSituacaoExcluirTodosClick(
  Sender: TObject);
begin
  inherited;

  cdsSituacaoDestino.First;
  while not cdsSituacaoDestino.Eof do
   begin
     cdsSituacaoOrigem.Insert;
     cdsSituacaoOrigem.FieldByName('ID_Situacao').AsInteger := cdsSituacaoDestino.FieldByName('ID_Situacao').AsInteger;
     cdsSituacaoOrigem.FieldByName('Descricao').AsString    := cdsSituacaoDestino.FieldByName('Descricao').AsString;
     cdsSituacaoOrigem.Post;

     cdsSituacaoDestino.Delete;
   end;

  SetButtonsSituacao;

end;

procedure TfrmModeloRelatorio.btnSituacaoExcluirClick(
  Sender: TObject);
begin
  inherited;
  cdsSituacaoOrigem.Insert;
  cdsSituacaoOrigem.FieldByName('ID_Situacao').AsInteger := cdsSituacaoDestino.FieldByName('ID_Situacao').AsInteger;
  cdsSituacaoOrigem.FieldByName('Descricao').AsString    := cdsSituacaoDestino.FieldByName('Descricao').AsString;
  cdsSituacaoOrigem.Post;

  cdsSituacaoDestino.Delete;

  SetButtonsSituacao;

end;

procedure TfrmModeloRelatorio.btnResiduoIncluirClick(
  Sender: TObject);
begin
  inherited;
  cdsResiduoDestino.Insert;
  cdsResiduoDestino.FieldByName('ID_Residuo').AsInteger := cdsResiduoOrigemID_Residuo.AsInteger;
  cdsResiduoDestino.FieldByName('Descricao').AsString    := cdsResiduoOrigemDescricao.AsString;
  cdsResiduoDestino.Post;

  cdsResiduoOrigem.Delete;

  SetButtonsResiduo;
end;

procedure TfrmModeloRelatorio.btnResiduoExcluirTodosClick(
  Sender: TObject);
begin
  inherited;
  cdsResiduoDestino.First;
  while not cdsResiduoDestino.Eof do
   begin
     cdsResiduoOrigem.Insert;
     cdsResiduoOrigem.FieldByName('ID_Residuo').AsInteger := cdsResiduoDestino.FieldByName('ID_Residuo').AsInteger;
     cdsResiduoOrigem.FieldByName('Descricao').AsString    := cdsResiduoDestino.FieldByName('Descricao').AsString;
     cdsResiduoOrigem.Post;

     cdsResiduoDestino.Delete;
   end;

  SetButtonsResiduo;

end;

procedure TfrmModeloRelatorio.btnResiduoIncluirTodosClick(
  Sender: TObject);
begin
  inherited;
  cdsResiduoOrigem.First;
  while not cdsResiduoOrigem.Eof do
   begin
     cdsResiduoDestino.Insert;
     cdsResiduoDestino.FieldByName('ID_Residuo').AsInteger := cdsResiduoOrigemID_Residuo.AsInteger;
     cdsResiduoDestino.FieldByName('Descricao').AsString  := cdsResiduoOrigemDescricao.AsString;
     cdsResiduoDestino.Post;

     cdsResiduoOrigem.Delete;
   end;

  SetButtonsResiduo;

end;

procedure TfrmModeloRelatorio.btnResiduoExcluirClick(
  Sender: TObject);
begin
  inherited;
  cdsResiduoOrigem.Insert;
  cdsResiduoOrigem.FieldByName('ID_Residuo').AsInteger := cdsResiduoDestino.FieldByName('ID_Residuo').AsInteger;
  cdsResiduoOrigem.FieldByName('Descricao').AsString   := cdsResiduoDestino.FieldByName('Descricao').AsString;
  cdsResiduoOrigem.Post;

  cdsResiduoDestino.Delete;

  SetButtonsResiduo;
end;

procedure TfrmModeloRelatorio.btnReceptoraIncluirClick(Sender: TObject);
begin
  inherited;
  cdsEmpresaReceptoraDestino.Insert;
  cdsEmpresaReceptoraDestino.FieldByName('ID_Empresa').AsInteger := cdsEmpresaReceptoraOrigemID_Empresa.AsInteger;
  cdsEmpresaReceptoraDestino.FieldByName('RazaoSocial').AsString  := cdsEmpresaReceptoraOrigemRazaoSocial.AsString;
  cdsEmpresaReceptoraDestino.Post;

  cdsEmpresaReceptoraOrigem.Delete;

  SetButtonsEmpresaReceptora;
end;

procedure TfrmModeloRelatorio.btnReceptoraIncluirTodosClick(
  Sender: TObject);
begin
  inherited;
  cdsEmpresaReceptoraOrigem.First;
  while not cdsEmpresaReceptoraOrigem.Eof do
   begin
     cdsEmpresaReceptoraDestino.Insert;
     cdsEmpresaReceptoraDestino.FieldByName('ID_Empresa').AsInteger := cdsEmpresaReceptoraOrigemID_Empresa.AsInteger;
     cdsEmpresaReceptoraDestino.FieldByName('RazaoSocial').AsString  := cdsEmpresaReceptoraOrigemRazaoSocial.AsString;
     cdsEmpresaReceptoraDestino.Post;

     cdsEmpresaReceptoraOrigem.Delete;
   end;

  SetButtonsEmpresaReceptora;

end;

procedure TfrmModeloRelatorio.btnReceptoraExcluirClick(Sender: TObject);
begin
  inherited;
  cdsEmpresaReceptoraOrigem.Insert;
  cdsEmpresaReceptoraOrigem.FieldByName('ID_Empresa').AsInteger := cdsEmpresaReceptoraDestino.FieldByName('ID_Empresa').AsInteger;
  cdsEmpresaReceptoraOrigem.FieldByName('RazaoSocial').AsString := cdsEmpresaReceptoraDestino.FieldByName('RazaoSocial').AsString;
  cdsEmpresaReceptoraOrigem.Post;

  cdsEmpresaReceptoraDestino.Delete;

  SetButtonsEmpresaReceptora;

end;

procedure TfrmModeloRelatorio.btnReceptoraExcluirTodosClick(
  Sender: TObject);
begin
  inherited;
  cdsEmpresaReceptoraDestino.First;
  while not cdsEmpresaReceptoraDestino.Eof do
   begin
     cdsEmpresaReceptoraOrigem.Insert;
     cdsEmpresaReceptoraOrigem.FieldByName('ID_Empresa').AsInteger := cdsEmpresaReceptoraDestino.FieldByName('ID_Empresa').AsInteger;
     cdsEmpresaReceptoraOrigem.FieldByName('RazaoSocial').AsString := cdsEmpresaReceptoraDestino.FieldByName('RazaoSocial').AsString;
     cdsEmpresaReceptoraOrigem.Post;

     cdsEmpresaReceptoraDestino.Delete;
   end;

  SetButtonsEmpresaReceptora;

end;

end.
