# FlowerShop challenge

From my understanding this is a "coin change problem" and over a longer period of time I would aim to optimize the code. It utilizes the solution using a coin change algorithm and then maps the results to the flower bundles. One would want to do this in one go rather than a two step process.

A full scale app would allow user input, menu screen and so on but how large one wants to grow scope can go indefinitely so I kept this simple - load the input to show the required output. It is expected that the input quantity is correctly chosen for the right bundles as no user behavior is accommodated.

All tests pass and a rake task can be run to view the output in the terminal.

Given different inputs e.g. 15 Roses, will give expected output

## Input

```
10 R12
15 L09
13 T58
```

## Expected output

```
10 R12 $12.99
    1 x 10 $12.99
15 L09 $41.90
    1 x 9 $24.95
    1 x 6 $16.95
13 T58 $25.85
    2 x 5 $9.95
    1 x 3 $5.95
```

## Requirements

- ruby 2.4.1

## Run instructions

To setup

```
bundle install
```

To run for review

```
rake run
```

For testing

```
bundle exec guard
```
