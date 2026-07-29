STYLUA ?= stylua
NVIM ?= nvim
LUA_PATHS := lua colors scripts tests

.PHONY: format extras check test specimen

format:
	$(STYLUA) $(LUA_PATHS)
	$(MAKE) extras

extras:
	NVIM_LOG_FILE=/tmp/limei-nvim-extras.log $(NVIM) --clean --headless -u tests/minimal_init.lua \
		-c "lua dofile('scripts/extras.lua').write()" -c "qa!"

check:
	$(STYLUA) --check $(LUA_PATHS)
	NVIM_LOG_FILE=/tmp/limei-nvim-audit.log $(NVIM) --clean --headless -u tests/minimal_init.lua \
		-c "lua dofile('scripts/audit.lua')" -c "qa!"
	NVIM_LOG_FILE=/tmp/limei-nvim-extras.log $(NVIM) --clean --headless -u tests/minimal_init.lua \
		-c "lua dofile('scripts/extras.lua').check()" -c "qa!"

test:
	NVIM_LOG_FILE=/tmp/limei-nvim-smoke.log $(NVIM) --clean --headless -u tests/minimal_init.lua \
		-c "lua dofile('tests/smoke.lua')" -c "qa!"

specimen:
	$(NVIM) --clean -u tests/minimal_init.lua \
		-c "colorscheme limei" -c "lua dofile('scripts/specimen.lua')"
