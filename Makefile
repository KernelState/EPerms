SRC_DIR := src
BUILD_DIR := build
OBJ_DIR := $(BUILD_DIR)/OBJ
BIN_DIR := $(BUILD_DIR)/EPerms
TARGET := my_executable_app

CXX := g++
CXXFLAGS := -O2 -Wall -Wextra -std=c++17 -I$(SRC_DIR)
DEPFLAGS := -MMD -MP
LDFLAGS :=

SOURCES := $(shell find $(SRC_DIR) -name "*.cpp" -o -name "*.cc" -o -name "*.cxx")
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(filter %.cpp, $(SOURCES)))
OBJECTS += $(patsubst $(SRC_DIR)/%.cc, $(OBJ_DIR)/%.o, $(filter %.cc, $(SOURCES)))
OBJECTS += $(patsubst $(SRC_DIR)/%.cxx, $(OBJ_DIR)/%.o, $(filter %.cxx, $(SOURCES)))
DEPENDS := $(patsubst %.o,%.d,$(OBJECTS))

all: $(BIN_DIR)/$(TARGET)

$(BIN_DIR)/$(TARGET): $(OBJECTS)
	@echo "Linking: $@"
	@mkdir -p $(BIN_DIR)
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo "Compiling $<"
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(DEPFLAGS) -c $< -o $@

-include $(DEPENDS)

clean:
	@echo "Cleaning..."
	@rm -rf $(BUILD_DIR)

run: $(BIN_DIR)/$(TARGET)
	@./$(BIN_DIR)/$(TARGET)

debug:
	@$(MAKE) all CXXFLAGS="-g -O0 -Wall -Wextra -std=c++17 -I$(SRC_DIR)"
