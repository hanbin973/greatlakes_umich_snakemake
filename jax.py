import jax
import os

with open("results/output.txt", "w") as output_file:
    print(os.environ['CONDA_PREFIX'], file=output_file)
    print(jax.devices(), file=output_file)
