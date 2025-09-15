#include <stdio.h>
#include <math.h>

#include "main.h"

typedef struct {
    int field1;
    float field2;
} MyStruct;

int main() {

    float result[200] = {0};

    square_root_iterator(result, 200);

    for (int i = 0; i < 200; i++) {
        printf("Square root of %d is approximately %.5f\n", i, result[i]);
    }

    return 0;
}

void square_root_iterator(float* results, int size) {
    for (int i = 0; i < size; i++) {
        results[i] = sqrtf((float)i);
    }
}
