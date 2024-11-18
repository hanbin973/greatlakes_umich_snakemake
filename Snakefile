# snakemake --dag | dot -Tsvg > dag.svg

one_dim_pattern = "pattern_example/{one_dim_wildcard}.txt"
one_dim_wildcards = ["1", "2", "3", "4"]
one_dim_outs = expand(one_dim_pattern,
			   one_dim_wildcard = one_dim_wildcards)

two_dim_pattern = "pattern_example_2d/{wc1}_{wc2}.txt"
wcs1 = ["a", "b", "c", "d"]
wcs2 = ["1", "2", "3", "4"]
two_dim_outs = expand(two_dim_pattern,
					  wc1 = wcs1,
					  wc2 = wcs2)

two_dim_reduce_pattern = "pattern_example_2d_reduce/{wc1}.txt"
two_dim_reduce_outs = expand(two_dim_reduce_pattern,
							 wc1= wcs1)


rule all:
	input:
		"jax_check/output.txt",
		one_dim_outs,
		two_dim_reduce_outs
	
rule jax_device_check:
	output:
		out_path="jax_check/output.txt"
	script:
		"jax.py"	

rule one_dim_wildcard_check:
	output:
		out_path = one_dim_pattern
	params:
		one_dim_wildcard = "{one_dim_wildcard}"
	script:
		"1d_wildcard.py"

	# https://snakemake.readthedocs.io/en/stable/project_info/faq.html#i-don-t-want-expand-to-use-every-wildcard-what-can-i-do
rule two_dim_wildcard_reduce:
	input:
		in_path = expand(two_dim_pattern,
				wc2 = wcs2,
				allow_missing=True)
	output:
		out_path = two_dim_reduce_pattern
	script:
		"2d_wildcard_reduce.py"
	group:
		"reduce"

rule two_dim_wildcard:
	output:
		out_path = two_dim_pattern
	params:
		wc1 = "{wc1}",
		wc2 = "{wc2}"
	script:
		"2d_wildcard.py"
	group:
		"reduce"



