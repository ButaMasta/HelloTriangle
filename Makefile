CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi
SHELL = /bin/bash

HelloTriangle: main.cpp
	g++ $(CFLAGS) -o HelloTriangle main.cpp $(LDFLAGS)

Shaders:
	glslc shaders/shader.vert -o shaders/vert.spv
	glslc shaders/shader.frag -o shaders/frag.spv

.PHONY: test clean

test: Shaders HelloTriangle
	./HelloTriangle

clean:
	rm -f HelloTriangle
	rm -f shaders/*.spv