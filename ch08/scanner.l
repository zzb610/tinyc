%{
#include "token.h"
int cur_line_num{1};
void lex_error(const char* msg, int line);
void init_scanner();
%}

/* Definitions */
INTEGER           ([0-9]+)
UNTERM_STRING     (\"[^\"\n]*)
STRING            (\"[^\"\n]*\")
IDENTIFIER        ([_a-zA-Z][_0-9a-zA-Z]*)
OPERATOR          ([+*-/%=,;!<>(){}])
SINGLE_COMMENT1   ("//"[^\n]*)
SINGLE_COMMENT2   ("#"[^\n]*)

/* rules */
%%
[\n]                {++cur_line_num;}
[ \t\r\a]+          {/* ignore all spaces */}
{SINGLE_COMMENT1}   {/* skip for single line comment */}
{SINGLE_COMMENT2}   {/* skip for single line comment */}

{OPERATOR}          { return yytext[0]; }

"<="                { return T_Le; }
">="                { return T_Ge; }
"=="                { return T_Eq; }
"!="                { return T_Ne; }
"&&"                { return T_And; }
"||"                { return T_Or; }
"void"              { return T_Void; }
"int"               { return T_Int; }
"while"             { return T_While; }
"if"                { return T_If; }
"else"              { return T_Else; }
"return"            { return T_Return; }
"break"             { return T_Break; }
"continue"          { return T_Continue; }
"print"             { return T_Print; }
"readint"           { return T_ReadInt; }

{INTEGER}           { return T_IntConstant; }
{STRING}            { return T_StringConstant; }
{IDENTIFIER}        { return T_Identifier; }

<<EOF>>             { return 0; }

{UNTERM_STRING}     {lex_error("Unterminated string constaant", cur_line_num);}
.                   {lex_error("Unrecognized character", cur_line_num);}
%%

int main(int argc, char* argv[]){
  int token{0};
  init_scanner();
  while(token = yylex()){
    print_token(token);
    puts(yytext);
  }
  return 0;
}

void lex_error(const char* msg, int line){
  printf("\nError at line %-3d: %s\n\n", line, msg);
}

void init_scanner(){
  printf("%-20s%s\n", "TOKEN-TYPE", "TOKEN-VALUE");
  printf("--------------------------------------\n");
}

int yywrap(void){
  return 1;
}
