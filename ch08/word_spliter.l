%{
#define TWORD 1
int n_chars{0}, n_words{0}, n_lines{0};
%}

WORD ([^ \n\r\t\a]+)

%%
\n       {++n_chars; ++n_lines;}
{WORD}   {++n_words; n_chars += yyleng; return TWORD;}
<<EOF>>  {return 0;}
.        {++n_chars; }
%%

int main(){
  int token_type{0};
  while(token_type = yylex()){
    printf("WORD: %s \n", yytext);
  }
  printf("n_words: %d, n_chars: %d, n_lines: %d\n", n_words, n_chars, n_lines);
}

int yywrap(){
  return 1;
}