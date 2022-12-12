#!/bin/bash -l
#SBATCH -J swift_impact_05715_0468_5e4_9d7_055_1node28cpu
#SBATCH --partition=cpu
#SBATCH --nodes 1
#SBATCH --exclusive  
#SBATCH --output=out.txt
#SBATCH --error=err.txt
#SBATCH --mail-user=@bristol.ac.uk
#SBATCH --mail-type=ALL 
#SBATCH --time=0-01:00:00


module purge
module restore swift_intel2020_parmetis


echo "Number of tasks: " $SLURM_NTASKS
echo "Number of nodes: " $SLURM_JOB_NUM_NODES
echo "cpu per task: " $SLURM_CPUS_PER_TASK
echo "Number of threads per node: " $SLURM_JOB_CPUS_PER_NODE
echo "mpi ranks:" $SLURM_STEP_NUM_TASKS

time ./swift -a -s -G -t 28 parameters_impact.yml 2>&1 | tee -a ./logput_${SLURM_JOB_NAME}.txt

