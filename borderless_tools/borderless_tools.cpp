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

dllx void borderless_tools_syscommand(double _sc) {
	SendMessage(hwnd, WM_SYSCOMMAND, (int)_sc, 0);
}

///~
#define display_measure_all_name_len 32
struct borderless_tools_get_monitors_t {
	struct { int left, top, width, height; } monitor;
	struct { int left, top, width, height; } workspace;
	int flags;
};
static gml_ovector<borderless_tools_get_monitors_t> borderless_tools_get_monitors_acc;

BOOL CALLBACK display_measure_all_cb(HMONITOR m, HDC hdc, LPRECT rect, LPARAM p) {
	MONITORINFO inf;
	inf.cbSize = sizeof(inf);
	if (!GetMonitorInfoA(m, &inf)) return TRUE;
	static_assert(display_measure_all_name_len == CCHDEVICENAME, "display_measure_all_name_len doesn't match CCHDEVICENAME");
	borderless_tools_get_monitors_t out;
	out.monitor.left   = inf.rcMonitor.left;
	out.monitor.width  = inf.rcMonitor.right - inf.rcMonitor.left;
	out.monitor.top    = inf.rcMonitor.top;
	out.monitor.height = inf.rcMonitor.bottom - inf.rcMonitor.top;
	out.workspace.left   = inf.rcWork.left;
	out.workspace.width  = inf.rcWork.right - inf.rcWork.left;
	out.workspace.top    = inf.rcWork.top;
	out.workspace.height = inf.rcWork.bottom - inf.rcWork.top;
	out.flags = inf.dwFlags;
	borderless_tools_get_monitors_acc.push_back(out);
	return TRUE;
}

dllx double borderless_tools_get_monitors_1() {
	borderless_tools_get_monitors_acc.clear();
	EnumDisplayMonitors(NULL, NULL, display_measure_all_cb, 0);
	return borderless_tools_get_monitors_acc.size();
}
dllx double borderless_tools_get_monitors_2(borderless_tools_get_monitors_t* out) {
	auto n = borderless_tools_get_monitors_acc.size();
	for (auto i = 0; i < n; i++) out[i] = borderless_tools_get_monitors_acc.data()[i];
	return 1;
}

dllx double borderless_tools_double_click_time() {
	return GetDoubleClickTime();
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved) {
	switch (fdwReason) {
		case DLL_PROCESS_ATTACH:
			hwnd = 0;
			borderless_tools_get_monitors_acc.init();
			break;
		case DLL_PROCESS_DETACH:
			borderless_tools_get_monitors_acc.cleanup();
			break;
	}
	return TRUE;
}