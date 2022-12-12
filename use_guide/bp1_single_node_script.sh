#!/bin/bash -l
#SBATCH -J swift_imapct
#SBATCH --partition=compute
#SBATCH --cpus-per-task=24
#SBATCH --tasks-per-node=1
#SBATCH --nodes 1
#SBATCH --exclusive
#SBATCH --output=out.txt
#SBATCH --error=err.txt
#SBATCH --time=3-00:00:00

# Add below command if you are submitting from login node
#SCRATCH=/mnt/storage/scratch/$USER/bench1node/$SLURM_JOB_NAME
#[ -d SCRATCH ] || mkdir -p $SCRATCH
#cd ${SCRATCH}
#cp $SLURM_SUBMIT_DIR/good.sh .
#cp ~/swift_impact/* ${SCRATCH}

module purge
module restore swift_intel2020_basic
module load system/slurm/21.08.0
module list

which icc
which mpirun

echo "Number of tasks: " $SLURM_NTASKS
echo "Number of nodes: " $SLURM_JOB_NUM_NODES
echo "cpu per task: " $SLURM_CPUS_PER_TASK
echo "Number of threads per node: " $SLURM_JOB_CPUS_PER_NODE
echo "mpi ranks:" $SLURM_STEP_NUM_TASKS

cat bp1_single_node_script.sh >> ./logput_${SLURM_JOB_NAME}.txt
cat parameters_impact.yml >> ./logput_${SLURM_JOB_NAME}.txt

time ./swift -a -s -G -t 24 parameters_impact.yml 2>&1 | tee -a ./logput_${SLURM_JOB_NAME}.txt

