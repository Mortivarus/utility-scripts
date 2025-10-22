
# Read conda info for env location. Extract this
str=$(conda info | grep "envs directories")
IFS=':' read -ra parts <<< "$str"

env_directory=${parts[1]}

conda create new comfy python=3.12

conda activate comfy

pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu129

pip install comfy-cli -y

cd $HOME/conda/envs/comfy/lib

git clone https://github.com/comfyanonymous/ComfyUI.git $HOME/conda/envs/comfy/lib/ComfyUI

comfy-cli set-default "$env_directory/comfy/lib/ComfyUI"

pip install -r "$env_directory/comfy/lib/ComfyUI/requirements.txt"
