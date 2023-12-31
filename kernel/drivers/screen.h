#define VIDEO_ADDRESS 0xb8002
#define MAX_ROWS 25
#define MAX_COLS 80
#define WHITE_ON_BLACK 0x0f

/* Screen i/o ports */
#define REG_SCREEN_CTRL 0x3d4
#define REG_SCREEN_DATA 0x3d5

/* Public kernel API */
int print_string(const char* message);
void print_char(char rune);
void clear_screen();
void set_cursor(int offset);
int get_offset(int col, int row);
void set_char_at_video_memory(char character, int offset);
