#!make

.PHONY:

install-flux:
	kubectl apply -f https://github.com/fluxcd/flux2/releases/latest/download/install.yaml

install-strimzi:
	cd strimzi;  kustomize build . | kubectl apply -f -

install-kafka:
	cd minimal-ephemeral;  kustomize build . | kubectl apply -f -

install-kafdrop:
	cd kafdrop;  kustomize build . | kubectl apply -f -

install-redpanda-console:
	cd redpanda-console;  kustomize build . | kubectl apply -f -

destroy:
	cd redpanda-console;  kustomize build . | kubectl --ignore-not-found=true delete -f -
	cd kafdrop;  kustomize build . | kubectl --ignore-not-found=true delete -f -
	cd minimal-ephemeral;  kustomize build . | kubectl --ignore-not-found=true delete -f -
	cd strimzi;  kustomize build . | kubectl --ignore-not-found=true delete -f -

