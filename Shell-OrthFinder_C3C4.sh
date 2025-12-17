#!/bin/bash --login

########## Define Resources Needed with SBATCH Lines ##########

#SBATCH --time=3:59:00             # limit of wall clock time - how long the job will run (same as -t)
#SBATCH --ntasks=1                  # number of tasks - how many tasks (nodes) that you require (same as -n)
#SBATCH --cpus-per-task=10           # number of CPUs (or cores) per task (same as -c)
#SBATCH --mem=40G                    # memory required per node - amount of memory (in bytes)
#SBATCH --job-name C3C4Plant      # you can give your job a name for easier identification (same as -J)

########## Command Lines to Run ##########
cd /PATH/C3_C4_Plant

module purge
module load OrthoFinder

orthofinder -f RawdataC3C4/

echo "Finished!!"
