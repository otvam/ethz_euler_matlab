#!/bin/bash
#
# main bash script for submitting a MATLAB/EULER job:
#     - allocate the ressources
#     - load the MATLAB module
#     - submit the job
#
# to run the script:
#     - execute "chmod +x run_main.sh"
#     - execute "./run_main.sh tag"
#     - the arguement "tag" is passed to the MATLAB code
#
############################################################################

echo "#######################################################"
echo "start"
echo "#######################################################"

# ressource allocation
max_time="1:00" # maximum time (hour:second") allocated for the job (max 120:00 / large value implies low priority)
n_core=4 # number of core (max 24 / large value implies low priority)
memory="2048" # memory allocation (in MB) per core (max 16384 / large value implies low priority)
scratch="500" # disk space (in MB) for temporary data

# name of the MATLAB function (input argument: n_core and tag)
fct_name="run_main"

# get the job name (${1} is the tag provided as argument)
tag="${1}"

# get the log filename
log="${tag}.txt"

# load MATLAB R2019a
module load new matlab/R2019a

# submit the job
bsub -J $tag -o $log -n $n_core -W $max_time -N -R "rusage[mem=$memory,scratch=$scratch]" matlab -nodisplay -singleCompThread -r "$fct_name($n_core, '$tag')"

# display the current queue
bbjobs

echo "#######################################################"
echo "end"
echo "#######################################################"

exit 0
