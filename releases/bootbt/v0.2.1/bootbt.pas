{===========================================================================
  Este arquivo pertence ao Projeto do Sistema Operacional LuckyOS (LOS).
  --------------------------------------------------------------------------
  Copyright (C) 2013 - Luciano L. Goncalez
  --------------------------------------------------------------------------
  a.k.a.: Master Lucky
  eMail : master.lucky.br@gmail.com
  Home  : http://lucky-labs.blogspot.com.br
============================================================================
  Este programa e software livre; voce pode redistribui-lo e/ou modifica-lo
  sob os termos da Licenca Publica Geral GNU, conforme publicada pela Free
  Software Foundation; na versao 2 da Licenca.

  Este programa e distribuido na expectativa de ser util, mas SEM QUALQUER
  GARANTIA; sem mesmo a garantia implicita de COMERCIALIZACAO ou de
  ADEQUACAO A QUALQUER PROPOSITO EM PARTICULAR. Consulte a Licenca Publica
  Geral GNU para obter mais detalhes.

  Voce deve ter recebido uma copia da Licenca Publica Geral GNU junto com
  este programa; se nao, escreva para a Free Software Foundation, Inc., 59
  Temple Place, Suite 330, Boston, MA 02111-1307, USA. Ou acesse o site do
  GNU e obtenha sua licenca: http://www.gnu.org/
============================================================================
  Unit BootBT.pas
  --------------------------------------------------------------------------
  Esta Unit contem a tabela de boot fornecida pelo bootloader.
  --------------------------------------------------------------------------
  Versao: 0.2.1
  Data: 12/01/2018
  --------------------------------------------------------------------------
  Compilar: Compilavel pelo Turbo Pascal 5.5 (Free)
  > tpc bootbt.pas
  ------------------------------------------------------------------------
  Compilar: Compilavel FPC
  > fpc bootbt.pas
  ------------------------------------------------------------------------
  Executar: Nao executavel diretamente; Unit.
============================================================================
  Historico de versões
  ------------------------------------------------------------------------
  [2013-0421-0000] (v0.1) <Luciano Goncalez>

  - Implementação inicial.
  - Adiciona tabela com informações do bootloader.
  ------------------------------------------------------------------------
  [2013-0614-0000] (v0.1.1) <Luciano Goncalez>

  - Adicionando campo de versão.
  ------------------------------------------------------------------------
  [2013-0920-0000] (v0.2) <Luciano Goncalez>

  - Adicionando informações sobre o uso da memória.
  ------------------------------------------------------------------------
  [2018-0112-2214] (v0.2.1) <Luciano Goncalez>

  - Adicionando historico ao arquivo.
  - Substituindo identação para espaços.
===========================================================================}

unit BootBT;

interface

uses Basic;

type
  TLOSSign = array[0..3] of char;
  TBTSign = array[0..3] of char;

  TBootTable = packed record
    {assinatura da tabela}
    LOSSign : TLOSSign;
    BTSign : TBTSign;
    Version : Byte;
    {dados}
    CPULevel : Byte;
    LowMemory : DWord;
    HighMemory : DWord;
    CRTInfo : Word;
    CRTRows : Byte;
    CRTCols : Byte;
    CRTPort : Word;
    CRTSeg : Word;
    A20KBC : Boolean;
    A20Bios : Boolean;
    A20Fast : Boolean;
    ImgIni : DWord;
    ImgEnd : DWord;
    StackIni : DWord;
    StackEnd : DWord;
    HeapIni : DWord;
    HeapEnd : DWord;
    {adicionado na versao 2}
    FreeLowIni : DWord;
    FreeLowEnd : DWord;
    FreeHighIni : DWord;
    FreeHighEnd : DWord;
    {assinatura de rodape}
    FootSign : TLOSSign;
  end;

const
  cLOSSign  : TLOSSign  = ('L', 'O', 'S', #0);
  cBTSign   : TBTSign   = ('B', 'B', 'T', #0);
  cBTVersion = 2 ;

implementation

end.
