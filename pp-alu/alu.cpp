#include <iostream>
#include "blogic.h"
using namespace std;

int alu(int f0, int f1, int inva, int ena, int enb, int carryin, int a, int b)
{
	//x stores the output and y stores the carry out. I have simply converted the figure 3.19 of Page 167 into C++ codes.
	int x = bor( // Twenty One, output
		band( // First
			band( // Fifth
				bxor( // Seventh
					band( // Ninth
						a,
						ena
						),
					inva
					),
				band( // Eighth
					b,
					enb
					)
				),
			band( // Sixth
				bnot(f0), // Tenth
				bnot(f1) // Eleventh
				)
			),
		band( // Second
			bor( //Twelveth
				bxor( // Seventh
					band( // Ninth
						a,
						ena
						),
					inva
					),
				band( // Eighth
					b,
					enb
					)
				),
			band( //Thirteen
				bnot(f0), //Fourteen
				f1
				)
			),
		band( //Third
			bnot( //Fifteenth
				band( // Eighth
					b,
					enb
					)
				),
			band( //Sixteenth
				bnot(f1), //Sevteenth
				f0
				)
			),
		band( //Fourth
			bxor( //Eighteen
				carryin,
				bxor( //Nineteen
					bxor( // Seven
						band( // Ninth
							a,
							ena
							),
						inva
						),
					band( // Eighth
						b,
						enb
						)
					)
				),
			band( //Twentieth
				f0,
				f1
				)
			)
		); //The value of x stored depending upon the above function
	int y = bor( //Twenty two
	 	band( //Twenty Three
	 		carryin,
 			bxor( //Nineteen
				bxor( // Seven
					band( // Nine
						a,
						ena
						),
					inva
					),
				band( // Eight
					b,
					enb
					)
				),
 			band( //Twenty
				f0,
				f1
				)
	 		),
	 	band( //Twenty Four
	 		band( //Twenty
				f0,
				f1
				),
	 		bxor( // Seven
				band( // Nine
					a,
					ena
					),
				inva
				),
	 		band( // Eight
				b,
				enb
				)
	 		)
	 	); //Value of Y is determined based on the above function
	//Based on the values of x and y we return the values from the function
	if (x == 0 & y == 0)
		return 0;
	if (x == 0 & y == 1)
		return 1;
	if (x == 1 & y == 0)
		return 2;
	if (x == 1 & y == 1)
		return 3;

}

void print_call(int f0, int f1, int inva, int ena, int enb, int carryin, int a, int b)
{
	cout << "alu(" << f0 << ", " << f1 << ", " << inva << ", " << ena << ", " << enb << ", " << carryin << ", " << a << ", " << b << ") --> " << alu(f0, f1, inva, ena, enb, carryin, a, b) << endl;
}

void print_section(int f0, int f1, int inva, int ena, int enb)
{
	cout << endl;
	cout << "F0=" << f0 << ", F1=" << f1 << ", INVA=" << inva << ", ENA=" << ena << ", ENB=" << enb << endl;
	print_call(f0, f1, inva, ena, enb, 0, 0, 0);
	print_call(f0, f1, inva, ena, enb, 0, 0, 1);
	print_call(f0, f1, inva, ena, enb, 0, 1, 0);
	print_call(f0, f1, inva, ena, enb, 0, 1, 1);
	print_call(f0, f1, inva, ena, enb, 1, 0, 0);
	print_call(f0, f1, inva, ena, enb, 1, 0, 1);
	print_call(f0, f1, inva, ena, enb, 1, 1, 0);
	print_call(f0, f1, inva, ena, enb, 1, 1, 1);
}

main()
{
	print_section(0, 0, 0, 0, 0); //Prints as per the output in alu.C.out
	print_section(0, 0, 0, 0, 1);
	print_section(0, 0, 0, 1, 0);
	print_section(0, 0, 0, 1, 1);
	print_section(0, 0, 1, 0, 0);
	print_section(0, 0, 1, 0, 1);
	print_section(0, 0, 1, 1, 0);
	print_section(0, 0, 1, 1, 1);
	print_section(0, 1, 0, 0, 0);
	print_section(0, 1, 0, 0, 1);
	print_section(0, 1, 0, 1, 0);
	print_section(0, 1, 0, 1, 1);
	print_section(0, 1, 1, 0, 0);
	print_section(0, 1, 1, 0, 1);
	print_section(0, 1, 1, 1, 0);
	print_section(0, 1, 1, 1, 1);
	print_section(1, 0, 0, 0, 0);
	print_section(1, 0, 0, 0, 1);
	print_section(1, 0, 0, 1, 0);
	print_section(1, 0, 0, 1, 1);
	print_section(1, 0, 1, 0, 0);
	print_section(1, 0, 1, 0, 1);
	print_section(1, 0, 1, 1, 0);
	print_section(1, 0, 1, 1, 1);
	print_section(1, 1, 0, 0, 0);
	print_section(1, 1, 0, 0, 1);
	print_section(1, 1, 0, 1, 0);
	print_section(1, 1, 0, 1, 1);
	print_section(1, 1, 1, 0, 0);
	print_section(1, 1, 1, 0, 1);
	print_section(1, 1, 1, 1, 0);
	print_section(1, 1, 1, 1, 1);
}