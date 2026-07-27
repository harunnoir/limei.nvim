// SPDX-License-Identifier: GPL-2.0-or-later
const DEFAULT_LIMIT: usize = 42;

struct Worker {
    name: String,
    active: bool,
}

impl Worker {
    fn run(&self, values: &[usize]) -> usize {
        values
            .iter()
            .filter(|value| self.active && **value < DEFAULT_LIMIT)
            .map(|value| value * 2)
            .sum()
    }
}

fn main() {
    let worker = Worker { name: "limei".into(), active: true };
    println!("{}:{}", worker.name, worker.run(&[1, 2, 3]));
}
