---- MODULE temporal ----
EXTENDS Integers, TLC, FiniteSets
Servers == {"s1", "s2"} 

(* --algorithm temporal
variables
    online = Servers;

define
    Invariant == \E s \in Servers: s \in online
    Safety == \E s \in Servers: [](s \in online)
    Liveness == ~[](online = Servers)
end define;

fair process master = "master"
begin
    Change:
        while TRUE do
            with s \in Servers do
                either
                    await s \notin online;
                    online := online \union {s}; 
                or 
                    await s \in online;
                    await Cardinality(online) > 1;
                    online := online \ {s};
                end either;
            end with;
        end while;
end process;
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "60522ef2" /\ chksum(tla) = "be3773c9")
VARIABLE online

(* define statement *)
Invariant == \E s \in Servers: s \in online
Safety == \E s \in Servers: [](s \in online)
Liveness == ~[](online = Servers)


vars == << online >>

ProcSet == {"master"}

Init == (* Global variables *)
        /\ online = Servers

master == \E s \in Servers:
            \/ /\ s \notin online
               /\ online' = (online \union {s})
            \/ /\ s \in online
               /\ Cardinality(online) > 1
               /\ online' = online \ {s}

Next == master

Spec == /\ Init /\ [][Next]_vars
        /\ WF_vars(master)

\* END TRANSLATION 

====
