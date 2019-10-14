#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

  //  char *message = "small/big\n";
  //  if (x > 100 && x < 1000) {
  //      message = "medium";
  //  }

if1:
  if (x <= 100) goto endif;
  if (x >= 1000) goto endif;

  message = "medium";

endif:

    printf("%s", message);
}