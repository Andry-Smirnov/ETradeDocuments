{ interface library for FPC and Lazarus

  Copyright (C) 2019 Lagunov Aleksey alexs75@yandex.ru

  Генерация xml файлов для электронного документооборота
  Формат заявления о ввозе товаров и уплате косвенных налогов российского налогоплательщика

  Структуры данных базируются на основании "Приказ от 19.11.2014 № ММВ-7-6/590@"

  This library is free software; you can redistribute it and/or modify it
  under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version with the following modification:

  As a special exception, the copyright holders of this library give you
  permission to link this library with independent modules to produce an
  executable, regardless of the license terms of these independent modules,and
  to copy and distribute the resulting executable under terms of your choice,
  provided that you also meet, for each linked independent module, the terms
  and conditions of the license of that module. An independent module is a
  module which is not derived from or based on this library. If you modify
  this library, you may extend this exception to your version of the library,
  but you are not obligated to do so. If you do not wish to do so, delete this
  exception statement from your version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, write to the Free Software Foundation,
  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
}

unit ImportGoodsAndIndirectTaxesExchangeFile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, xml_doc, ImportGoodsAndIndirectTaxesDocument;

type

  { TImportGoodsAndIndirectTaxesExchangeFile }

  TImportGoodsAndIndirectTaxesExchangeFile = class(TAbstractExchangeFile)   //%Таблица 4.1
  private
    //FAppVersion: string;
    FDocument: TImportGoodsAndIndirectTaxesDocument;
    //FFileID: string;
    //FFormatVersion: string;
    FInformationType: string;
    FRecipientTaxInspectionCode: string;
    //procedure SetAppVersion(AValue: string);
    //procedure SetFileID(AValue: string);
    //procedure SetFormatVersion(AValue: string);
    procedure SetInformationType(AValue: string);
    procedure SetRecipientTaxInspectionCode(AValue: string);
  protected
    procedure InternalRegisterPropertys; override;
    procedure InternalInitChilds; override;
  public
    destructor Destroy; override;
  published
    //property FileID:string read FFileID write SetFileID;
    //property FormatVersion:string read FFormatVersion write SetFormatVersion;
    property InformationType:string read FInformationType write SetInformationType;
    //property AppVersion:string read FAppVersion write SetAppVersion;
    property RecipientTaxInspectionCode:string read FRecipientTaxInspectionCode write SetRecipientTaxInspectionCode;
    property Document:TImportGoodsAndIndirectTaxesDocument read FDocument;
  end;

implementation

{ TImportGoodsAndIndirectTaxesExchangeFile }
(*
procedure TImportGoodsAndIndirectTaxesExchangeFile.SetAppVersion(AValue: string
  );
begin
  if FAppVersion=AValue then Exit;
  FAppVersion:=AValue;
  ModifiedProperty('AppVersion');
end;

procedure TImportGoodsAndIndirectTaxesExchangeFile.SetFileID(AValue: string);
begin
  if FFileID=AValue then Exit;
  FFileID:=AValue;
  ModifiedProperty('FileID');
end;

procedure TImportGoodsAndIndirectTaxesExchangeFile.SetFormatVersion(
  AValue: string);
begin
  if FFormatVersion=AValue then Exit;
  FFormatVersion:=AValue;
  ModifiedProperty('FormatVersion');
end;
*)
procedure TImportGoodsAndIndirectTaxesExchangeFile.SetInformationType(
  AValue: string);
begin
  if FInformationType=AValue then Exit;
  FInformationType:=AValue;
  ModifiedProperty('InformationType');
end;

procedure TImportGoodsAndIndirectTaxesExchangeFile.SetRecipientTaxInspectionCode
  (AValue: string);
begin
  if FRecipientTaxInspectionCode=AValue then Exit;
  FRecipientTaxInspectionCode:=AValue;
  ModifiedProperty('RecipientTaxInspectionCode');
end;

procedure TImportGoodsAndIndirectTaxesExchangeFile.InternalRegisterPropertys;
begin
  inherited InternalRegisterPropertys;
  //RegisterProperty('FileID', 'ИдФайл', 'О', 'Идентификатор файла', 1, 100);
  //RegisterProperty('FormatVersion', 'ВерсФорм', 'О', 'Версия формата', 1, 5);
  RegisterProperty('InformationType', 'ТипИнф', 'О', 'Тип информации', 1, 50);
  //RegisterProperty('AppVersion', 'ВерсПрог', 'Н', 'Версия передающей программы', 1, 40);
  RegisterProperty('RecipientTaxInspectionCode', 'КодНО', 'О', 'Код налогового органа получателя', 1, 4);
  RegisterProperty('Document', 'Документ', 'О', 'Сведения заявления российского налогоплательщика о ввозе товаров и уплате косвенных налогов', -1, -1);
end;

procedure TImportGoodsAndIndirectTaxesExchangeFile.InternalInitChilds;
begin
  inherited InternalInitChilds;
  FDocument:=TImportGoodsAndIndirectTaxesDocument.Create;
end;

destructor TImportGoodsAndIndirectTaxesExchangeFile.Destroy;
begin
  FreeAndNil(FDocument);
  inherited Destroy;
end;

end.
