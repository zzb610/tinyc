#ifndef TOKEN_H
#define TOKEN_H

#include <stdio.h>

// token 的编号原则为：
// 单字符运算符的 token 编号就是其字符的数值
// 其他类型的 token 则从 256 开始编号。

typedef enum {
  T_Le = 256,
  T_Ge,
  T_Eq,
  T_Ne,
  T_And,
  T_Or,
  T_IntConstant,
  T_StringConstant,
  T_Identifier,
  T_Void,
  T_Int,
  T_While,
  T_If,
  T_Else,
  T_Return,
  T_Break,
  T_Continue,
  T_Print,
  T_ReadInt
} TokenType;

static void print_token(int token) {
  static const char *token_strs[] = {
      "T_Le",         "T_Ge",    "T_Eq",          "T_Ne",
      "T_And",        "T_Or",    "T_IntConstant", "T_StringConstant",
      "T_Identifier", "T_Void",  "T_Int",         "T_While",
      "T_If",         "T_Else",  "T_Return",      "T_Break",
      "T_Continue",   "T_Print", "T_ReadInt"};

  if (token < 256) {
    printf("%-20c", token);
  } else {
    printf("%-20s", token_strs[token - 256]);
  }
}

#endif /* TOKEN_H */
