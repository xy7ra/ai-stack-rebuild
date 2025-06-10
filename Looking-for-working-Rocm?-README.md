# ✅ Working ROCm AI Stack – DO NOT DELETE

This system was successfully rebuilt on **2025-06-09** using `/scripts/rebuild_ai_stack.sh`.

## 🛠️ Environment Summary
- Python venv: `/home/xy7ra/ai_stack_env/venv`
- Models: `/home/xy7ra/models/`
- llama-cpp-python + llama.cpp cloned and built from source (with submodules)
- Python packages: `faiss-cpu`, `numpy`, `pandas`, `tqdm`, `openai`, etc.

## 💡 Notes
- `llama.cpp` submodule includes `kompute`
- All packages are built/installed for ROCm & Python 3.10
- Uses OpenBLAS via `CMAKE_ARGS` during build

## 🧠 Remember
If something breaks, rerun:
```bash
/scripts/rebuild_ai_stack.sh
