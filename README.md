# uv-Global
A very small uv wrapper that lets you manage and use "globally" installed uv-projects as if they were conda environments

# How does it work?
Creates a uv-projects in the envs-dir which can then be activated and managed through using uvg

## Basic Commands

|Command              |Effect |
|---------------------|--------|
|uvg activate \<env>  | Activates given environment |
|uvg deactivate \<enc>| Deactivates currently active enrionment |
|uvg list             | Lists environments |
|uvg \<command>       | Gets passed thorugh to uv which acts on currently active environment |

# Installation
Obviously needs [uv](https://docs.astral.sh/uv/) installed.
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Then run 
```
./install.sh
```
which appends a source command for this directory to your .bashrc in home.
