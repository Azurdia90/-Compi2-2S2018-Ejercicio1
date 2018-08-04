package Analizadores;
import java_cup.runtime.Symbol;


%%
%class Lexico
%public
%line
%char
%cup
%unicode
%ignorecase

%init{
    yyline = 1;
    yychar = 1;
%init}

letra = [a-zA-ZnÑ]
digito = [0-9]
entero = {digito}+("."{digito}+)?
cadena = [\"]([^\"\n]|(\\\"))*[\"]
identificador = [A-Za-z]+["_"0-9A-Za-z]*
comentario_single = ("//".*\r\n)|("//".*\n)|("//".*\r)
comentario_multi = "/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"

r_imprimir = "print"
r_declarar = "declare"
r_string = "string"
r_boolean = "boolean"
r_not = "not"
r_and = "and"
r_or = "or"
r_true = "true"
r_false = "false"

dot_coma = ";"
par_open = "("
par_close = ")"
sym_plus = "+"
sym_por = "*"
sym_div = "/"
sym_and = "&"
sym_not_equal = "<>"
sym_compare = "=="
sym_minor_equal_than = "<="
sym_mayor_equal_than = ">="
sym_minor_than = "<"
sym_mayor_than = ">"
sym_equal = "="

%%

\n {yychar=1}

{r_imprimir}    {return new Symbol(sym.r_imprimir,yyline,yychar, yytext());}  
{r_declarar}    {return new Symbol(sym.r_declarar,yyline,yychar, yytext());} 
{r_string}      {return new Symbol(sym.r_string,yyline,yychar, yytext());} 
{r_boolean}     {return new Symbol(sym.r_boolean,yyline,yychar, yytext());} 
{r_not}         {return new Symbol(sym.r_not,yyline,yychar, yytext());} 
{r_and}         {return new Symbol(sym.r_and,yyline,yychar, yytext());} 
{r_or}          {return new Symbol(sym.r_or,yyline,yychar, yytext());} 
{r_true}        {return new Symbol(sym.r_true,yyline,yychar, yytext());} 
{r_false}       {return new Symbol(sym.r_false,yyline,yychar, yytext());} 

{dot_coma}      {return new Symbol(sym.dot_coma,yyline,yychar, yytext());} 
{par_open}      {return new Symbol(sym.par_open,yyline,yychar, yytext());} 
{par_close}     {return new Symbol(sym.par_close,yyline,yychar, yytext());} 
{sym_plus}      {return new Symbol(sym.sym_plus,yyline,yychar, yytext());} 
{sym_por}       {return new Symbol(sym.sym_por,yyline,yychar, yytext());} 
{sym_div}       {return new Symbol(sym.sym_div,yyline,yychar, yytext());} 
{sym_and}       {return new Symbol(sym.sym_and,yyline,yychar, yytext());} 
{sym_equal}     {return new Symbol(sym.sym_equal,yyline,yychar, yytext());} 
{sym_not_equal} {return new Symbol(sym.sym_not_equal,yyline,yychar, yytext());} 
{sym_compare}   {return new Symbol(sym.sym_compare,yyline,yychar, yytext());} 
{sym_minor_equal_than}  {return new Symbol(sym.sym_minor_equal_than,yyline,yychar, yytext());} 
{sym_mayor_equal_than}  {return new Symbol(sym.sym_mayor_equal_than,yyline,yychar, yytext());} 
{sym_minor_than}        {return new Symbol(sym.sym_minor_than,yyline,yychar, yytext());} 
{sym_mayor_than}        {return new Symbol(sym.sym_mayor_than,yyline,yychar, yytext());} 

{entero}        {return new Symbol(sym.entero,yyline,yychar, yytext());} 
{cadena}        {return new Symbol(sym.cadena,yyline,yychar,yytext());}
{identificador} {return new Symbol(sym.identificador,yyline,yychar, yytext());} 


[ \t\r\f\n]+            {/* Se ignoran */}  
{comentario_single}     {/* Se ignoran */}
{comentario_multi}      {/* Se ignoran */}

. { System.err.println("Este es un error lexico: "+yytext()+", en la linea: "+yyline+", en la columna: "+yychar);}