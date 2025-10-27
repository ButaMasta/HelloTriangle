CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi
SHELL = /bin/bash

HelloTriangle-Release: main.cpp
	g++ $(CFLAGS) -DNDEBUG -o HelloTriangle main.cpp $(LDFLAGS)

HelloTriangle: main.cpp
	g++ $(CFLAGS) -o HelloTriangle main.cpp $(LDFLAGS)

Shaders:
	glslc shaders/shader.vert -o shaders/vert.spv
	glslc shaders/shader.frag -o shaders/frag.spv

.PHONY: release test clean

test: Shaders HelloTriangle
	./HelloTriangle

release: Shaders HelloTriangle-Release
	./HelloTriangle

clean:
	rm -f HelloTriangle
	rm -f shaders/*.spv