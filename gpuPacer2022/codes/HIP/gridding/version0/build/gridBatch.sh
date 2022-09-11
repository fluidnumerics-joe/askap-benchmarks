#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --partition=gpuq
#SBATCH --time=00:10:00
#SBATCH --account=director2196

module load cuda/11.4.2 gcc/11.1.0
nvcc ../main.cpp ../src/GridderCPU.cpp ../src/GridderGPU.cu ../src/gridKernelGPU.cu ../src/Setup.cpp ../utilities/MaxError.cpp ../utilities/PrintVector.cpp ../utilities/RandomVectorGenerator.cpp -o askapGrid -std=c++17 -Xcompiler -fopenmp
srun ./askapGrid
