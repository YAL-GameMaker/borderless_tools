#define borderless_tools_init
show_message("")
borderless_tools_init_raw(window_handle());

#define borderless_tools_get_monitors
/// (?out_list)->
var _list = argument_count > 0 ? argument[0] : undefined;
var _count = borderless_tools_get_monitors_1();
var _buf = borderless_tools_prepare_buffer(_count * (4*4 + 4*4 + 4));
if (!borderless_tools_get_monitors_2(buffer_get_address(_buf))) return array_create(0);
var _array;
var _use_array = _list == undefined;
if (_use_array) _array = array_create(_count);
buffer_seek(_buf, buffer_seek_start, 0);
for (var _ind = 0; _ind < _count; _ind++) {
    var _item, _mntr, _work;
    if (_use_array) {
        _mntr = array_create(4);
        _work = array_create(4);
        _item = [_mntr, _work, 0];
        _array[_ind] = _item;
    } else {
        _item = _list[|_ind];
        if (_item == undefined) {
            _mntr = array_create(4);
            _work = array_create(4);
            _item = [_mntr, _work, 0];
            _list[|_ind] = _item;
        } else {
            _mntr = _item[0];
            _work = _item[1];
        }
    }
    _mntr[@0] = buffer_read(_buf, buffer_s32);
    _mntr[@1] = buffer_read(_buf, buffer_s32);
    _mntr[@2] = buffer_read(_buf, buffer_s32);
    _mntr[@3] = buffer_read(_buf, buffer_s32);
    
    _work[@0] = buffer_read(_buf, buffer_s32);
    _work[@1] = buffer_read(_buf, buffer_s32);
    _work[@2] = buffer_read(_buf, buffer_s32);
    _work[@3] = buffer_read(_buf, buffer_s32);
    
    _item[@2] = buffer_read(_buf, buffer_s32);
}
return _use_array ? _array : _count;

#define borderless_tools_prepare_buffer
/// (size:int)->buffer~
var _size = argument0;
gml_pragma("global", "global.__borderless_tools_buffer = undefined");
var _buf = global.__borderless_tools_buffer;
if (_buf == undefined) {
    _buf = buffer_create(_size, buffer_grow, 1);
    global.__borderless_tools_buffer = _buf;
} else if (buffer_get_size(_buf) < _size) {
    buffer_resize(_buf, _size);
}
buffer_seek(_buf, buffer_seek_start, 0);
return _buf;

#define borderless_tools_buffer_read_chars
/// (buffer:buffer, len:int)->string~
var _buf = argument0, _len = argument1;
gml_pragma("global", "global.__ggpo_string_buffer = undefined");
var _tmp = global.__ggpo_string_buffer;
if (_tmp == undefined) {
    _tmp = buffer_create(_len + 1, buffer_grow, 1);
    global.__ggpo_string_buffer = _tmp;
} else if (buffer_get_size(_tmp) <= _len) {
    buffer_resize(_tmp, _len + 1);
}
buffer_copy(_buf, buffer_tell(_buf), _len, _tmp, 0);
buffer_seek(_buf, buffer_seek_relative, _len);
buffer_poke(_tmp, _len, buffer_u8, 0);
buffer_seek(_tmp, buffer_seek_start, 0);
return buffer_read(_tmp, buffer_string);
