/// @author YellowAfterlife

#include "stdafx.h"

template<class T>
class gml_ovector {
private:
	T* _data;
	int32_t _size;
	int32_t _capacity;
public:
	void init(int32_t capacity = 4) {
		trace("Howdy");
		_capacity = capacity;
		_data = (T*)malloc(sizeof(T) * capacity);
		_size = 0;
	}
	void cleanup() {
		if (_data) {
			free(_data);
			_data = nullptr;
		}
	}
	void clear() { _size = 0; }
	T* data() { return _data; }
	int32_t size() { return _size; }
	T operator[](int index) const { return _data[index]; }
	T& operator[](int index) { return _data[index]; }
	void push_back(T value) {
		if (_size >= _capacity) {
			_capacity *= 2;
			_data = (T*)realloc(_data, _capacity);
		}
		_data[_size++] = value;
	}
};

static HWND hwnd;

dllx void borderless_tools_init_raw(void* _hwnd) {
	hwnd = (HWND)_hwnd;
}

///
dllx void window_close() {
	SendMessage(hwnd, WM_SYSCOMMAND, SC_CLOSE, 0);
}

///
dllx void window_minimize() {
	SendMessage(hwnd, WM_SYSCOMMAND, SC_MINIMIZE, 0);
}

///
dllx void window_maximize() {
	SendMessage(hwnd, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
}

///
dllx void window_restore() {
	SendMessage(hwnd, WM_SYSCOMMAND, SC_RESTORE, 0);
}

///~
#define display_measure_all_name_len 32
struct display_measure_all_t {
	struct { int left, top, width, height; } monitor;
	struct { int left, top, width, height; } workspace;
	int flags;
};
static gml_ovector<display_measure_all_t> display_measure_all_acc;

BOOL CALLBACK display_measure_all_cb(HMONITOR m, HDC hdc, LPRECT rect, LPARAM p) {
	MONITORINFO inf;
	inf.cbSize = sizeof(inf);
	if (!GetMonitorInfoA(m, &inf)) return TRUE;
	static_assert(display_measure_all_name_len == CCHDEVICENAME, "display_measure_all_name_len doesn't match CCHDEVICENAME");
	display_measure_all_t out;
	out.monitor.left   = inf.rcMonitor.left;
	out.monitor.width  = inf.rcMonitor.right - inf.rcMonitor.left;
	out.monitor.top    = inf.rcMonitor.top;
	out.monitor.height = inf.rcMonitor.bottom - inf.rcMonitor.top;
	out.workspace.left   = inf.rcWork.left;
	out.workspace.width  = inf.rcWork.right - inf.rcWork.left;
	out.workspace.top    = inf.rcWork.top;
	out.workspace.height = inf.rcWork.bottom - inf.rcWork.top;
	out.flags = inf.dwFlags;
	display_measure_all_acc.push_back(out);
	return TRUE;
}

dllx double display_measure_all_1() {
	display_measure_all_acc.clear();
	EnumDisplayMonitors(NULL, NULL, display_measure_all_cb, 0);
	return display_measure_all_acc.size();
}
dllx double display_measure_all_2(display_measure_all_t* out) {
	auto n = display_measure_all_acc.size();
	for (auto i = 0u; i < n; i++) out[i] = display_measure_all_acc.data()[i];
	return 1;
}

dllx double mouse_get_winapi_double_click_time() {
	return GetDoubleClickTime();
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved) {
	switch (fdwReason) {
		case DLL_PROCESS_ATTACH:
			hwnd = 0;
			display_measure_all_acc.init();
			break;
		case DLL_PROCESS_DETACH:
			display_measure_all_acc.cleanup();
			break;
	}
	return TRUE;
}