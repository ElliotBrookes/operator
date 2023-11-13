#define VIDEO_ADDRESS 0xb8002
#define MAX_ROWS 25
#define MAX_COLS 80
// Attrib byte for the default colour scheme
#define WHITE_ON_BLACK 0x0f

// SCREEN DEVICE i/o ports
#define REG_SCREEN_CTRL 0x3D4
#define REG_SCREEN_DATA 0x3D5
#include "ports.h"


void set_cursor(int offset) {
    offset /= 2;
    port_byte_out(REG_SCREEN_CTRL, 14);
    port_byte_out(REG_SCREEN_DATA, (unsigned char) (offset >> 8));
    port_byte_out(REG_SCREEN_CTRL, 15);
    port_byte_out(REG_SCREEN_DATA, (unsigned char) (offset & 0xff ));
}

int get_cursor() {
    port_byte_out(REG_SCREEN_CTRL, 14);
    int offset = port_byte_in(REG_SCREEN_DATA) << 8;
    port_byte_out(REG_SCREEN_CTRL, 15);
    offset += port_byte_in(REG_SCREEN_DATA);
    return offset*2;
}

int get_row_from_offset(int offset) {
    return offset / (MAX_COLS);
}

int get_offset(int col, int row) {
    return 2*(row * MAX_COLS + col);
}

void set_char_at_video_memory(char character, int offset) {
    unsigned char* vidmem = (unsigned char*) VIDEO_ADDRESS;
    vidmem[offset + 1] = character;
    vidmem[offset + 2] = 0x0f;
}

int move_offset_to_new_line(int offset) {
    return get_offset(0, get_row_from_offset(offset)+1);
}

void clear_screen() {
    for (int i = 0; i < (MAX_COLS * MAX_ROWS); ++i) {
        set_char_at_video_memory(0, (i * 2) );
    }
    set_cursor(0);
}

void print_char(char rune) {
    int offset = get_cursor();

    set_char_at_video_memory(rune, offset);
    set_cursor(offset + 2);
}

void print_string(char *message) {
    print_char('f');
    message[0] = 'a';
    message[1] = 'a';
    int c = 0;

    while ( message[c] != 0) {
        print_char(message[c]);
        c++;
    }

    for (int i = 0; message[i] != 0; i++) {
        print_char(message[i]);
    }
}
