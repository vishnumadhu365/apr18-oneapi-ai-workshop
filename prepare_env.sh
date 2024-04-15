#!/bin/bash

export PIP_CACHE_DIR=/tmp/pip_cache && \
export ENV_NAME='ipex-llm-env' && \
echo "[1/5] Removing old env and kernel" && \
rm -rf $ENV_NAME && \
#jupyter kernelspec uninstall $ENV_NAME -y & \
echo "[2/5] Creating env directory : $ENV_NAME  ...." && \
python -m venv $ENV_NAME && \
source $ENV_NAME/bin/activate && \
echo "[3/5]Installing required packages : IPEX, Torch, IPEX-LLM, LangChain etc. ~ takes few minutes" && \
pip install --upgrade pip --quiet && \
pip install -r requirements.txt --quiet && \
echo "[4/5] Installing Jupyter kernel - $ENV_NAME" && \
python -m ipykernel install --user --name=$ENV_NAME && \
jupyter kernelspec list && \
echo "[5/5] Setup Complete. Check if the new Jupyter kernel '$ENV_NAME' exists"