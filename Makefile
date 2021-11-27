start:
	docker start -i rithm

build:
	docker build -t joelburton/rithm-setup ../rithm-setup

create:
	-@docker rm rithm > /dev/null
	docker create -p 5001:5001 -p 3000:3000 -p 3001:3001 -ith ubuntu --name rithm -v ~/ubuntu:/shared joelburton/rithm-setup

all: build create start

push:
	docker push joelburton/rithm-setup
