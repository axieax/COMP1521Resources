#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

//
// Split a string 's' into pieces by any one of a set of separators.
//
// Returns an array of strings, with the last element being `NULL';
// The array itself, and the strings, are allocated with `malloc(3)';
// the provided `free_token' function can deallocate this.
//
static char **tokenize(char *s, char *separators, char *special_chars)
{
    size_t n_tokens = 0;
    // malloc array guaranteed to be big enough
    char **tokens = malloc((strlen(s) + 1) * sizeof *tokens);

    while (*s != '\0')
    {
        // We are pointing at zero or more of any of the separators.
        // Skip leading instances of the separators.
        s += strspn(s, separators);

        // Now, `s' points at one or more characters we want to keep.
        // The number of non-separator characters is the token length.
        //
        // Trailing separators after the last token mean that, at this
        // point, we are looking at the end of the string, so:
        if (*s == '\0')
        {
            break;
        }

        size_t token_length = strcspn(s, separators);
        size_t token_length_without_special_chars = strcspn(s, special_chars);
        if (token_length_without_special_chars == 0)
        {
            token_length_without_special_chars = 1;
        }
        if (token_length_without_special_chars < token_length)
        {
            token_length = token_length_without_special_chars;
        }
        char *token = strndup(s, token_length);
        assert(token != NULL);
        s += token_length;

        // Add this token.
        tokens[n_tokens] = token;
        n_tokens++;
    }

    tokens[n_tokens] = NULL;
    // shrink array to correct size
    tokens = realloc(tokens, (n_tokens + 1) * sizeof *tokens);

    return tokens;
}

int main(int argc, char **argv)
{
    if (argc != 4)
    {
        puts("Usage: <s> <seperators> <special_chars>");
        return EXIT_FAILURE;
    }

    char **result = tokenize(argv[1], argv[2], argv[3]);

    printf("Tokenised Strings:\n");
    for (char **s = result; *s != NULL; s++)
    {
        printf("\"%s\"\n", *s);
    }

    return EXIT_SUCCESS;
}