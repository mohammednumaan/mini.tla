# mini.tla 
mini.tla is a repository for learning TLA+ by specifying and verifying small algorithms. the algorithms implemented here are from [LearnTLA+](https://learntla.com/) (as of now). i do plan to play around with more concurrent algorithms (such as `peterson's`, `lamport's bakery` algorithm and much more).

# algorithms

- [`calculator`](./non-determinism/calculator.tla)
    - explores non-determinism with random arithmetic operations.

- [`queue`](./concurrency/queue/queue.tla)
    - demonstrates a reader-writer pattern with multiple producers and one consumer.

- [`threads`](./concurrency/threads/threads.tla)
    - shows mutual exclusion with a lock protecting a shared counter.

# running the models

each algorithm has an associated `.cfg` configuration file that specifies model parameters and properties to check. you can run the TLC model checker on any algorithm to verify its properties and explore its state space.