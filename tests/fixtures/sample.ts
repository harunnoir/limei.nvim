// SPDX-License-Identifier: GPL-2.0-or-later
const DEFAULT_LIMIT = 42;

interface Task {
  name: string;
  complete: boolean;
}

class Worker {
  constructor(readonly name: string) {}

  run(tasks: Task[]): number {
    return tasks.filter((task) => !task.complete && /^task:\d+$/.test(task.name)).length;
  }
}

const count: number = new Worker("limei").run([
  { name: "task:1", complete: false },
]);
const valid: boolean = count < DEFAULT_LIMIT;
