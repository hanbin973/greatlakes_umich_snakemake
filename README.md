# Snakemake settings for UM Great Lakes cluster

## Dependencices
Snakemake is a workflow management tool.
It can be install by pip
```
pip install snakemake
```
or mamba
```
mamba install -c bioconda snakemake
```

From Snakemake 8, the cluster feature was deprecated.
They introduced a new feature called `executor` to extend the feature to cloud servers.
To use SLURM, it is convenient to install [`snakemake-executor-plugin-cluster-generic`](https://github.com/snakemake/snakemake-executor-plugin-cluster-generic).

In pip, 
```
pip install snakemake-executor-plugin-cluster-generic
```
In mamba,
```
mamba install -c bioconda snakemake-executor-plugin-cluster-generic
```
## Further reading
- `smk-simple-slurm` [repository](https://github.com/jdblischak/smk-simple-slurm?tab=readme-ov-file)
- [SLURM sbatch documentaion](https://slurm.schedmd.com/sbatch.html)
