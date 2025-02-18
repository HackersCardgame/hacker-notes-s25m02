#include <stdio.h>

int lfsr_period(int width, int taps, int show)
{
    int max = 1 << (width - 1), n = max;
    int period = 0, lastbit = 0, adjacent = 1;
    do {
        /* Compute LFSR */
        int bit = n & 1;
        n >>= 1;
        if (bit)
            n ^= taps;

        period++;
        if (show)
            printf("%d", bit);
        if (lastbit && !bit && period < width * 2)
            adjacent = 0;
        lastbit = bit;
    } while (n != max);
    if (show && adjacent)
        printf(" FOUND");
    return period;
}

int main()
{
    for (int width = 2; width <= 12; width++) {
        printf("%d bits:\n", width);
        int max = 1 << width;
        for (int taps = max / 2; taps < max; taps++) {
            int period = lfsr_period(width, taps, 0);
            if (period == max - 1) {
                printf("0x%X: 0", taps);
                lfsr_period(width, taps, 1);
                printf("\n");
            }
        }
    }
    return 0;
}