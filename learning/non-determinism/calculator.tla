---- MODULE calculator ----
EXTENDS Integers, TLC
CONSTANT NumInputs, Target

Digits == 0..9
(* --algorithm calculator
variables
    i = 0;
    res = 0;

define
    Invariant == res # Target
end define;

begin
    Calculator:
        while i < NumInputs do
            with x \in Digits do
                either
                    res := res + x
                or
                    res := res - x
                or 
                    res := res * x
                end either;
            end with;
            i := i + 1;
        end while;
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "767ab43e" /\ chksum(tla) = "5c4a1b8f")
VARIABLES pc, i, res

(* define statement *)
Invariant == res # Target


vars == << pc, i, res >>

Init == (* Global variables *)
        /\ i = 0
        /\ res = 0
        /\ pc = "Calculator"

Calculator == /\ pc = "Calculator"
              /\ IF i < NumInputs
                    THEN /\ \E x \in Digits:
                              \/ /\ res' = res + x
                              \/ /\ res' = res - x
                              \/ /\ res' = res * x
                         /\ i' = i + 1
                         /\ pc' = "Calculator"
                    ELSE /\ pc' = "Done"
                         /\ UNCHANGED << i, res >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Calculator
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 
====
