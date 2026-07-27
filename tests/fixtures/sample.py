# SPDX-License-Identifier: GPL-2.0-or-later
import re
from dataclasses import dataclass

DEFAULT_LIMIT = 42


@dataclass
class Worker:
    name: str
    active: bool = True

    def run(self, items: list[str]) -> int:
        pattern = re.compile(r"^task:\d+$")
        matches = [item for item in items if self.active and pattern.match(item)]
        return min(len(matches), DEFAULT_LIMIT)


result = Worker("limei").run(["task:1", "skip"])
