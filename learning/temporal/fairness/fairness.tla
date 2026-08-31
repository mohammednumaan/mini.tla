---- MODULE fairness ----
EXTENDS Integers
CONSTANT NULL

Threads == 1..2
(* --algorithm Threads
variable lock = NULL;
define
    Liveness == 
        \A t \in Threads: <>(lock = t)
end define;

fair+ process thread \in Threads
begin
    GetLock:
        await lock = NULL;
        lock := self;
    ReleaseLock:
        lock := NULL;
    Reset:
        goto GetLock;
end process;
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "9722c8a4" /\ chksum(tla) = "6e4c9445")
VARIABLES pc, lock

(* define statement *)
Liveness ==
    \A t \in Threads: <>(lock = t)


vars == << pc, lock >>

ProcSet == (Threads)

Init == (* Global variables *)
        /\ lock = NULL
        /\ pc = [self \in ProcSet |-> "GetLock"]

GetLock(self) == /\ pc[self] = "GetLock"
                 /\ lock = NULL
                 /\ lock' = self
                 /\ pc' = [pc EXCEPT ![self] = "ReleaseLock"]

ReleaseLock(self) == /\ pc[self] = "ReleaseLock"
                     /\ lock' = NULL
                     /\ pc' = [pc EXCEPT ![self] = "Reset"]

Reset(self) == /\ pc[self] = "Reset"
               /\ pc' = [pc EXCEPT ![self] = "GetLock"]
               /\ lock' = lock

thread(self) == GetLock(self) \/ ReleaseLock(self) \/ Reset(self)

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == /\ \A self \in ProcSet: pc[self] = "Done"
               /\ UNCHANGED vars

Next == (\E self \in Threads: thread(self))
           \/ Terminating

Spec == /\ Init /\ [][Next]_vars
        /\ \A self \in Threads : SF_vars(thread(self))

Termination == <>(\A self \in ProcSet: pc[self] = "Done")

\* END TRANSLATION 

====
