#include "foo.h"
#include "system-actions.h"

void usage(const char *program) {
    printf("Usage: %s [OPTIONS] <ARGUMENTS>\n\n", program);
    printf("Options:\n");
    printf("  -h, --help        Display this help message and exit\n");
    printf("  -r, --repeats     Show repeated non-ASCII chars in brackets\n");
    printf("  -n, --newline     Do not filter newline characters\n"); 
    printf("  -o, --octal       Display non-ASCII characters in octal instead of hex\n\n");
    printf("Arguments:\n");
    printf("  filename(s)       filename(s) to display\n");
    printf("  -                 streams from stdin\n");
    printf("  no argument       equivalent to -, streams from stdin\n\n");
    printf("Examples:\n");
    printf("  %s\n", program);
    printf("  %s -\n", program);
    printf("  %s MyBinaryFile\n", program);
    printf("  %s File1 MyBinaryFile2 File3\n\n", program);
    // printf("Restrictions:\n");
    // printf("  None.\n\n");
    // printf("Notes:\n");
    // printf("  None.\n");
    exit(EXIT_SUCCESS);
} // usage()

// void foo()
