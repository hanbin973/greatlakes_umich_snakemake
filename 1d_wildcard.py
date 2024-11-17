from snakemake.script import snakemake

with open(snakemake.output.out_path, "w") as output_file:
    print(snakemake.params.one_dim_wildcard, file=output_file)
