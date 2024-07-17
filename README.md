# "Fake VM" Factory

This repo helps you launch a number of easily accessible environments:
- containers (burstable low resources usage)
- systemd enabled (just like a normal VM)
- Web SSH console

## How to deploy

- Create a VM
    - Choose the right size. I recommend 0,3 vCPU to 0,5 vCPU + 0,6 to 1,2 GB per environment.
- Open ports from 8001 to (8000 + number of environment)
- Install podman & install podman-compose
    - You can use `./install.sh` on Debian-based systems
- Launch with `./deploy.sh [number of environment to deploy]`
- Access environments on `http://[my-public-ip]:8001`, `http://[my-public-ip]:8002`, `http://[my-public-ip]:8003`...

## To do list for the future:
- [ ] Some sort of authentication