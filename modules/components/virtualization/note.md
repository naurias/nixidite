virt is name space 

# Nvidia container

To add a container that utilizes host's Nvidia GPU enable nvidia container toolkit and run `sudo nvidia-ctk cdi generate` and create the container with 

```bash
distrobox create --name abc --image https://abc.xyz --additional-flage "--device nvidia.com/gpu=all --security-opt=lable=disable"
```

# AMD 

No configuration is need for AMD GPU
