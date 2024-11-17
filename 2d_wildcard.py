from snakemake.script import snakemake

with open(snakemake.output.out_path, "w") as output_file:
    print(snakemake.params.wc1 + '_' + snakemake.params.wc2, file=output_file)
