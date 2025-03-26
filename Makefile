BUILD_DIR = build
INSTALL_DIR = debian/tmp/usr/bin
TARGET = exoskeleton

all: build

# Run CMake configuration
configure:
	@mkdir -p $(BUILD_DIR)
	cmake -B $(BUILD_DIR) -S .

# Compile the project
build: configure
	cmake --build $(BUILD_DIR)

# Install the binary into the Debian package directory
install: build
	@mkdir -p $(INSTALL_DIR)
	@cp $(BUILD_DIR)/bin/$(TARGET) $(INSTALL_DIR)/$(TARGET)
	@chmod 0755 $(INSTALL_DIR)/$(TARGET)

# Clean up build artifacts
clean:
	rm -rf $(BUILD_DIR)

deb:
	dpkg-buildpackage -us -uc
	cp ../*.deb /workspace

.PHONY: all configure build install clean
