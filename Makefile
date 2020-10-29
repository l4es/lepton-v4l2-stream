CC     := gcc
CXX    := g++
LIBS   := $(shell pkg-config --libs --cflags glib-2.0 gstreamer-1.0) -lpthread -lboost_system
CFLAGS := -O2 -Wall -fno-omit-frame-pointer \
	$(shell pkg-config --cflags glib-2.0 gstreamer-1.0)

lepton_v4l2_stream: lepton_v4l2_stream.cpp websocket.o
	"$(CXX)" $(CFLAGS) $^ $(LIBS) -o $@

websocket.o: websocket.cpp websocket.h
	"$(CXX)" -c $(CFLAGS) $^

