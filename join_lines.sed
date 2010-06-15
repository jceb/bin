#!/bin/sed -nf
b checkline

: print
{
    p;
    d;
}

: checkline
{
    s/ *\\ *$/ /;
    t appendline;
    T print;
}

: appendline
{
    h;
    n;
    s/^ *//;
    x;
    G;
    s/\n//;

    /\\ *$/ b checkline;
    b print
}

