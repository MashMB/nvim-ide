# Makefile for Neovim IDE.
#
# @author Maciej Bedra

nvim = mashmb/nvim:dev
nvim-flutter = mashmb/nvim-flutter:dev
nvim-go = mashmb/nvim-go:dev
nvim-jdk8 = mashmb/nvim-jdk8:dev
nvim-latex = mashmb/nvim-latex:dev
nvim-ojdk11 = mashmb/nvim-ojdk11:dev
nvim-ojdk17 = mashmb/nvim-ojdk17:dev
nvim-python3 = mashmb/nvim-python3:dev
nvim-ts = mashmb/nvim-ts:dev

all-build = build-nvim build-nvim-flutter build-nvim-go build-nvim-jdk8 build-nvim-latex build-nvim-ojdk11 build-nvim-ojdk17 build-nvim-python3 build-nvim-ts
all-push = push-nvim push-nvim-flutter push-nvim-go push-nvim-jdk8 push-nvim-latex push-nvim-ojdk11 push-nvim-ojdk17 push-nvim-python3 push-nvim-ts
all-clean = clean-nvim clean-nvim-flutter clean-nvim-go clean-nvim-jdk8 clean-nvim-latex clean-nvim-ojdk11 clean-nvim-ojdk17 clean-nvim-python3 clean-nvim-ts

all: $(all-build) $(all-push) $(all-clean)

login:
	docker login

build-nvim:
	echo "--- Building $(nvim) image ---"
	cd nvim && docker build -t $(nvim) .

build-nvim-flutter:
	echo "--- Building $(nvim-flutter) image ---"
	cd nvim-flutter && docker build -t $(nvim-flutter) .

build-nvim-go:
	echo "--- Building $(nvim-go) image ---"
	cd nvim-go && docker build -t $(nvim-go) .

build-nvim-jdk8:
	echo "--- Building $(nvim-jdk8) image ---"
	cd nvim-jdk8 && docker build -t $(nvim-jdk8) .

build-nvim-latex:
	echo "--- Building $(nvim-latex) image ---"
	cd nvim-latex && docker build -t $(nvim-latex) .

build-nvim-ojdk11:
	echo "--- Building $(nvim-ojdk11) image ---"
	cd nvim-ojdk11 && docker build -t $(nvim-ojdk11) .

build-nvim-ojdk17:
	echo "--- Building $(nvim-ojdk17) image ---"
	cd nvim-ojdk17 && docker build -t $(nvim-ojdk17) .

build-nvim-python3:
	echo "--- Building $(nvim-python3) image ---"
	cd nvim-python3 && docker build -t $(nvim-python3) .

build-nvim-ts:
	echo "--- Building $(nvim-ts) image ---"
	cd nvim-ts && docker build -t $(nvim-ts) .

push-nvim: login
	echo "--- Pushing $(nvim) image ---"
	docker push $(nvim)

push-nvim-flutter: login
	echo "--- Pushing $(nvim-flutter) image ---"
	docker push $(nvim-flutter)

push-nvim-go: login
	echo "--- Pushing $(nvim-go) image ---"
	docker push $(nvim-go)

push-nvim-jdk8: login
	echo "--- Pushing $(nvim-jdk8) image ---"
	docker push $(nvim-jdk8)

push-nvim-latex: login
	echo "--- Pushing $(nvim-latex) image ---"
	docker push $(nvim-latex)

push-nvim-ojdk11: login
	echo "--- Pushing $(nvim-ojdk11) image ---"
	docker push $(nvim-ojdk11)

push-nvim-ojdk17: login
	echo "--- Pushing $(nvim-ojdk17) image ---"
	docker push $(nvim-ojdk17)

push-nvim-python3: login
	echo "--- Pushing $(nvim-python3) image ---"
	docker push $(nvim-python3)

push-nvim-ts: login
	echo "--- Pushing $(nvim-ts) image ---"
	docker push $(nvim-ts)

clean-nvim:
	echo "--- Removing $(nvim) image ---"
	docker image rm -f $(nvim)

clean-nvim-flutter:
	echo "--- Removing $(nvim-flutter) image ---"
	docker image rm -f $(nvim-flutter)

clean-nvim-go:
	echo "--- Removing $(nvim-go) image ---"
	docker image rm -f $(nvim-go)

clean-nvim-jdk8:
	echo "--- Removing $(nvim-jdk8) image ---"
	docker image rm -f $(nvim-jdk8)

clean-nvim-latex:
	echo "--- Removing $(nvim-latex) image ---"
	docker image rm -f $(nvim-latex)

clean-nvim-ojdk11:
	echo "--- Removing $(nvim-ojdk11) image ---"
	docker image rm -f $(nvim-ojdk11)

clean-nvim-ojdk17:
	echo "--- Removing $(nvim-ojdk17) image ---"
	docker image rm -f $(nvim-ojdk17)

clean-nvim-python3:
	echo "--- Removing $(nvim-python3) image ---"
	docker image rm -f $(nvim-python3)

clean-nvim-ts:
	echo "--- Removing $(nvim-ts) image ---"
	docker image rm -f $(nvim-ts)
