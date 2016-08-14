unit Udebug;

interface

uses
  Windows, Classes, SysUtils, Variants, adxAddIn, forms, FileCtrl,
  excel2000, StrUtils, ZcGridClasses, ZJGrid, ZcDataGrid, ZcDBGrids, ZcUniClass,
  Dialogs, Controls, IniFiles, ShellAPI, communit,
  ExtCtrls, DB, ADODB;

procedure NewTxt(FileName: string);
procedure OpenTxt(FileName: string);
procedure ReadTxt(FileName: string);
procedure AppendTxt(Str: string; FileName: string);
procedure debugto(str: string);
procedure DebugReset();

implementation

procedure NewTxt(FileName: string);
var
  F: Textfile;
begin
  if fileExists(FileName) then
    DeleteFile(FileName); {看文件是否存在,在就刪除}
  AssignFile(F, FileName); {将文件名与变量 F 关联}
  ReWrite(F); {创建一个新的文件并命名为 ek.txt}
  Writeln(F, 'test:');
  Closefile(F); {关闭文件 F}
end;

procedure OpenTxt(FileName: string);
var
  F: Textfile;
begin
  AssignFile(F, FileName); {将文件名与变量 F 关联}
  Append(F); {以编辑方式打开文件 F }
  Writeln(F, '将您要写入的文本写入到一个 .txt 文件');
  Closefile(F); {关闭文件 F}
end;

procedure ReadTxt(FileName: string);
var
  F: Textfile;
  str: string;
begin
  AssignFile(F, FileName); {将文件名与变量 F 关联}
  Reset(F); {打开并读取文件 F }
  Readln(F, str);
  ShowMessage('文件有:' + str + '行。');
  Closefile(F); {关闭文件 F}
end;

procedure AppendTxt(Str: string; FileName: string);
var
  F: Textfile;
begin
  AssignFile(F, FileName);
  Append(F);
  Writeln(F, Str);
  Closefile(F);
end;

procedure DebugReset();
begin
  NewTxt(mainpath + 'test.txt');
end;

procedure debugto(str: string);
var
  afile: string;
begin
  afile := mainpath + 'test.txt';

  if not FileExists(afile) then
    NewTxt(afile);

  AppendTxt(Str, afile);

end;

end.

