# coinflip.aleo

## Build Guide

To compile this Aleo program, run:
```bash
aleo build
```


Remaining problem:
At the end of the coinflip, we will have a hashed combination of issuer and acceptor seeds as a field. Normally, when determing the winner of a coin flip, we would take the integer mod 2 and pick 0 or 1 to be the winner. How do we do something similar with a field?
