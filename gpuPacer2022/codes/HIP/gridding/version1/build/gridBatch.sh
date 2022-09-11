#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --partition=gpuq
#SBATCH --time=00:10:00
#SBATCH --account=director2196

module load hip/4.3.0
hipcc ../main.cpp ../src/GridderCPU.cpp ../src/GridderGPU.hip ../src/gridKernelGPU.hip ../src/Setup.cpp ../utilities/MaxError.cpp ../utilities/PrintVector.cpp ../utilities/RandomVectorGenerator.cpp -o askapGrid -std=c++14 -Xcompiler -fopenmp
srun ./askapGrid
