# mini.tla 
mini.tla is a repository for learning TLA+ by specifying and verifying small algorithms. the algorithms implemented here are from [LearnTLA+](https://learntla.com/) (as of now). i do plan to play around with more concurrent algorithms (such as `peterson's`, `lamport's bakery` algorithm and much more).

# basic examples

- [`calculator`](./non-determinism/calculator.tla)
    - non-determinism with random arithmetic operations.

- [`queue`](./concurrency/queue/queue.tla)
    - reader-writer pattern with producers and consumer.

- [`threads`](./concurrency/threads/threads.tla)
    - mutual exclusion with a lock protecting a counter.

# temporal logic

- [`fairness`](./learning/temporal/fairness/fairness.tla)
    - fairness constraints and liveness properties.

- [`safety & liveness`](./learning/temporal/safety_liveness/temporal.tla)
    - safety vs liveness with server online/offline example.

# running the models

each algorithm has an associated `.cfg` configuration file that specifies model parameters and properties to check. you can run the TLC model checker on any algorithm to verify its properties and explore its state space.