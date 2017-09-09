/*
  Coloque aqui o identificador do grupo e dos seus membros
*/
%{
#include "parser.h" //arquivo automaticamente gerado pelo bison
int line = 1;
%}
%x comment

%%


[ \t]
\n   {++line;}
"//".*

"/*"   {BEGIN(comment);}
<comment>\n  { }
<comment>.
<comment>"*/"  {BEGIN(INITIAL);}
%%

int LineNumber()
{
  return line;
}


