`include "hw1.v"

module demorgan_test ();

	//instantiate device/module under test
	reg A, B; 		// Primary test inputs
	wire nA, nB, nAandnB, AandBinv, AnotB, ABinv;	// Test outputs

	demorgan dut(A, B, nA, nB, nAandnB, AandBinv, AnotB, ABinv); //Module to be tested


	// Run sequence of test stimuli
	initial begin
		$display("A B | ~A ~B | ~A~B | ~(A + B) | ~(AB) | (~A + ~B)");
	A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |    %b  |       %b |     %b |        %b  ", A,B, nA, nB, nAandnB, ABinv, AandBinv, AnotB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
		$display("%b %b |  %b  %b |    %b  |       %b |     %b |        %b  ", A,B, nA, nB, nAandnB, ABinv, AandBinv, AnotB);
    A=1;B=0; #1
		$display("%b %b |  %b  %b |    %b  |       %b |     %b |        %b  ", A,B, nA, nB, nAandnB, ABinv, AandBinv, AnotB);
    A=1;B=1; #1
		$display("%b %b |  %b  %b |    %b  |       %b |     %b |        %b  ", A,B, nA, nB, nAandnB, ABinv, AandBinv, AnotB);
  end
endmodule    // End demorgan_test
