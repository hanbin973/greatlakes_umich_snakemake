import jax
import os

from snakemake.script import snakemake

with open(snakemake.output.out_path, "w") as output_file:
    print(os.environ['CONDA_PREFIX'], file=output_file)
    print(jax.devices(), file=output_file)
