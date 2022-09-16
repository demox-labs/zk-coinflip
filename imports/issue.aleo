program issue.aleo;

record issue:
    owner as address.private;
    gates as u64.private;
    hashed_issuer_seed as u64.private;
    issuer as address.private;

function issue_challenge:
    input r0 as field.private; // the issuer's hashed seed
    input r1 as address.private; // the acceptor's address

    cast r1 0u64 r0 self.caller into r2 as challenge.record;

    output r2 as challenge.record;