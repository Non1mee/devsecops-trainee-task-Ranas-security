# Dangers of Executing Random Docker Images

* Images can contain malware, whether that's crypto-miners, ransomware, or backdoor exploits.
* Certain images are based on older base images, which have known insecurities that can lead to severe exploitation.
* Containers run with root access have too much power. Escaping a single container with root access can lead to total control of your computer.
* Malicious images have access to your home directory, which means that they can access your SSH keys, passwords, and cookies.
* Supply-chain attack: even images with a good reputation can be bad. Kitone attackers even use popular and well-regarded images to kick off supply chain attacks.
* Many images are unmaintained and have known vulnerabilities.
* Many images have no local copies of crucial dependencies and will download them at runtime, which can be a security risk.
* Many images exfiltrate data or call home.
## Risk Mitigations
* Only pull from trusted publishers and official images on Docker Hub.
* Always run containers with a non-root user.
* Always avoid using --privileged and avoid mounting sensitive directories.
* Use trivy to scan images and be mindful of using high-severity images: trivy image --severity HIGH,CRITICAL
* Prefer rootless options, such as Podman and Docker.
* Use a VM or sandboxing solution like gVisor or Firecracker for images that you are especially suspicious of.
* Prefer signed Docker images for which you can verify the signature using Cosign or Notary.
* Always keep your host's operating system and Docker's daemon updated.

Running containers can be extremely detrimental, but the risks can be mitigated to a large degree, even if the risk can never be fully mitigated.


