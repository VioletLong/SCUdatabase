#include <iostream>
#include <vector>
#include <memory>
#include "pch.h"
using namespace std;
int  main()
{
	cout << " start testing\n" << endl;
	cout << " MatrixA" << endl;
	scudb::RowMatrix<int>matrixA(2, 3);
	for (int i = 0; i < matrixA.GetRowCount(); ++i)
	{
		for (int j = 0; j < matrixA.GetColumnCount(); ++j)
		{
			matrixA.SetElement(i, j, i * matrixA.GetColumnCount() + j);
		}
	}
	scudb::RowMatrixOperations<int>::Print(matrixA);

	vector<int> src1(6);
	for (int i = 0; i < 6; i++) {
		src1[i] = 1;
	}
	cout << " MatrixB" << endl;
	scudb::RowMatrix<int> matrixB(3, 2);
	matrixB.FillFrom(src1);
	scudb::RowMatrixOperations<int>::Print(matrixB);

	vector<int> src2(4);
	for (int i = 0; i < 4; i++) {
		src2[i] = 8 - 2*i;
	}
	cout << " MatrixC" << endl;
	scudb::RowMatrix<int> matrixC(2, 2);
	matrixC.FillFrom(src2);
	scudb::RowMatrixOperations<int>::Print(matrixC);

	std::vector<int> src3(4);
	for (int i = 0; i < 4; i++) {
		src3[i] = i + 2;
	}
	cout << " MatrixD" << endl;
	scudb::RowMatrix<int> matrixD(2, 2);
	matrixD.FillFrom(src3);
	scudb::RowMatrixOperations<int>::Print(matrixD);

	std::unique_ptr<scudb::RowMatrix<int>> ret1;
	ret1 = scudb::RowMatrixOperations<int>::Add(&matrixC, &matrixD);
	cout << "matrixC + matrixD" << endl;
	scudb::RowMatrixOperations<int>::Print(*ret1);

	std::unique_ptr<scudb::RowMatrix<int>> ret2;
	ret2 = scudb::RowMatrixOperations<int>::Multiply(&matrixA, &matrixB);
	std::cout << "matrixA * matrixB" << std::endl;
	scudb::RowMatrixOperations<int>::Print(*ret2);

	std::unique_ptr<scudb::RowMatrix<int>> ret3;
	ret3 = scudb::RowMatrixOperations<int>::GEMM(&matrixA, &matrixB, &matrixC);
	std::cout << "matrixA * matrixB + matrixC" << std::endl;
	scudb::RowMatrixOperations<int>::Print(*ret3);

	return 0;
}