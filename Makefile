USER_NAME?=unknown
help:
	@echo "--- Help ---"
	@echo "make arch USER_NAME:={USER_NAME} - build Arch linux image"
	@echo "make u20 USER_NAME:={USER_NAME} - build Ubuntu 20.04 linux image"
	@echo "make u22 USER_NAME:={USER_NAME} - build Ubuntu 22.04 linux image"
	@echo "------------"

arch:
	docker buildx build --build-arg USER_NAME=${USER_NAME} -t dev_arch -f Dockerfile.arch .

u20:
	docker buildx build --build-arg USER_NAME=${USER_NAME} -t dev_u20 -f Dockerfile.u20 .

u22:
	docker buildx build --build-arg USER_NAME=${USER_NAME} -t dev_u22 -f Dockerfile.u22 .
