#include "drivers/screen.h"

void main() {
    clear_screen();
    const char *testString = "test_string"; // This doesnt point to the correct string literal, no idea why
                                            // When dereferencing it returns a 0 value???
    print_char(testString[1]);
    print_char(testString[2]);
    print_string(testString);
}

