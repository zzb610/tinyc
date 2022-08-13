void SYS_PRINT(char *string, int len);


#define BUFLEN 1024

int PRINT(char *fmt, ...) {
  int *args = (int *)&fmt;
  char buf[BUFLEN];
  char *p1 = fmt, *p2 = buf + BUFLEN;
  int len = -1, argc = 1;
  while (*(p1++))
    ;
  // back to front
  do {
    --p1;
    if (*p1 == '%' && *(p1 + 1) == 'd') { // 扫描到%d
      ++p2;
      --len;
      ++argc;

      int num = *(++args), negative = 0;
      if (num < 0) {
        negative = 1;
        num = -num;
      }

      do {
        *(--p2) = num % 10 + '0';
        ++len;
        num /= 10;
      } while (num);

      if (negative) {
        *(--p2) = '-';
        ++len;
      }
    } else { // 扫描到普通字符，直接拷贝
      *(--p2) = *p1;
      ++len;
    }
  } while (p1 != fmt);

  SYS_PRINT(p2, len);
  return argc; /// 保存在eax中
}

void SYS_PRINT(char *string, int len) {
  __asm__(".intel_syntax noprefix\n\
      push eax\n\
      push ebx\n\
      push ecx\n\
      push edx\n\
      \n\
      mov eax, 4\n\
      mov ebx, 1\n\
      mov ecx, [ebp+4*2]\n\
      mov edx, [ebp+4*3]\n\
      int 0x80\n\
      \n\
      pop edx\n\
      pop ecx\n\
      pop ebx\n\
      pop eax\n\
    .att_syntax");
}


int STRLEN(char *s);
int SYS_READ(char *buf, int len);

int READINT(char *prompt) {
  char buf[BUFLEN], *p = buf, *p_end;
  SYS_PRINT(prompt, STRLEN(prompt));
  int len = SYS_READ(buf, BUFLEN - 1);
  int value = 0, negative = 0;

  p_end = buf + len + 1;
  while (p != p_end) {
    if (*p == ' ' || *p == '\t') {
      ++p;
    } else {
      break;
      ;
    }
  }

  if (p != p_end && *p == '-') {
    negative = 1;
    ++p;
  }

  while (p != p_end) {
    if (*p <= '9' && *p >= '0') {
      value = value * 10 + *p - '0';
      *p++;
    } else {
      break;
    }
  }

  if (negative) {
    value = -value;
  }

  return value;
}

int STRLEN(char *s) {
  int i = 0;
  while (*s++) {
    i++;
  }
  return i;
}



int SYS_READ(char* buf, int len){
  __asm__(
    ".intel_syntax noprefix\n\
    push ebx\n\
    push ecx\n\
    push edx\n\
    \n\
    mov eax, 3\n\
    mov ebx, 2\n\
    mov ecx, [ebp+4*2]\n\
    mov edx, [ebp+4*3]\n\
    int 0x80\n\
    \n\
    pop edx\n\
    pop ecx\n\
    pop ebx\n\
    .att_syntax"
  );
}
