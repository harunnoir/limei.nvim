STYLUA ?= stylua
NVIM ?= nvim
LUA_PATHS := lua colors scripts tests

.PHONY: format check test specimen

format:
	$(STYLUA) $(LUA_PATHS)

check:
	$(STYLUA) --check $(LUA_PATHS)
	NVIM_LOG_FILE=/tmp/limei-nvim-audit.log $(NVIM) --clean --headless -u tests/minimal_init.lua \
		-c "lua dofile('scripts/audit.lua')" -c "qa!"

test:
	NVIM_LOG_FILE=/tmp/limei-nvim-smoke.log $(NVIM) --clean --headless -u tests/minimal_init.lua \
		-c "lua dofile('tests/smoke.lua')" -c "qa!"

specimen:
	$(NVIM) --clean -u tests/minimal_init.lua \
		-c "colorscheme limei" -c "lua dofile('scripts/specimen.lua')"
