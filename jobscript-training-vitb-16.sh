#!/bin/bash
#SBATCH --job-name=training_clip_b16
#SBATCH -p gpupart
#SBATCH -A staff
#SBATCH -t 24:00:00
#SBATCH --gres gpu:1
#SBATCH -N 1
#SBATCH --mem=40G
#SBATCH  --cpus-per-task=8
#SBATCH --output=/nfs/data_todi/jli/Alessio_works/MDIN-clone/training_clip_b16.out
#SBATCH --error=/nfs/data_todi/jli/Alessio_works/MDIN-clone/training_clip_b16.err
#SBATCH --ntasks=1


#call your program here

# Set up the Conda environment
export PATH="/nfs/data_todi/jli/softwares/local/anaconda3/bin:$PATH"
eval "$(conda shell.bash hook)"

# Activate the 'less_alessio' Conda environment
conda activate /nfs/data_todi/jli/softwares/local/anaconda3/envs/less_alessio

trap "trap ' ' TERM INT; kill -TERM 0; wait" TERM INT

cd /nfs/data_todi/jli/Alessio_works/MDIN-clone

bash scripts/train_3dgres.sh

wait