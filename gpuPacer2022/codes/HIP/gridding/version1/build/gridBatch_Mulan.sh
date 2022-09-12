#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --sockets-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --partition=workq
#SBATCH --time=00:10:00
#SBATCH --account=pawsey0007

module load rocm/4.5.0
hipcc ../main.cpp ../src/GridderCPU.cpp ../src/GridderGPU.hip ../src/gridKernelGPU.hip ../src/Setup.cpp ../utilities/MaxError.cpp ../utilities/PrintVector.cpp ../utilities/RandomVectorGenerator.cpp -o askapGrid -std=c++14 -fopenmp
srun ./askapGrid
