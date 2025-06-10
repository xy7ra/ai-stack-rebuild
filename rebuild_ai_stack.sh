#!/bin/bash
set -eux

### CONFIG ###
VENV_DIR="$HOME/ai_stack_env/venv"
STACK_DIR="$HOME/ai_stack"
MODEL_DIR="$HOME/models"

echo "🚨 Nuking broken or outdated environments"
rm -rf "$VENV_DIR"
rm -rf "$STACK_DIR/llama.cpp"
rm -rf "$STACK_DIR/llama-cpp-python"

echo "📦 Installing system dependencies"
sudo apt update && sudo apt install -y \
  python3.10 python3.10-venv python3.10-dev \
  build-essential cmake git curl unzip \
  libopenblas-dev libomp-dev

echo "🐍 Creating new Python venv"
python3.10 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"
pip install --upgrade pip

echo "📚 Installing AI packages"
pip install openai faiss-cpu numpy pandas tqdm

echo "🧠 Cloning llama-cpp-python (with submodules)"
mkdir -p "$STACK_DIR" && cd "$STACK_DIR"
git clone --recurse-submodules https://github.com/abetlen/llama-cpp-python
cd llama-cpp-python
git submodule update --init --recursive

echo "🔧 Building llama-cpp-python with OpenBLAS"
CMAKE_ARGS="-DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=OpenBLAS" pip install -e .

echo "📁 Creating model directory"
mkdir -p "$MODEL_DIR"
echo "⚠️  Drop your .gguf models in: $MODEL_DIR"

echo "✅ AI stack rebuild complete"
echo "👉 Activate with: source $VENV_DIR/bin/activate"
