import java_cup.runtime.*;

%%
%class AnalisadorLexico
%public
%unicode
%implements java_cup.runtime.Scanner
%function next_token
%type java_cup.runtime.Symbol


//Macros
IDENTIFYERS = [a-zA-Z_][a-zA-Z0-9_]*
NUMBERS = [0-9]
CONSTANTS = {NUMBERS}+("."{NUMBERS}+)?
OPERATORS = ("+" | "-" | "*" | "/" | "=")
DELIMITERS = ("(" | ")" | "{" | "}" | "[" | "]" | ";" | "," | ".")
COMMENT_LINE = "//".*
COMMENT_BLOCK = "/*"([^*]|\*+[^*/])*"*"+"/"
%%



// Palavras-chave (devem vir antes dos identificadores)
"if" { return new Symbol(sym.IF); }
"else" { return new Symbol(sym.ELSE); }
"while" { return new Symbol(sym.WHILE); }
"return" { return new Symbol(sym.RETURN); }
"for" { return new Symbol(sym.FOR); }

//tokens
{IDENTIFYERS} { return new Symbol(sym.ID, yytext()); }
{NUMBERS} {return new Symbol(sym.NUM, Integer.parseInt(yytext())); }
{CONSTANTS} {return new Symbol(sym.NUM, Double.parseDouble(yytext()));}
{DELIMITERS} {return new Symbol(sym.DELI, yytext());}
{COMMENT_LINE} { /* ignora */ }
{COMMENT_BLOCK} { /* ignora */ }
{OPERATORS} {return new Symbol(sym.OP, yytext());}


// Qualquer outro caractere
. { (); }

[ \t\r\n]+ { /* ignora espaços, tabs e quebras de linha */ }

// [a-zA-Z]+ { System.out.println("Palavra: " + yytext()); }
// [0-9]+ { System.out.println("Número: " + yytext()); }
// .|\n { /* ignora outros caracteres */ }
