#include <stdio.h>

int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

if1:
    if (x <= 46340) goto else1;
    printf("square too big for 32 bits\n");
    goto endif;
else1:
    y = x * x;
    printf("%d\n", y);
endif:

}