// SPDX-License-Identifier: GPL-2.0-or-later
const DEFAULT_LIMIT = 42;
const taskPattern = /^task:\d+$/;

class Worker {
  constructor(name) {
    this.name = name;
    this.active = true;
  }

  run(items) {
    return items
      .filter((item) => this.active && taskPattern.test(item))
      .slice(0, DEFAULT_LIMIT);
  }
}

const result = new Worker("limei").run(["task:1", "skip"]);
