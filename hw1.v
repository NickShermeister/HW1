module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B)

  output AandBinv,
  output AnotB,
  output ABinv
);

  wire nA;
  wire nB;
  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB

  // Not (A and B)
  wire andA1;
  and andgate1(andA1, A, B);
  not AandBinv(AandBinv, andA1);

  // ((notA) or (notB))
  or orgate2(AnotB, nA, nB);

  // not(A or B)
  wire AoB;
  or orgate3(AoB, A, B);
  not ABinv(ABinv, AoB);


endmodule
