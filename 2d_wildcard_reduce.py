from snakemake.script import snakemake

with open(snakemake.output.out_path, "w") as output_file:
    for in_path in snakemake.input.in_path:
        print(in_path, file=output_file)
