/* Adding BigNums easier way */
void addBigNums(BigNum bnA, BigNum bnB, BigNum *res)
{
    int i = 0;
    int carry = 0;
    int nb;

    if (bnA.nbytes > bnB.nbytes)
    {
        nb = bnA.nbytes;
    }
    else
    {
        nb = bnB.nbytes;
    }

    // make sure the result is big enough to hold the sum.
    // calls helper function that reallocates the bigNum. Modularise your code!
    growBigNum(res, nb);

    for (i = 0; i < nb; i++)
    {
        int sum = carry; 

        if (i < bnA.nbytes)
        {
            sum += bnA.bytes[i] - '0';
        }

        if (i < bnB.nbytes)
        {
            sum += bnB.bytes[i] - '0';
        }

        res->bytes[i] = (sum % 10) + '0';
        carry = sum / 10;
    }

    if (carry)
    {
        if (i == nb)
        {
            growBigNum(res, nb + 1);
        }

        res->bytes[i] = '1';
    }
}