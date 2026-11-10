#include <stdio.h>

volatile unsigned long long result = 0;

int main(void) {
    for (unsigned long long i = 0; i < 500000000ULL; i++) {
        result += i % 7;
    }

    printf("Result = %llu\n", result);
    return 0;
}
