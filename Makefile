build:
	mkdir -p files
	cp /Users/joel/curric/assessments/installations/files/gitignore_global files
	cp /Users/joel/curric/assessments/installations/files/zshrc files
	docker build -t joelburton/rithm-setup ../rithm-setup

create:
	docker rm rithm || echo 
	docker create -p 5001:5001 -p 3000:3000 -p 3001:3001 -ith ubuntu --name rithm -v ~/ubuntu:/shared joelburton/rithm-setup

start:
	docker start -i rithm

push:
	docker push joelburton/rithm-setup
