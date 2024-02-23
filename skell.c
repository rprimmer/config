#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SERROR(text, arg) (void) fprintf (stderr, text, arg)
#define swap(a, b) tmp = (a), (a) = (b), (b) = tmp

// process: sub in code to do something useful
void process(FILE *in, char *fname)
{
    register int c;

    fprintf(stdout, "%s\n", fname);
    while ((c = getc(in)) != EOF)
        putc(c, stdout);

    return;
} // process() 


int main(int argc, char **argv) // parse arguments, handle options 
{
    FILE   *fp;
    int    c, xstatus = 0;
    char   *prog = argv[0];
    extern int optind;
    extern char *optarg;
    void process(FILE *in, char *fname);
    
    while ((c = getopt(argc, argv, "x")) != EOF)
        switch(c) 
        {
            case 'x':
                break;
            default:
                SERROR("usage: %s -x [file]\n", prog);
                exit(1);
        } /* switch(c) */
    
    if (optind >= argc)
        process(stdin, "<stdin>");
    else
        for (; optind < argc; optind++) 
        {
            if (!strcmp(argv[optind], "-"))
                process(stdin, "<stdin>");
            else 
            {
                if ((fp = fopen(argv[optind], "r")) == NULL) 
                {
                    SERROR("Error opening file %s\n", argv[optind]);
                    perror(argv[optind]);
                    xstatus++;
                    continue;
                }
                process(fp, argv[optind]);
                (void) fclose(fp);
            }
        } /* for(; optind) */
    
    return ferror(stdout) ? EOF : xstatus;

} /* main() */
