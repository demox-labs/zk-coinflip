program complete.aleo;

record complete:
    owner as address.private;
    gates as u64.private;
    issuer_number as u64.private;
    acceptor_number as u64.private;
    issuer as address.private;
    acceptor as address.private;
    winner as address.private;

function complete_challenge:
    input r0 as address.private; // acceptor
    input r1 as u64.private; // aceptor seed
    input r2 as u64.private; // issuer seed
    input r3 as address.private; // winner


    cast r0 0u64 r1 r2 self.caller r0 r0 into r3 as complete.record;
    cast self.caller 0u64 r1 r2 self.caller r0 r0 into r4 as complete.record;

    output r3 as complete.record;
    output r4 as complete.record;