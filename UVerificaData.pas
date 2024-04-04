//
// Verificar estado no while (feriados regionais)

unit UVerificaData;

interface

uses SysUtils, DateUtils, Dialogs, Controls, Classes;

var
 FEstado: string;

type
  THolidayType = (htNational, htRegional);
  THolidayInfo = record
    Dia:  Integer;
    Mes:  Integer;
    UF:   String;
    Tipo: THolidayType;
    Nome: String;


  end;

const
  //FERIADOS NACIONAIS
  AnoNovo:          THolidayInfo =   (Dia: 01; Mes: 01; UF: 'BR'; Tipo: htNational; Nome: 'Ano Novo');
  Tiradentes:       THolidayInfo =   (Dia: 21; Mes: 04; UF: 'BR'; Tipo: htNational; Nome: 'Tiradentes');
  DiadoTrabalho:    THolidayInfo =   (Dia: 01; Mes: 05; UF: 'BR'; Tipo: htNational; Nome: 'Dia do Trabalhador');
  Independencia:    THolidayInfo =   (Dia: 07; Mes: 10; UF: 'BR'; Tipo: htNational; Nome: 'Independencia');
  DiaDasCriancas:   THolidayInfo =   (Dia: 12; Mes: 10; UF: 'BR'; Tipo: htNational; Nome: 'Dia Das Criancas');
  Finados:          THolidayInfo =   (Dia: 02; Mes: 11; UF: 'BR'; Tipo: htNational; Nome: 'Finados');
  Proclamacao:      THolidayInfo =   (Dia: 15; Mes: 11; UF: 'BR'; Tipo: htNational; Nome: 'Proclamacao da Republica');
  ConscienciaNegra: THolidayInfo =   (Dia: 20; Mes: 11; UF: 'BR'; Tipo: htNational; Nome: 'Consciencia Negra');
  Natal:            THolidayInfo =   (Dia: 25; Mes: 12; UF: 'BR'; Tipo: htNational; Nome: 'Natal');

  //FERIADOS ESTADUAIS
  //AC
  DiaCatolicoAC:    THolidayInfo =   (Dia: 20; Mes: 01; UF: 'AC'; Tipo: htRegional; Nome: 'Dia do Católico');
  DiaEvangelicoAC:  THolidayInfo =   (Dia: 25; Mes: 01; UF: 'AC'; Tipo: htRegional; Nome: 'Dia do Evangélico');
  AniversarioAC:    THolidayInfo =   (Dia: 15; Mes: 06; UF: 'AC'; Tipo: htRegional; Nome: 'Aniversário do Estado do Acre');
  DiaAmazoniaAC:    THolidayInfo =   (Dia: 05; Mes: 09; UF: 'AC'; Tipo: htRegional; Nome: 'Dia da Amazônia');
  TratadoPtAC:      THolidayInfo =   (Dia: 17; Mes: 11; UF: 'AC'; Tipo: htRegional; Nome: 'Tratado de Petrópolis');

  //AL
  SaoJoaoAL:        THolidayInfo =   (Dia: 24; Mes: 06; UF: 'AL'; Tipo: htRegional; Nome: 'Dia de São João');
  SaoPedroAL:       THolidayInfo =   (Dia: 29; Mes: 06; UF: 'AL'; Tipo: htRegional; Nome: 'Dia de São Pedro');
  EmancipacaoAL:    THolidayInfo =   (Dia: 16; Mes: 09; UF: 'AL'; Tipo: htRegional; Nome: 'Emancipação Política de Alagoas');

  //AM
  ElevacaoAmazonas: THolidayInfo =   (Dia: 05; Mes: 09; UF: 'AM'; Tipo: htRegional; Nome: 'Elevação do Amazonas à categoria de província');
  NossaSenhoraAM:   THolidayInfo =   (Dia: 08; Mes: 12; UF: 'AM'; Tipo: htRegional; Nome: 'Dia de Nossa Senhora da Conceição');

  //AP
  DiaSaoJoseAP:     THolidayInfo =   (Dia: 19; Mes: 03; UF: 'AP'; Tipo: htRegional; Nome: 'Dia de São José');
  DiaSaoTiagoAP:    THolidayInfo =   (Dia: 25; Mes: 07; UF: 'AP'; Tipo: htRegional; Nome: 'Dia de São Tiago');

  //BA
  IndependenciaBA:  THolidayInfo =   (Dia: 02; Mes: 07; UF: 'BA'; Tipo: htRegional; Nome: 'Independência da Bahia');

  //CE
  PadroeiraCeara:   THolidayInfo =   (Dia: 16; Mes: 07; UF: 'CE'; Tipo: htRegional; Nome: 'Nossa Senhora do Carmo - Padroeira do Ceará');
  DiaSaoJoseCE:     THolidayInfo =   (Dia: 19; Mes: 03; UF: 'CE'; Tipo: htRegional; Nome: 'Dia de São José');
  DataMagnaCE:      THolidayInfo =   (Dia: 25; Mes: 03; UF: 'CE'; Tipo: htRegional; Nome: 'Data Magna do Ceará');

  //DF
  FundacaoBrasilia: THolidayInfo =   (Dia: 21; Mes: 04; UF: 'DF'; Tipo: htRegional; Nome: 'Fundação de Brasília');
  DiaEvangélicoDF:  THolidayInfo =   (Dia: 30; Mes: 11; UF: 'DF'; Tipo: htRegional; Nome: 'Dia do Evangélico');

  //ES
  DiaEstadoES:      THolidayInfo =   (Dia: 23; Mes: 05; UF: 'ES'; Tipo: htRegional; Nome: 'Dia da Emancipação Política do Espírito Santo');

  //GO
  FundacaoGoias:    THolidayInfo =   (Dia: 05; Mes: 10; UF: 'GO'; Tipo: htRegional; Nome: 'Aniversário da Fundação de Goiás');

  //MA
  DiaEstadoMA:      THolidayInfo =   (Dia: 28; Mes: 07; UF: 'MA'; Tipo: htRegional; Nome: 'Dia da Adesão do Maranhão à Independência do Brasil');

  //MS
  DiaEstadoMS:      THolidayInfo =   (Dia: 11; Mes: 10; UF: 'MS'; Tipo: htRegional; Nome: 'Criação do Estado');

  //MG
  DiaMinasGerais:   THolidayInfo =   (Dia: 21; Mes: 04; UF: 'MG'; Tipo: htRegional; Nome: 'Tiradentes');

  //PA
  DiaEstadoPA:      THolidayInfo =   (Dia: 15; Mes: 08; UF: 'PA'; Tipo: htRegional; Nome: 'Adesão do Grão-Pará à Independência do Brasil');

  //PB
  DiaEstadoPB:      THolidayInfo =   (Dia: 05; Mes: 08; UF: 'PB'; Tipo: htRegional; Nome: 'Fundação do Estado');

  //PR
  DiaEstadoPR:      THolidayInfo =   (Dia: 19; Mes: 12; UF: 'PR'; Tipo: htRegional; Nome: 'Dia do Estado');

  //PE
  DataMagnaPE:      THolidayInfo =   (Dia: 06; Mes: 03; UF: 'PE'; Tipo: htRegional; Nome: 'Data Magna do Estado de Pernambuco');
  SaoJoaoPE:        THolidayInfo =   (Dia: 24; Mes: 06; UF: 'PE'; Tipo: htRegional; Nome: 'Dia de São João');

  //PI
  DiaEstadoPI:      THolidayInfo =   (Dia: 19; Mes: 10; UF: 'PI'; Tipo: htRegional; Nome: 'Dia do Piauí');
  BatalhaJenipapPI: THolidayInfo =   (Dia: 13; Mes: 03; UF: 'PI'; Tipo: htRegional; Nome: 'Dia da Batalha do Jenipapo');

  //RJ
  AniversarioRJ:    THolidayInfo =   (Dia: 01; Mes: 03; UF: 'RJ'; Tipo: htRegional; Nome: 'Aniversário do Rio de Janeiro');
  DiaSaoJorge:      THolidayInfo =   (Dia: 23; Mes: 04; UF: 'RJ'; Tipo: htRegional; Nome: 'Dia de São Jorge');

  //RN
  DiaEstadoRN:      THolidayInfo =   (Dia: 03; Mes: 10; UF: 'RN'; Tipo: htRegional; Nome: 'Mártires de Cunhaú e Uruaçu');

  //RS
  RevolucaoRS:      THolidayInfo =   (Dia: 20; Mes: 09; UF: 'RS'; Tipo: htRegional; Nome: 'Revolução Farroupilha');

  //RO
  CriacaoRO:        THolidayInfo =   (Dia: 04; Mes: 01; UF: 'RO'; Tipo: htRegional; Nome: 'Criação do Estado de Rondônia');
  DiaEvangelicoRO:  THolidayInfo =   (Dia: 18; Mes: 06; UF: 'RO'; Tipo: htRegional; Nome: 'Dia do Evangélico');

  //RR
  ElevacaoRR:       THolidayInfo =   (Dia: 05; Mes: 10; UF: 'RR'; Tipo: htRegional; Nome: 'Elevação do antigo Território Federal do Rio Branco a estado de Roraima');

  //SC
  DiaEstadoSC:      THolidayInfo =   (Dia: 11; Mes: 08; UF: 'SC'; Tipo: htRegional; Nome: 'Criação da Província de Santa Catarina');

  //SE
  DiaEstadoSE:      THolidayInfo =   (Dia: 08; Mes: 07; UF: 'SE'; Tipo: htRegional; Nome: 'Autonomia de Sergipe');

  //SP
  AniversarioSP:    THolidayInfo =   (Dia: 25; Mes: 01; UF: 'SP'; Tipo: htRegional; Nome: 'Aniversário de São Paulo');
  RevolucaoSP:      THolidayInfo =   (Dia: 09; Mes: 07; UF: 'SP'; Tipo: htRegional; Nome: 'Revolução Constitucionalista de 1932');

  //TO
  InstalacaoTO:     THolidayInfo =   (Dia: 01; Mes: 01; UF: 'TO'; Tipo: htRegional; Nome: 'Instalação de Tocantins');
  NossaSenhoraTO:   THolidayInfo =   (Dia: 08; Mes: 09; UF: 'TO'; Tipo: htRegional; Nome: 'Nossa Senhora da Natividade');
  CriacaoTO:        THolidayInfo =   (Dia: 05; Mes: 10; UF: 'TO'; Tipo: htRegional; Nome: 'Criação de Tocantins');


procedure InicializaElementos;
procedure FeriadosFixos;
procedure FeriadosCalculados;

function ObtemData(Data1,Data2:TDateTime): TDateTime;
function CalculaDataEspacial(Y: Integer): TDateTime;

function CalcularFeriado(D, M: Integer; U: string; T: THolidayType; N:string) : THolidayInfo;
function CalculaIncrementoData(Y: Integer; D: Integer): TDateTime;


implementation

var

  HolidayDate: TDateTime;
  Found: Boolean;
  I: Integer;
  Months, Year, CarnavalYear: integer;
  CarnavalDate: TDateTime;
  Holidays: array [1..58] of THolidayInfo;

procedure InicializaElementos;
begin
  Year := YearOf(Now); // Define o ano atual
  FeriadosFixos;
  FeriadosCalculados;
end;


procedure FeriadosFixos;
begin
  FEstado := '';

  //FERIADOS NACIONAIS
  Holidays[1]  := AnoNovo;
  Holidays[2]  := Natal;
  Holidays[3]  := Independencia;
  Holidays[4]  := Tiradentes;
  Holidays[5]  := DiadoTrabalho;
  Holidays[6]  := DiaDasCriancas;
  Holidays[7]  := Finados;
  Holidays[8]  := Proclamacao;
  Holidays[9]  := ConscienciaNegra;

  //FERIADOS ESTADUAIS
  //Acre
  Holidays[10] := DiaCatolicoAC;
  Holidays[11] := DiaEvangelicoAC;
  Holidays[12] := AniversarioAC;
  Holidays[13] := DiaAmazoniaAC;
  Holidays[14] := TratadoPtAC;

  //Alagoas
  Holidays[15] := SaoJoaoAL;
  Holidays[16] := SaoPedroAL;
  Holidays[17] := EmancipacaoAL;

  //Amazonas
  Holidays[18] := ElevacaoAmazonas;
  Holidays[19] := NossaSenhoraAM;

  //Amapa
  Holidays[20] := DiaSaoJoseAP;
  Holidays[21] := DiaSaoTiagoAP;

  //Bahia
  Holidays[22] := IndependenciaBA;

  //Ceara
  Holidays[23] := PadroeiraCeara;
  Holidays[24] := DiaSaoJoseCE;
  Holidays[25] := DataMagnaCE;

  //Brasilia
  Holidays[26] := FundacaoBrasilia;
  Holidays[27] := DiaEvangélicoDF;

  //Espirito Santo
  Holidays[28] := DiaEstadoES;

  //Goiais
  Holidays[29] := FundacaoGoias;

  //Maranhão
  Holidays[30] := DiaEstadoMA;

  //Mato Grosso do Sul
  Holidays[31] := DiaEstadoMS;

  //Minas Gerais
  Holidays[32] := DiaMinasGerais;

  //Para
  Holidays[33] := DiaEstadoPA;

  //Paraiba
  Holidays[34] := DiaEstadoPB;

  //Parana
  Holidays[35] := DiaEstadoPR;

  //Pernambuco
  Holidays[36] := DataMagnaPE;
  Holidays[37] := SaoJoaoPE;

  //Piaui
  Holidays[38] := DiaEstadoPI;
  Holidays[39] := BatalhaJenipapPI;

  //Rio De Janeiro
  Holidays[40] := AniversarioRJ;
  Holidays[41] := DiaSaoJorge;

  //Rio Grande do Norte
  Holidays[42] := DiaEstadoRN;

  //Rio Grande do Sul
  Holidays[43] := RevolucaoRS;

  //Rondonia
  Holidays[44] := CriacaoRO;
  Holidays[45] := DiaEvangelicoRO;


  //Roraima
  Holidays[46] := ElevacaoRR;

  //Santa Catarina
  Holidays[47] := DiaEstadoSC;

  //Sergipe
  Holidays[48] := DiaEstadoSE;

  //São Paulo
  Holidays[49] := AniversarioSP;
  Holidays[50] := RevolucaoSP;

  //Tocantis
  Holidays[51] := InstalacaoTO;
  Holidays[52] := NossaSenhoraTO;
  Holidays[53] := CriacaoTO;
end;

procedure FeriadosCalculados;
var
  Pascoa, Carnaval, QuartadeCinzas, CorpusChristi: THolidayInfo;
begin
  Pascoa         := CalcularFeriado( DayOf(CalculaDataEspacial(Year)), MonthOf(CalculaDataEspacial(year)), 'BR', htNational, 'Pascoa'  );
  Carnaval       := CalcularFeriado( DayOf(CalculaIncrementoData(Year, -47)), MonthOf(CalculaIncrementoData(Year, -47)), 'BR', htNational, 'Carnaval'  );
  QuartadeCinzas := CalcularFeriado( DayOf(CalculaIncrementoData(Year, -46)), MonthOf(CalculaIncrementoData(Year, -46)), 'BR', htNational, 'Quarta de cinzas'  );
  CorpusChristi  := CalcularFeriado( DayOf(CalculaIncrementoData(Year, +60)), MonthOf(CalculaIncrementoData(Year, +60)), 'BR', htNational, 'Corpus Christi'  );

  Holidays[54] := Pascoa;
  Holidays[55] := Carnaval;
  Holidays[56] := QuartadeCinzas;
  Holidays[57] := CorpusChristi;
end;

function ObtemData(Data1,Data2:TDateTime): TDateTime;
var
  contaFeriados : integer;
  Feriados: TStringlist;
begin
  // Inicializando variáveis para a verificação
  I := 1;
  contaFeriados := 0; // Inicialização da variável para contar quantidade de feriados no periodo

  for I := Low(Holidays) to High(Holidays) - 1 do
  begin
    HolidayDate := EncodeDate(YearOf(Data1), Holidays[I].Mes, Holidays[I].Dia);

    if (HolidayDate >= Data1) and (HolidayDate <= Data2) and
      not (DayOfTheWeek(HolidayDate) in [1, 7]) and ((Holidays[i].UF = 'BR') or (Holidays[i].UF = FEstado)) then
    begin
      //ShowMessage(Format('Há um feriado (%s) no período entre %s e %s.',[Holidays[I].Nome, DateToStr(Data1), DateToStr(Data2)]));
      Inc(contaFeriados);
    end;
  end;

  // verificar se conta pós incremento a data cai em finais de semana

  if MessageDlg('Feriados encontrados ' + IntToStr(contaFeriados) + 'Feriados no período entre ' +
    DateToStr(Data1) + ' e ' + DateToStr(Data2) + ' Em dias úteis - Adiciona' +
    IntToStr(contaFeriados) + ' Dias a mais de prazo ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    result := IncDay(Data2, contaFeriados)
  else
    result := Data2;
end;


function CalculaDataEspacial(Y: Integer): TDateTime;
var
  a, b, c, d, e, f, g, h, i, k, l, m, p: Integer;
  Month, Day: Integer;
begin
  a := Y mod 19;
  b := Y div 100;
  c := Y mod 100;
  d := b div 4;
  e := b mod 4;
  f := (b + 8) div 25;
  g := (b - f + 1) div 3;
  h := (19 * a + b - d - g + 15) mod 30;
  i := c div 4;
  k := c mod 4;
  l := (32 + 2 * e + 2 * i - h - k) mod 7;
  m := (a + 11 * h + 22 * l) div 451;
  Month := (h + l - 7 * m + 114) div 31;
  Day := ((h + l - 7 * m + 114) mod 31) + 1;
  Result := EncodeDate(Y, Month, Day);
end;

function CalcularFeriado(D, M: Integer; U: string; T: THolidayType; N:string) : THolidayInfo;
begin
  result.Dia := D;
  result.Mes := M;
  result.UF := U;
  result.Tipo := T;
  result.Nome := N;
end;

function CalculaIncrementoData(Y: Integer; D: Integer): TDateTime;
begin
  Result := IncDay(CalculaDataEspacial(Y), D);
end;

initialization
  InicializaElementos;

end.
