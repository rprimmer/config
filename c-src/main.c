#include <getopt.h>
#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "system-actions.h"
#include "foo.h"

int main(int argc, char **argv) {
    char program[PATH_MAX];
    basename_r(argv[0], program);

#ifdef DEBUG
    setbuf(stdout, NULL); 
    setbuf(stderr, NULL);
    fprintf(stderr, "%s, %d: argc: %d, optind: %d\n", __FILE__, __LINE__, argc, optind);
#endif // DEBUG

    // Handle switches
    int option = 0;
    int option_index = 0;
    static struct option long_options[] = {{"help", no_argument, 0, 'h'},
                                           {"flush", no_argument, 0, 'f'},
                                           {"add", required_argument, 0, 'a'},
                                           {0, 0, 0, 0}};
    while ((option = getopt_long(argc, argv, "hfa:", long_options, &option_index)) != -1) {
        switch (option) {
        case 'h':
            usage(program);
            break;
        case 'f':
            // code
            break;
        case 'a':
            // code 
            break;
        default:
            HANDLE_ERROR("invalid switch provided"); 
        }
    }

#ifdef DEBUG
    fprintf(stderr, "%s, %d: argc: %d, optind: %d\n", __FILE__, __LINE__, argc, optind);
#endif // DEBUG

    // Handle arguments

    // Handle actions
    int retval = 1;

    return ferror(stdout) ? EOF : retval;
} 
