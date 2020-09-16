#!/bin/bash
count=0
logdir=/store/vsiddharth/baselines/DADS_rebuttal_4

launch() {
    CUDA_VISIBLE_DEVICES=$count python unsupervised_skill_learning/dads_off.py \
	   --flagfile=configs/$1.txt \
	   --logdir=$logdir/$1 &
    export count=$(($count + 1))
}

if [ -e "$logdir" ]; then
    echo "Are you sure you want to remove $logdir?"
    select yn in "Yes" "No"; do
	case $yn in
	    Yes ) rm -rv "$logdir"; break;;
	    No ) exit 1;;
	esac
    done
fi
mkdir "$logdir"

# environment variables
export PYTHONPATH=/home/vsiddharth/research/ant-hrl-maze:$PYTHONPATH
export C_INCLUDE_PATH=/home/vsiddharth/.mujoco/mujoco200/include:/home/vsiddharth/research/dads/.venv/lib/python3.6/site-packages/numpy/core/include
export LD_LIBRARY_PATH=/home/vsiddharth/.mujoco/mujoco200/bin:/usr/lib/nvidia-384

#launch ant
#launch ant_reset_free
launch ant_xy
#launch ant_reset_free_xy
