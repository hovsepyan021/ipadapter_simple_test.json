# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-inpaint-cropandstitch@2.1.7
RUN comfy node install --exit-on-fail comfyui_ipadapter_plus@2.0.0

# download models into comfyui
RUN comfy model download --url https://huggingface.co/moiu2998/mymo/blob/3c3093fa083909be34a10714c93874ce5c9dabc4/realisticVisionV60B1_v51VAE.safetensors --relative-path models/vae --filename realisticVisionV60B1_v51VAE.safetensors
RUN comfy model download --url https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8m.pt --relative-path models/checkpoints --filename face_yolov8m.pt
RUN comfy model download --url https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth --relative-path models/checkpoints --filename sam_vit_b_01ec64.pth
RUN comfy model download --url https://huggingface.co/ezioruan/inswapper_128.onnx --relative-path models/checkpoints --filename inswapper_128.onnx
RUN comfy model download --url https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth --relative-path models/checkpoints --filename GFPGANv1.3.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/