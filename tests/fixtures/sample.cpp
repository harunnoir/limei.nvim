// SPDX-License-Identifier: GPL-2.0-or-later
#include <regex>
#include <string>
#include <vector>

constexpr int default_limit = 42;

class Worker {
public:
  explicit Worker(std::string name) : name_(std::move(name)) {}

  bool run(const std::vector<std::string> &items) const {
    const std::regex pattern{"^task:[0-9]+$"};
    for (const auto &item : items) {
      if (std::regex_match(item, pattern) && default_limit > 0) {
        return true;
      }
    }
    return false;
  }

private:
  std::string name_;
};
