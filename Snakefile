rule all:
	input:
		"results/output.txt"
	
rule example_rule:
	output:
		"results/output.txt"
	script:
		"jax.py"	
