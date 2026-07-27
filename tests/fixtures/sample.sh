#!/usr/bin/env sh
# SPDX-License-Identifier: GPL-2.0-or-later

readonly DEFAULT_LIMIT=42

run_tasks() {
  name=$1
  shift
  count=0
  for item in "$@"; do
    if printf '%s' "$item" | grep -Eq '^task:[0-9]+$'; then
      count=$((count + 1))
    fi
  done
  printf '%s:%d/%d\n' "$name" "$count" "$DEFAULT_LIMIT"
}

run_tasks "limei" "task:1" "skip"
