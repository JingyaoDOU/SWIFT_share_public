#!/bin/bash -l
#SBATCH -J swift_impact_05715_0468_65e5_9d7_055_2node56cpu_parmetis
#SBATCH --partition=cpu
#SBATCH --tasks-per-node=2
#SBATCH -N 2
#SBATCH --output=out.txt
#SBATCH --error=err.txt
#SBATCH --mail-user=@bristol.ac.uk
#SBATCH --mail-type=ALL 
#SBATCH --time=0-20:00:00
#SBATCH --contiguous
#SBATCH --exclusive   


module purge
module restore swift_intel2020_parmetis
module load 

echo "Number of tasks: " $SLURM_NTASKS
echo "Number of nodes: " $SLURM_JOB_NUM_NODES
echo "cpu per task: " $SLURM_CPUS_PER_TASK
echo "Number of threads per node: " $SLURM_JOB_CPUS_PER_NODE
echo "mpi ranks:" $SLURM_STEP_NUM_TASKS

cat multi_node_script.sh >> ./output_${SLURM_JOB_NAME}.log
cat parameters_impact.yml >> ./output_${SLURM_JOB_NAME}.log

time mpirun -np 4 ./swift_mpi_parmetis_intel2020 -a -s -G -t 14 parameters_impact.yml 2>&1 | tee -a ./output_${SLURM_JOB_NAME}.log

