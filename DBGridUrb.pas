{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit DBGridUrb;

interface

{$R *.RES}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBClient, Menus, DB, ImgList, ufrmLocalizar, ufrmFiltrar,
  RpDefine, RpBase, RpSystem, StdConvs, uVariaveisGlobais;

////////////////////////////////////////////////////////////////////////////////
//  Descri��o     : Classe TDBGridUrb - Esta classe � um DBGrid c/ v�rias fun��es
//                  interesantes: Ordena automaticamente ao clicar em uma coluna,
//                  clicando com o bot�o direito do mouse vc tem v�rias op��es de
//                  filtros.
//  Sintaxe       :
//  Exemplo       :
//  Atualizado em : 20/08/2004
//  Autor         : andreurbano@ig.com.br
//
////////////////////////////////////////////////////////////////////////////////
type
 TDBGridUrb = class(TDBGrid)
  private
   { Private declarations }
   FMenu: TPopupMenu;
   FFilter: TFiltrarDialog;
   FFind: TfrmLocalizar;
   FClientDataSet: TClientDataSet;
   FMensagemOrdem: string;
   FTituloListagem: string;
   rvsListagem:  TRvSystem;
   function GetMensagemOrdem : string;
   procedure SetMensagemOrdem(sMensagem: string);
   function GetClientDataSet : TClientDataSet;
   procedure SetClientDataSet(CliDataSet: TClientDataSet);
   procedure OnFindClick(Sender: TObject);
   procedure OnIncludeClick(Sender: TObject);
   procedure Imprimir(Sender: TObject);
   procedure OnExcludeClick(Sender: TObject);
   procedure OnSetFilterClick(Sender: TObject);
   procedure OnClearFilterClick(Sender: TObject);
   procedure OnSortAscClick(Sender: TObject);
   procedure OnSortDescClick(Sender: TObject);
   procedure OnOrdenar(Sender: TColumn);
   procedure OnImprimir(Sender: TObject);
   procedure OnAntesDeImprimir(Sender: TObject);
   procedure OnImprimirHeader(Sender: TObject);
   procedure OnImprimirFooter(Sender: TObject);
   function GetTituloListagem : String;
   procedure SetTituloListagem(sTituloListagem: String);

  protected
   { Protected declarations }
  public
   { Public declarations }
   sTituloRelat: string;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   procedure OrdenarAsc(Sender: TObject);
   procedure OrdenarDesc(Sender: TObject);
   procedure OnZebrarGrid(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
   property MensagemOrdem: string  read GetMensagemOrdem write SetMensagemOrdem;
  published
  { Published declarations }
   property ClientDataSet:  TClientDataSet read GetClientDataSet write SetClientDataSet;
   property TituloListagem: String         read GetTituloListagem write SetTituloListagem;

  end;

procedure Register;

implementation

uses ConvUtils, MaskUtils;

var
  AImageList:       TImageList;
  //////////////////////////////////////////////////////////////////////////////
  // Vari�veis do relat�rio de listagem do grid.                              //
  //////////////////////////////////////////////////////////////////////////////
  iLinhasPorPagina: integer;
  sRelatFooterLinha1:   string;
  sRelatFooterLinha2:   string;
  sRelatFooterLinha3:   string;

{ Initiate local imageList }
procedure InitiateImages; forward;

{ Class constructor }
constructor TDBGridUrb.Create(AOwner: TComponent);
var
  MenuItem: TMenuItem;
begin
  inherited Create(AOwner);

 FClientDataSet := TClientDataSet.Create(Parent);
 FFilter        := TFiltrarDialog.Create(Parent);
 FFind          := TfrmLocalizar.Create(Parent);
 FMenu          := TPopupMenu.Create(Parent);
 rvsListagem    := TRvSystem.Create(Parent);

 Self.rvsListagem.OnPrint       := OnImprimir;
 Self.rvsListagem.OnBeforePrint := OnAntesDeImprimir;
 Self.rvsListagem.OnPrintHeader := OnImprimirHeader;
 Self.rvsListagem.OnPrintFooter := OnImprimirFooter;


 Self.OnTitleClick     := OnOrdenar;
 Self.OnDrawColumnCell := OnZebrarGrid;

 if not Assigned(AImageList) then  InitiateImages;

 FMenu.Images     := AImageList;

 MenuItem         := TMenuItem.Create(FMenu);
 MenuItem.Caption := '&Localizar Campo...';
 MenuItem.OnClick := OnFindClick;
 MenuItem.ImageIndex := 0;
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := '-';
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := '&Filtrar pelo Valor Selecionado';
 MenuItem.OnClick := OnIncludeClick;
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := '&Eliminar Valor Selecionado';
 MenuItem.OnClick := OnExcludeClick;
 FMenu.Items.Add(MenuItem);

 ////////////////////////////////////////////
 // ************************************** //
 // * N�O ESQUERCER DE TERMINAR O FILTRO * //
 // ************************************** //
 ////////////////////////////////////////////
// MenuItem := TMenuItem.Create(FMenu);
// MenuItem.Caption := '&Criar Filtro...';
// MenuItem.OnClick := OnSetFilterClick;
// MenuItem.ImageIndex := 1;
// FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := 'Desfaze&r Filtro';
 MenuItem.OnClick := OnClearFilterClick;
 MenuItem.ImageIndex := 2;
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := '-';
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := 'Ordem &Ascendente';
 MenuItem.OnClick := OnSortAscClick;
 MenuItem.ImageIndex := 3;
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := 'Ordem &Descendente';
 MenuItem.OnClick := OnSortDescClick;
 MenuItem.ImageIndex := 4;
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := '-';
 FMenu.Items.Add(MenuItem);

 MenuItem := TMenuItem.Create(FMenu);
 MenuItem.Caption := '&Imprimir...';
 MenuItem.OnClick := Imprimir;
 MenuItem.ImageIndex := 5;
 FMenu.Items.Add(MenuItem);

 Self.PopupMenu := FMenu;
end;

{ Class destructor }
destructor TDBGridUrb.Destroy;
begin
  FMenu.Free;
  FFilter.Free;
  FFind.Free;
  inherited Destroy;
end;

procedure TDBGridUrb.OrdenarAsc(Sender: TObject);
const
 msgCriacao :array[0..1] of string = (' (Ascendente)', ' (Descendente)');
 idxDefault = 'DEFAULT_ORDER';
var
 strColumn: String;
 intX: Integer;
 bolUsed: Boolean;
 idOptions: TIndexOptions;
 xField: TField;
 cdsDados: TClientDataSet;
begin
 cdsDados := Self.ClientDataSet;
 xField := cdsDados.FieldByName(SelectedField.FieldName);

 strColumn := idxDefault;
 idOptions := [];

 // SE FOR UM CAMPO CALCULADO N�O DEVE FAZER NADA.
 if (xField.FieldKind = fkCalculated) then
  begin
   Exit;
  end;

 // O �NDICE J� EST� EM USO.
 bolUsed := (xField.FieldName = cdsDados.IndexName);

 // VERIFICA A EXIST�NCIA DO �NDICE E PROPRIEDADES
 cdsDados.IndexDefs.Update;
 for intX := 0 to cdsDados.IndexDefs.Count -1 do
  begin
   if (cdsDados.IndexDefs.Items[intX].Name = xField.FieldName) then
    begin
     strColumn := xField.FieldName;
     idOptions := [];

     // DETERMINA COMO DEVE SER CRIADO O �NDICE, INVERTE A CONDI��O ixDecending
//     case (ixDescending in cdsDados.IndexDefs.Items[intX].Options) of
//       True:  idOptions := [];
//       False: idOptions := [ixDescending];
    end;


  end;

 // SE N�O ENCONTROU O �NDICE, OU O �NDICE J� EST� EM USO...
 if (strColumn = idxDefault) or bolUsed then
  begin
   // O NOME DO �NDICE TEM QUE SER �NICO, PODERIA AT� CRIAR COM NOMES DIFERENTES
   // PARA FICAR MAIS CONFI�VEL, FICA COMO LI��O DE CASA ...:))

   if bolUsed then
    begin
     cdsDados.DeleteIndex(xField.FieldName);
    end;
  end;

 try
  cdsDados.AddIndex(xField.FieldName, xField.FieldName,idOptions,'','',0);
  strColumn := xField.FieldName;
  Self.SetMensagemOrdem('Ordem: ' + strColumn + msgCriacao[Integer(ixDescending in idOptions)]);
 except
  // O �NDICE EST� INDETERMINADO, PASSO PARA O PADR�O.
  if bolUsed then
   begin
    strColumn := idxDefault;
   end;
 end;

 try
  cdsDados.IndexName := strColumn;
 except
  cdsDados.IndexName := idxDefault;
 end;

end;

procedure TDBGridUrb.OrdenarDesc(Sender: TObject);
const
 msgCriacao :array[0..1] of string = (' (Ascendente)', ' (Descendente)');
 idxDefault = 'DEFAULT_ORDER';
var
 strColumn: String;
 intX: Integer;
 bolUsed: Boolean;
 idOptions: TIndexOptions;
 xField: TField;
 cdsDados: TClientDataSet;
begin
 cdsDados := Self.ClientDataSet;
 xField := cdsDados.FieldByName(SelectedField.FieldName);

 strColumn := idxDefault;
 idOptions := [];

 // SE FOR UM CAMPO CALCULADO N�O DEVE FAZER NADA.
 if (xField.FieldKind = fkCalculated) then
  begin
   Exit;
  end;

 // O �NDICE J� EST� EM USO.
 bolUsed := (xField.FieldName = cdsDados.IndexName);

 // VERIFICA A EXIST�NCIA DO �NDICE E PROPRIEDADES
 cdsDados.IndexDefs.Update;
 for intX := 0 to cdsDados.IndexDefs.Count -1 do
  begin
   if (cdsDados.IndexDefs.Items[intX].Name = xField.FieldName) then
    begin
     strColumn := xField.FieldName;
     idOptions := [];
     idOptions := [ixDescending];
     // DETERMINA COMO DEVE SER CRIADO O �NDICE, INVERTE A CONDI��O ixDecending
//     case (ixDescending in cdsDados.IndexDefs.Items[intX].Options) of
//       True:  idOptions := [];
//       False: idOptions := [ixDescending];
    end;


  end;

 // SE N�O ENCONTROU O �NDICE, OU O �NDICE J� EST� EM USO...
 if (strColumn = idxDefault) or bolUsed then
  begin
   // O NOME DO �NDICE TEM QUE SER �NICO, PODERIA AT� CRIAR COM NOMES DIFERENTES
   // PARA FICAR MAIS CONFI�VEL, FICA COMO LI��O DE CASA ...:))

   if bolUsed then
    begin
     cdsDados.DeleteIndex(xField.FieldName);
    end;
  end;

 try
  cdsDados.AddIndex(xField.FieldName, xField.FieldName,idOptions,'','',0);
  strColumn := xField.FieldName;
  Self.SetMensagemOrdem('Ordem: ' + strColumn + msgCriacao[Integer(ixDescending in idOptions)]);
 except
  // O �NDICE EST� INDETERMINADO, PASSO PARA O PADR�O.
  if bolUsed then
   begin
    strColumn := idxDefault;
   end;
 end;

 try
  cdsDados.IndexName := strColumn;
 except
  cdsDados.IndexName := idxDefault;
 end;

end;

function TDBGridUrb.GetClientDataSet : TClientDataSet;
begin
 Result:= Self.FClientDataSet;
end;

procedure TDBGridUrb.SetClientDataSet(CliDataSet: TClientDataSet);
begin
 Self.FClientDataSet := CliDataSet;
end;

function TDBGridUrb.GetTituloListagem : String;
begin
 Result:= Self.FTituloListagem;
end;

procedure TDBGridUrb.SetTituloListagem(sTituloListagem: String);
begin
 Self.FTituloListagem := sTituloListagem;
end;

function TDBGridUrb.GetMensagemOrdem : string;
begin
 Result:= Self.FMensagemOrdem;
end;

procedure TDBGridUrb.SetMensagemOrdem(sMensagem: string);
begin
 Self.FMensagemOrdem := sMensagem;
end;


procedure Register;
begin
  RegisterComponents('AU - Data Controls', [TDBGridUrb]);
end;

{ Initiate local imageList }
procedure InitiateImages;
var
  Bitmap: TBitmap;
begin
  AImageList := TImageList.Create(NIL);
  Bitmap := TBitmap.Create;

  Bitmap.LoadFromResourceName(HInstance,'IDB_LOCALIZAR');
  AImageList.ResourceLoad(rtBitmap,'IDB_LOCALIZAR',Bitmap.Canvas.Pixels[15,15]);

  Bitmap.LoadFromResourceName(HInstance,'IDB_CRIARFILTRO');
  AImageList.ResourceLoad(rtBitmap,'IDB_CRIARFILTRO',Bitmap.Canvas.Pixels[15,15]);

  Bitmap.LoadFromResourceName(HInstance,'IDB_DESFAZERFILTRO');
  AImageList.ResourceLoad(rtBitmap,'IDB_DESFAZERFILTRO',Bitmap.Canvas.Pixels[15,15]);

  Bitmap.LoadFromResourceName(HInstance,'IDB_ORDEMASC');
  AImageList.ResourceLoad(rtBitmap,'IDB_ORDEMASC',Bitmap.Canvas.Pixels[15,15]);

  Bitmap.LoadFromResourceName(HInstance,'IDB_ORDEMDESC');
  AImageList.ResourceLoad(rtBitmap,'IDB_ORDEMDESC',Bitmap.Canvas.Pixels[15,15]);

  Bitmap.LoadFromResourceName(HInstance,'IDB_IMPRESSORA');
  AImageList.ResourceLoad(rtBitmap,'IDB_IMPRESSORA',Bitmap.Canvas.Pixels[15,15]);

  Bitmap.Free;
end;

{ Find field }
procedure TDBGridUrb.OnFindClick(Sender: TObject);
begin
  FFind.Dataset   := DataSource.Dataset;
  FFind.DataField := SelectedField.FieldName;
  FFind.Execute;
end;

////////////////////////////////////////////////////////////////////////////////
//  Descri��o     : Ordenar por campo.
//
//  Sintaxe       :
//  Exemplo       :
//  Atualizado em :
//  Autor         : andreurbano@ig.com.br
////////////////////////////////////////////////////////////////////////////////
procedure TDBGridUrb.OnOrdenar(Sender: TColumn);
const
 msgCriacao :array[0..1] of string = (' (Ascendente)', ' (Descendente)');
 idxDefault = 'DEFAULT_ORDER';
var
 strColumn: String;
 intX:      Integer;
 bolUsed:   Boolean;
 idOptions: TIndexOptions;
 xField:    TField;
 cdsDados:  TClientDataSet;
 I:         Integer;
begin
 cdsDados := Self.ClientDataSet;

 xField := cdsDados.FieldByName(Sender.Field.FieldName);

 strColumn := idxDefault;
 idOptions := [];

 // SE FOR UM CAMPO CALCULADO N�O DEVE FAZER NADA.
 if (xField.FieldKind = fkCalculated) then
  begin
   Exit;
  end;

 ///////////////////////////////////////////////////////////////////////////////
 // IN�CIO ANDRE 30/09/2002 - C�DIGO PARA ORDENAR CAMPOS LOOKUP.              //
 ///////////////////////////////////////////////////////////////////////////////
 if (xField.FieldKind = fkLookup) then
  begin
   xField := cdsDados.FieldByName(Sender.Field.KeyFields);
  end;
 ///////////////////////////////////////////////////////////////////////////////
 // FINAL ANDRE 30/09/2002 - C�DIGO PARA ORDENAR CAMPOS LOOKUP.               //
 ///////////////////////////////////////////////////////////////////////////////


 // O �NDICE J� EST� EM USO.
 bolUsed := (xField.FieldName = cdsDados.IndexName);

 // VERIFICA A EXIST�NCIA DO �NDICE E PROPRIEDADES
 cdsDados.IndexDefs.Update;
 for intX := 0 to cdsDados.IndexDefs.Count -1 do
  begin
   if (cdsDados.IndexDefs.Items[intX].Name = xField.FieldName) then
    begin
     strColumn := xField.FieldName;

     // DETERMINA COMO DEVE SER CRIADO O �NDICE, INVERTE A CONDI��O ixDecending
     case (ixDescending in cdsDados.IndexDefs.Items[intX].Options) of
      True:  idOptions := [];
      False: idOptions := [ixDescending];
     end;
    end;

  end;

 // SE N�O ENCONTROU O �NDICE, OU O �NDICE J� EST� EM USO...
 if (strColumn = idxDefault) or bolUsed then
  begin
   // O NOME DO �NDICE TEM QUE SER �NICO, PODERIA AT� CRIAR COM NOMES DIFERENTES
   // PARA FICAR MAIS CONFI�VEL, FICA COMO LI��O DE CASA ...:))
   if bolUsed then
    begin
     cdsDados.DeleteIndex(xField.FieldName);
    end;
  end;

 try
  cdsDados.AddIndex(xField.FieldName, xField.FieldName, idOptions, '', '',0);
  strColumn := xField.FieldName;
  Self.SetMensagemOrdem('Ordem: ' + strColumn + msgCriacao[Integer(ixDescending in idOptions)]);
 except
  // O �NDICE EST� INDETERMINADO, PASSO PARA O PADR�O.
  if bolUsed then
   begin
    strColumn := idxDefault;
   end;
 end;

 try
  cdsDados.IndexName := strColumn;
 except
  cdsDados.IndexName := idxDefault;
 end;

 for I := 0 to Self.Columns.Count - 1 do
 begin
   Self.Columns[I].Title.Color := clBtnFace;
 end;
 Sender.Title.Color := clMoneyGreen; // coloca cor na coluna
end;


procedure TDBGridUrb.OnZebrarGrid(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
///var
/// R: TRect;
begin
  if Self.ClientDataSet.RecordCount > 0 then
  begin
    (*DBGrid zebrado*)
    if not odd(Self.ClientDataSet.RecNo) then // se for �mpar
      if not (gdSelected in State) then // se a c�lula n�o est� selecionada
      begin
        Self.Canvas.Brush.Color:=$00FFEFDF; // define uma cor de fundo
        Self.Canvas.FillRect(Rect); // pinta a c�lula
        Self.DefaultDrawDataCell(rect,Column.Field,State); // pinta o texto padr�o
      end;
  end;
end;

{ Include field }
procedure TDBGridUrb.OnIncludeClick(Sender: TObject);
begin
  FFilter.Dataset := DataSource.Dataset;
  FFilter.SetIncludeFilter(SelectedField.FieldName);
end;

{ Exclude field }
procedure TDBGridUrb.OnExcludeClick(Sender: TObject);
begin
  FFilter.Dataset := DataSource.Dataset;
  FFilter.SetExcludeFilter(SelectedField.FieldName);
end;

{ Set filter }
procedure TDBGridUrb.OnSetFilterClick(Sender: TObject);
begin
  FFilter.Dataset := DataSource.Dataset;
  FFilter.Execute;
end;

{ Drop filter }
procedure TDBGridUrb.OnClearFilterClick(Sender: TObject);
begin
  FFilter.Dataset := DataSource.Dataset;
  FFilter.ClearFilter;
end;

{ Ascending sort }
procedure TDBGridUrb.OnSortAscClick(Sender: TObject);
begin
 Self.OrdenarAsc(Self);
end;

{ Descending sort }
procedure TDBGridUrb.OnSortDescClick(Sender: TObject);
begin
 Self.OrdenarDesc(Self);
end;



procedure TDBGridUrb.Imprimir(Sender: TObject);
begin
 //////////////////////////////////////////////////////////////////////////////
 //                                                                          //
 //////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.SystemSetups := [ ssAllowCopies,
                                    ssAllowCollate,
                                    ssAllowDuplex,
                                    ssAllowDestPreview,
                                    ssAllowDestPrinter,
                                    ssAllowDestFile,
                                    ssAllowPrinterSetup,
                                    ssAllowPreviewSetup ];
 //////////////////////////////////////////////////////////////////////////////
 //                                                                          //
 //////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.TitlePreview := 'Visualizador de Relat�rios';
 Self.rvsListagem.TitleSetup   := 'Op��es de Impress�o';
 Self.rvsListagem.TitleStatus  := 'Estatus do Relat�rio';
 //////////////////////////////////////////////////////////////////////////////
 //                                                                          //
 //////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.SystemFiler.StatusFormat := 'Gerando p�gina N� %p';
 //////////////////////////////////////////////////////////////////////////////
 //                                                                          //
 //////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.SystemPreview.FormState := wsMaximized;
 //////////////////////////////////////////////////////////////////////////////
 // Mostra a r�gua em cm.                                                    //
 //////////////////////////////////////////////////////////////////////////////
 //Self.rvsListagem.SystemPreview.RulerType := rtBothCm;
 //////////////////////////////////////////////////////////////////////////////
 //                                                                          //
 //////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.DefaultDest := rdPreview;         { poderia ser rdPrinter para impressora }
 Self.rvsListagem.SystemPrinter.Units := unCM;      { Vamos trabalhar em Centimetros        }
 Self.rvsListagem.SystemPrinter.MarginBottom  := 1;
 Self.rvsListagem.SystemPrinter.MarginLeft    := 1;
 Self.rvsListagem.SystemPrinter.MarginTop     := 1;
 Self.rvsListagem.SystemPrinter.MarginBottom  := 1;
 Self.rvsListagem.SystemPrinter.UnitsFactor   := 2.54;
 //////////////////////////////////////////////////////////////////////////////
 //                                                                          //
 //////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.Execute;
end;

procedure TDBGridUrb.OnAntesDeImprimir(Sender: TObject);
var
  J:                  integer;
  iTotCamp:           integer;
  iColInicial:        integer;
  iColFinal:          integer;

  fLargCampoPoint: Double;
  fLargCampoCM:    Double;
  fLargAreaImp:    Double;
  fMargemEsq:      Double;

begin
  iTotCamp     := Self.FieldCount;
  iColInicial  := 0;
  iColFinal    := iTotCamp - 1;
  fLargAreaImp := 0;
  //////////////////////////////////////////////////////////////////////////////
  // Atribui��o das vari�veis do relat�rio.                                   //
  //////////////////////////////////////////////////////////////////////////////
  sRelatFooterLinha1 := sSistemaEmpresaEndereco;
  sRelatFooterLinha2 := 'Telefone: ' + sSistemaEmpresaTelefone;
  sRelatFooterLinha3 := 'CNPJ: ' + sSistemaEmpresaCNPJ + ' / Insc. Estadual: ' + sSistemaEmpresaInscEstadual + ' / Insc Municipal: ' + sSistemaEmpresaInscMunicipal;
  //////////////////////////////////////////////////////////////////////////////
  // Calcula a �rea de impress�o da tabela.                                   //
  //////////////////////////////////////////////////////////////////////////////
  for J := 0 to iTotCamp - 1 do
  begin
    fLargCampoPoint := Self.Columns[J].Width;
    fLargAreaImp    := fLargAreaImp + (( fLargCampoPoint / 72 ) * 2.54);

    if fLargAreaImp < 27.7 then
    begin
     iColFinal := J;
    end;

  end;
  //////////////////////////////////////////////////////////////////////////////
  // Determina a orienta��o da p�gina( Paisagem ou Retrato ) e a              //
  // quantidade de linhas por p�gina.                                         //
  //////////////////////////////////////////////////////////////////////////////
  if fLargAreaImp > 27.7 then
  begin
    Self.rvsListagem.BaseReport.Orientation := poLandScape;
    iLinhasPorPagina := 30;
  end
  else
  begin
    Self.rvsListagem.BaseReport.Orientation := poPortrait;
    iLinhasPorPagina := 60;
  end;
  //////////////////////////////////////////////////////////////////////////////
  // Define a margem esquerda do relat�rio.                                   //
  //////////////////////////////////////////////////////////////////////////////
  fMargemEsq := ( Self.rvsListagem.BaseReport.PageWidth - fLargAreaImp ) / 2;

  //////////////////////////////////////////////////////////////////////////////
  // Define o tamanho do papel.                                               //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.SetPaperSize( DMPAPER_A4, 0, 0);
  //////////////////////////////////////////////////////////////////////////////
  // Cria a tabula��o dos t�tulos das colunas.                                //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.ClearTabs;
  for J := 0 to iColFinal do
  begin
    fLargCampoPoint := Self.Columns[J].Width;
    fLargCampoCM    := ( fLargCampoPoint / 72 ) * 2.54;

    if J = iColInicial then
    begin

      if (iTotCamp > 1) then
      begin
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINENORIGHT, 15);
      end
      else
      begin
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINEALL, 15);
      end;

    end
    else if J = iColFinal then
    begin
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINENOLEFT, 15);
    end
    else
    begin
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINETOPBOTTOM, 15);
    end;

  end;
  Self.rvsListagem.BaseReport.SaveTabs(1);
  //////////////////////////////////////////////////////////////////////////////
  // Cria a tabula��o das linhas de cor branca.                               //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.ClearTabs;
  for J := 0 to iColFinal do
  begin
    fLargCampoPoint := Self.Columns[J].Width;
    fLargCampoCM    := ( fLargCampoPoint / 72 ) * 2.54;

    if J = iColInicial then
    begin

      if (iTotCamp > 1) then
      begin
      //Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINENORIGHT, 0);
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFT, 0);
      end
      else
      begin
        //Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINEALL, 0);
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFTRIGHT, 0);
      end;

    end
    else if J = iColFinal then
    begin
      //Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINENOLEFT, 0);
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINERIGHT, 0);
    end
    else
    begin
      //Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINETOPBOTTOM, 0);
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINENONE, 0);
    end;

  end;
  Self.rvsListagem.BaseReport.SaveTabs(2);
  //////////////////////////////////////////////////////////////////////////////
  // Cria a tabula��o das linhas de cor cinza claro.                          //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.ClearTabs;
  for J := 0 to iColFinal do
  begin
    fLargCampoPoint := Self.Columns[J].Width;
    fLargCampoCM    := ( fLargCampoPoint / 72 ) * 2.54;

    if (J = iColInicial) then
    begin

      if (iTotCamp > 1) then
      begin
        //Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINENORIGHT, 5);
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFT, 3);
      end
      else
      begin
        //Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINEALL, 3);
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFTRIGHT, 3);
      end;

    end
    else if J = iColFinal then
    begin
      //Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINENOLEFT, 5);
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINERIGHT, 3);
    end
    else
    begin
      //Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINETOPBOTTOM, 5);
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINENONE, 3);
    end;

  end;
  Self.rvsListagem.BaseReport.SaveTabs(3);

  //////////////////////////////////////////////////////////////////////////////
  // Cria a tabula��o das linhas de cor branca com uma linha de bottom.       //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.ClearTabs;
  for J := 0 to iColFinal do
  begin
    fLargCampoPoint := Self.Columns[J].Width;
    fLargCampoCM    := ( fLargCampoPoint / 72 ) * 2.54;

    if J = iColInicial then
    begin

      if (iTotCamp > 1) then
      begin
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFTBOTTOM, 0);
      end
      else
      begin
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINENOTOP, 0);
      end;

    end
    else if J = iColFinal then
    begin
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINERIGHTBOTTOM, 0);
    end
    else
    begin
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINEBOTTOM, 0);
    end;

  end;
  Self.rvsListagem.BaseReport.SaveTabs(4);
  //////////////////////////////////////////////////////////////////////////////
  // Cria a tabula��o das linhas de cor cinza claro com uma linha de bottom.  //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.ClearTabs;
  for J := 0 to iColFinal do
  begin
    fLargCampoPoint := Self.Columns[J].Width;
    fLargCampoCM    := ( fLargCampoPoint / 72 ) * 2.54;

    if (J = iColInicial) then
    begin

      if (iTotCamp > 1) then
      begin
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFTBOTTOM, 3);
      end
      else
      begin
        Self.rvsListagem.BaseReport.SetTab(fMargemEsq, pjLeft, fLargCampoCM, 5, BOXLINELEFTRIGHT, 3);
      end;

    end
    else if J = iColFinal then
    begin
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINERIGHTBOTTOM, 3);
    end
    else
    begin
      Self.rvsListagem.BaseReport.SetTab(NA, pjLeft, fLargCampoCM, 5, BOXLINEBOTTOM, 3);
    end;

  end;
  Self.rvsListagem.BaseReport.SaveTabs(5);

end;


procedure TDBGridUrb.OnImprimirHeader(Sender: TObject);
var
 sData: string;
 sHora: string;
 imgLogo: TBitmap;

 iTituloTopRight: Double;

begin
 ///////////////////////////////////////////////////////////////////////////////
 //                                                                           //
 ///////////////////////////////////////////////////////////////////////////////
 iTituloTopRight := 5.4;

 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o ret�ngulo da parte superior do relat�rio.                       //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.Rectangle(
                                        1.0,                                       { Coluna inicial }
                                        1.0,                                       { Linha inicial  }
                                        Self.rvsListagem.BaseReport.PageWidth - 1, { Coluna final   }
                                        2.95);                                     { Linha final    }
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o logo.                                                           //
 ///////////////////////////////////////////////////////////////////////////////
 imgLogo := TBitmap.Create;
 imgLogo.LoadFromFile( sSistemaPath + 'logo.bmp');

 ///////////////////////////////////////////////////////////////////////////////
 //                                                                           //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.PrintBitmap(
                                         1.10,    { Coluna inicial }
                                         1.10,    { Linha inicial  }
                                         0.30,    { Coluna final   }
                                         0.30,    { Linha final    }
                                         imgLogo  { Imagem         }
                                         );

 imgLogo.Free;
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o n� da p�gina.                                                   //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.SetFont('Arial', 4);
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.SetFont('Arial', 9);
 Self.rvsListagem.BaseReport.PrintLeft( 'P�gina: ', Self.rvsListagem.BaseReport.PageWidth - iTituloTopRight);
 Self.rvsListagem.BaseReport.PrintRight( Self.rvsListagem.BaseReport.Macro(midCurrentPage) + '/' + Self.rvsListagem.BaseReport.Macro(midTotalPages) , Self.rvsListagem.BaseReport.PageWidth - 1.0);
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime a data.                                                           //
 ///////////////////////////////////////////////////////////////////////////////
 sData := FormatDateTime('DD/MM/YYYY', Date);
 sHora := FormatDateTime('HH:NN',      Time);

 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.PrintLeft('Data: ', Self.rvsListagem.BaseReport.PageWidth - iTituloTopRight);
 Self.rvsListagem.BaseReport.PrintRight(sData , Self.rvsListagem.BaseReport.PageWidth - 1.0);
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime a hora.                                                           //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.PrintLeft('Hora: ', Self.rvsListagem.BaseReport.PageWidth - iTituloTopRight);
 Self.rvsListagem.BaseReport.PrintRight(sHora , Self.rvsListagem.BaseReport.PageWidth - 1.0);
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o usu�rio.                                                        //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.PrintLeft('Emitido por: ', Self.rvsListagem.BaseReport.PageWidth - iTituloTopRight);
 //Self.rvsListagem.BaseReport.PrintRight(sSistemaUsuarioLogin , Self.rvsListagem.BaseReport.PageWidth - 1.0);
 Self.rvsListagem.BaseReport.PrintRight(sSistemaUsuarioNome , Self.rvsListagem.BaseReport.PageWidth - 1.0);
 ///////////////////////////////////////////////////////////////////////////////
 // Avan�a tr�s linhas.                                                       //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.NewLine;
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o ret�ngulo do t�tulo do relat�rio.                               //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.Rectangle(
                                        1.0,                                   { Coluna inicial }
                                        4.0,                                   { Linha inicial  }
                                        Self.rvsListagem.BaseReport.PageWidth - 1, { Coluna final   }
                                        3.5);                                  { Linha final    }
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o t�tulo do relat�rio.                                            //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.SetFont('Arial', 4);
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.SetFont('Arial', 11);
 Self.rvsListagem.BaseReport.Bold := True;
 Self.rvsListagem.BaseReport.PrintCenter( UpperCase( Self.TituloListagem ), Self.rvsListagem.BaseReport.PageWidth / 2);
 Self.rvsListagem.BaseReport.Bold := False;
 ///////////////////////////////////////////////////////////////////////////////
 // Avan�a duas linhas.                                                       //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.NewLine;
end;

procedure TDBGridUrb.OnImprimirFooter(Sender: TObject);
begin
 ///////////////////////////////////////////////////////////////////////////////
 // Configura a fonte.                                                        //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.SetFont('Arial', 9);
 ///////////////////////////////////////////////////////////////////////////////
 // Se a impress�o for retrato...                                             //
 ///////////////////////////////////////////////////////////////////////////////
 if Self.rvsListagem.BaseReport.Orientation = poPortrait then
 begin
  //////////////////////////////////////////////////////////////////////////////
  // Posiciona e imprime a linha da parte de inferior do relat�rio.           //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.YPos := 28.1;
  Self.rvsListagem.BaseReport.Rectangle( 1.0,                                         { Coluna inicial }
                                         Self.rvsListagem.BaseReport.PageHeight - 2,  { Linha inicial  }
                                         Self.rvsListagem.BaseReport.PageWidth  - 1,  { Coluna final   }
                                         Self.rvsListagem.BaseReport.PageHeight - 0.7); { Linha final    }
 end
 ///////////////////////////////////////////////////////////////////////////////
 // Ou se a impress�o for paisagem...                                         //
 ///////////////////////////////////////////////////////////////////////////////
 else if Self.rvsListagem.BaseReport.Orientation = poLandScape then
 begin
  //////////////////////////////////////////////////////////////////////////////
  // Posiciona e imprime a linha da parte de inferior do relat�rio.           //
  //////////////////////////////////////////////////////////////////////////////
  Self.rvsListagem.BaseReport.YPos := 19.4;
  Self.rvsListagem.BaseReport.Rectangle( 1.0,                                            { Coluna inicial }
                                         Self.rvsListagem.BaseReport.PageHeight - 2,     { Linha inicial  }
                                         Self.rvsListagem.BaseReport.PageWidth  - 1,     { Coluna final   }
                                         Self.rvsListagem.BaseReport.PageHeight - 0.7 ); { Linha final    }
 end;
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o endere�o.                                                       //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.PrintCenter( sRelatFooterLinha1, Self.rvsListagem.BaseReport.PageWidth / 2);
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o telefone.                                                       //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.PrintCenter( sRelatFooterLinha2, Self.rvsListagem.BaseReport.PageWidth / 2);
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o CNPJ, Insc. estadual e Insc Muni.                               //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.NewLine;
 Self.rvsListagem.BaseReport.PrintCenter( sRelatFooterLinha3, Self.rvsListagem.BaseReport.PageWidth / 2);
end;


procedure TDBGridUrb.OnImprimir(Sender: TObject);
var
 iTotCampos:         integer;
 I:                  integer;
begin
 iTotCampos         := Self.FieldCount;
 ///////////////////////////////////////////////////////////////////////////////
 // Imprime o t�tulo dos campos do DataSet.                                   //
 ///////////////////////////////////////////////////////////////////////////////
 Self.rvsListagem.BaseReport.RestoreTabs(1);
 Self.rvsListagem.BaseReport.Bold := True;
 for I := 0 to iTotCampos - 1 do
 begin
   Self.rvsListagem.BaseReport.PrintTab(Self.Columns[I].Title.Caption);
 end;
 Self.rvsListagem.BaseReport.Bold := False;
 Self.rvsListagem.BaseReport.NewLine;
 ///////////////////////////////////////////////////////////////////////////////
 // In�cio impress�o dos registros do DataSet.                                //
 ///////////////////////////////////////////////////////////////////////////////
 Self.ClientDataSet.First;
 while not Self.ClientDataSet.Eof do
 begin
   /////////////////////////////////////////////////////////////////////////////
   // Se a qtde. de linhas impressas for maior que o total de linhas          //
   // troca de p�gina e imprime o t�tulo novamente.                           //
   /////////////////////////////////////////////////////////////////////////////
   if Self.rvsListagem.BaseReport.LinesLeft < 6 then
   begin
     Self.rvsListagem.BaseReport.NewPage;
     ///////////////////////////////////////////////////////////////////////////
     // Imprime o t�tulo dos campos do DataSet.                               //
     ///////////////////////////////////////////////////////////////////////////
     Self.rvsListagem.BaseReport.RestoreTabs(1);
     Self.rvsListagem.BaseReport.Bold := True;
     for I := 0 to iTotCampos - 1 do
     begin
       Self.rvsListagem.BaseReport.PrintTab(Self.Columns[I].Title.Caption);
     end;
     Self.rvsListagem.BaseReport.Bold := False;
     Self.rvsListagem.BaseReport.NewLine;
   end;
   /////////////////////////////////////////////////////////////////////////////
   // Define qual a cor da linha.                                             //
   /////////////////////////////////////////////////////////////////////////////
   if not odd(Self.ClientDataSet.RecNo) then // se for �mpar
   begin

     if ( Self.rvsListagem.BaseReport.LinesLeft = 6 ) OR ( Self.ClientDataSet.RecordCount = Self.ClientDataSet.RecNo ) then
     begin
       Self.rvsListagem.BaseReport.RestoreTabs(5);
     end
     else
     begin
       Self.rvsListagem.BaseReport.RestoreTabs(3);
     end;

   end
   else
   begin

     if ( Self.rvsListagem.BaseReport.LinesLeft = 6 ) OR ( Self.ClientDataSet.RecordCount = Self.ClientDataSet.RecNo ) then
     begin
       Self.rvsListagem.BaseReport.RestoreTabs(4);
     end
     else
     begin
       Self.rvsListagem.BaseReport.RestoreTabs(2);
     end;

   end;
   /////////////////////////////////////////////////////////////////////////////
   // Imprime o cont�udo dos campos do registro do DataSet.                   //
   /////////////////////////////////////////////////////////////////////////////
   for I := 0 to iTotCampos - 1 do
   begin

     ///////////////////////////////////////////////////////////////////////////
     //                                                                       //
     ///////////////////////////////////////////////////////////////////////////
     if Self.Fields[I].EditMask = '!\(999\)0000-0000;0;_' then
     begin
       Self.rvsListagem.BaseReport.PrintTab( FormatMaskText('!\(999\)0000-0000;0;_', Self.Fields[I].AsString) );
     end
     ///////////////////////////////////////////////////////////////////////////
     //                                                                       //
     ///////////////////////////////////////////////////////////////////////////
     else if Self.Fields[I].DisplayLabel = 'C�digo' then
     begin
       Self.rvsListagem.BaseReport.PrintTab( FormatFloat('000000', Self.Fields[I].AsInteger) );
     end
     ///////////////////////////////////////////////////////////////////////////
     //                                                                       //
     ///////////////////////////////////////////////////////////////////////////
     else if Self.Fields[I].DisplayLabel = 'Qtde.' then
     begin
       Self.rvsListagem.BaseReport.PrintTab( FormatFloat('00', Self.Fields[I].AsInteger) );
     end
     ///////////////////////////////////////////////////////////////////////////
     //                                                                       //
     ///////////////////////////////////////////////////////////////////////////
     else if Self.Fields[I].DisplayLabel = 'Parc.' then
     begin
       Self.rvsListagem.BaseReport.PrintTab( FormatFloat('00', Self.Fields[I].AsInteger) );
     end

     else
     begin
       Self.rvsListagem.BaseReport.PrintTab(Self.Fields[I].AsString);
     end;

   end;
   Self.rvsListagem.BaseReport.NewLine;
   /////////////////////////////////////////////////////////////////////////////
   // Avan�a para o pr�ximo registro do DataSet.                              //
   /////////////////////////////////////////////////////////////////////////////
   Self.ClientDataSet.Next;
 end;

end;



end.

