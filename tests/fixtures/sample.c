/* SPDX-License-Identifier: GPL-2.0-or-later */
#include <stdbool.h>
#include <stdio.h>

#define DEFAULT_LIMIT 42

typedef struct {
  const char *name;
  bool active;
} Worker;

static int compute(const Worker *worker, int value) {
  if (worker->active && value < DEFAULT_LIMIT) {
    printf("%s:%d\n", worker->name, value);
    return value * 2;
  }
  return 0;
}

int main(void) {
  Worker worker = { "limei", true };
  return compute(&worker, 21);
}
