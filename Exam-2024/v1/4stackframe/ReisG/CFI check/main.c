// clang-ifcc.c
#include <stdio.h>

int sum(int x, int y) {
  return x + y;
}

int dbl(int x) {
  return x + x;
}

void call_fn(int (*fn)(int)) {
  printf("Result value: %d\n", (*fn)(42));
}

void erase_type(void *fn) {
  // Поведение не определено, если динамический тип fn не совпадает с int (*)(int).
  call_fn(fn);
}

int main() {
  // При вызове erase_type теряется статическая информация от типе.
  erase_type(sum);
  return 0;
}