kernel void mmult( __global float* matA,  //Read-only input matrix1
                     __global float* matB,  //Read-only input matrix2
                     __global float* matC,  //Output matrix
                     __global int* max             //One dimension of the matrix
)
{
    int dimM = max[0];
    int dimK =  max[1];
    int dimN = max[2];
    int id = get_global_id(0);
    int globalRow = id/dimM;
    int globalCol = id%dimM;
    int k;
    int index,index2,resIndex;
//    for (m=0; m<dimM; m++) {
//        for (n=0; n<dimN; n++) {
            float acc = 0.0f;
            for (k=0; k<dimK; k++) {
                index = globalRow*dimK+k;
                index2 = globalCol*dimK+k;
                acc += matA[index]*matB[index2];
            }
            resIndex = globalRow*dimN +globalCol;
            matC[resIndex] = acc;
//        }
//    }
}