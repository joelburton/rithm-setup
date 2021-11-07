.PHONY: rithm

rithm-setup:
        mkdir files
	cp /Users/joel/curric/assessments/installations/files/gitignore_global files
	cp /Users/joel/curric/assessments/installations/files/zshrc files
	docker build -t joelburton/rithm-setup ../rithm
	docker rm rithm || echo 
	docker push joelburton/rithm-setup
	docker create -p 3000:3000 -p 3001:3001 -ith ubuntu --name rithm -v ~/ubuntu:/shared joelburton/rithm-setup

rithm:
	docker start -i rithm
