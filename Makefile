#!make

.PHONY: install-flux
install-flux:
	kubectl apply -f https://github.com/fluxcd/flux2/releases/latest/download/install.yaml

.PHONY: install-strimzi
install-strimzi:
	cd strimzi;  kustomize build . | kubectl apply -f -

.PHONY: install-kafka
install-kafka:
	cd minimal-ephemeral;  kustomize build . | kubectl apply -f -

.PHONY: install-kafdrop
install-kafdrop:
	cd kafdrop;  kustomize build . | kubectl apply -f -

.PHONY: install-redpanda-console
install-redpanda-console:
	cd redpanda-console;  kustomize build . | kubectl apply -f -

.PHONY: destroy
destroy:
	cd redpanda-console;  kustomize build . | kubectl --ignore-not-found=true delete -f -
	cd kafdrop;  kustomize build . | kubectl --ignore-not-found=true delete -f -
	cd minimal-ephemeral;  kustomize build . | kubectl --ignore-not-found=true delete -f -
	cd strimzi;  kustomize build . | kubectl --ignore-not-found=true delete -f -

