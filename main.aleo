import issue.aleo;
import accept.aleo;
import complete.aleo;

// The 'coinflip.aleo' program.
program coinflip.aleo;

interface coin_seeds:
    issuer_seed as u64;
    acceptor_seed as u64;

function issue_challenge:
    input r0 as u64.private; // issuer's seed, should be a random u64
    input r1 as address.private; // the acceptor's address

    hash.psd8 r0 into r2; // turn the issuer seed into a field

    call issue.aleo/issue_challenge r2 r1 into r3;

    output r3 as issue.aleo/issue.record;

function accept_challenge:
    input r0 as u64.private; // the acceptor's seed, should be a random u64
    input r1 as issue.aleo/issue.record; // the issue record that was issued to the acceptor

    call accept.aleo/accept_challenge r1.issuer r1.hashed_issuer_seed r0 into r2;

    output r2 as accept.aleo/accept.record;

function complete_challenge:
    input r0 as u64.private; // original issuer's seed
    input r1 as accept.aleo/accept.record;

    hash.psd8 r0 into r2; // hash the original issuer seed
    assert.eq r2 r1.hashed_issuer_seed; // make sure the issuer doesn't change numbers here

    cast r0 r1.acceptor_seed into r3 as coin_seeds;

    hash.psd8 r3 into r4; // hash the issuer seed | acceptor seed into a field

    call complete.aleo/complete_challenge r1.acceptor r1.acceptor_seed r0 into r3 r4;

    output r3 as complete.aleo/complete.record;
    output r4 as complete.aleo/complete.record;