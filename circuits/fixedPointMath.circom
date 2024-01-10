pragma circom 2.1.6;

include "circomlib/poseidon.circom";
include "circomlib/mux2.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template Mul(){
    signal input x[2];
    signal input y[2];
    signal output out[2];
    signal num;

   // assert ( x[1] < 21888242871839275222246405745257275088548364400416034343698204186575808495617);
    //assert( y[1] < 21888242871839275222246405745257275088548364400416034343698204186575808495617);
    
    component mux = Mux2(); 
    var scale = 1000000;
    num <== x[1]*y[1];
    log(num);
    //assert ( num < 21888242871839275222246405745257275088548364400416034343698204186575808495617 );
    out[1] <== num/scale;
    log(out[1]);
    mux.c[0] <== 0;
    mux.c[1] <== 1;
    mux.c[2] <== 1;
    mux.c[3] <== 0;

    mux.s[0] <== x[0];
    mux.s[1] <== y[0];
    
    out[0] <== mux.out;
    
}

component main = Mul();

/* INPUT = {
    "x": [0,2122],
    "y": [1,2331]
} */