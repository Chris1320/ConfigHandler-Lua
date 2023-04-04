LUA_EXE := lua5.4
CODE_DIR := ./src
TESTS_DIR := ./tests
TESTS_SRC_DIR := ${TESTS_DIR}/confighandler

test:
	@echo "[+] Running tests..."
	@if [ $(wildcard ${TESTS_SRC_DIR}) ]; then \
		echo "[+] Removing ${TESTS_SRC_DIR} directory..."; \
		rm -rf ${TESTS_SRC_DIR}; \
	fi

	@# Copy the code to the tests directory.
	@echo "[+] Copying ${CODE_DIR} to ${TESTS_SRC_DIR}..."
	@cp -r "${CODE_DIR}" "${TESTS_SRC_DIR}"

	@# Run the tests.
	@echo "[i] Running tests."
	@${LUA_EXE} "${TESTS_DIR}/main.lua"

clean:
	@echo "[+] Cleaning tests/ directory..."
	@rm -rf "${TESTS_SRC_DIR}"
