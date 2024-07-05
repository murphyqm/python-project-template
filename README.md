# The Ultimate Python Project Template

You can create your own version of this repository by clicking the `Use Template` option.

You can set the name of your new repository to your Python project name. See [our webapp](https://package-your-python.streamlit.app/) for details on choosing a package and project name.

The contents of this ReadMe are replicated on the [wiki here](https://github.com/murphyqm/python-project-template/wiki/Copy-of-the-ReadMe-file), so you can delete this and replace it with your own content.

GitHub action workflows are provided in the folder `Example workflows`; these will need to be moved to a `.github/workflows` directory to be used, and will need to be updated to match your Python package name.

## Launch in codespaces

This repository contains a `devcontainer.json` file, which includes details to set up a cloud virtual machine in GitHub codespaces.

Once you launch the codespace from your repository (it will take a while to set up), you will have a view that matches the app VSCode, including a terminal
window at the bottom of the screen, which allows you to interact with the virtual machine.

If you use `pwd` to check the working directory, you will get `/workspaces/YOUR-REPO-NAME`: you are positioned inside the git repository folder. This is essentially
a local clone of the repository on a virtual machine; you will have to use git as your would on your desktop (such as pushing changes to `origin BRANCH-NAME` from the terminal).

Once launched, you can generate a basic project layout following the instructions [here](https://package-your-python.streamlit.app/).

# Step-by-step: use this repository to build a Python package

These steps assume you have already planned your Python project and brainstormed how you are going to meet your requirements, picked a name, created a repository from this template in your account!

1. Launch this dev container in codespaces. Familiarise yourself with the VSCode interface and using git from inside this virtul machine.
2. Install any required conda environments.
3. Create your package folder organisation using [this tool](https://package-your-python.streamlit.app/); check your license and README.md.
4. Write your code and your tests: you can take a test-driven development approach, or write your unit tests and integration tests after your functions.
5. Generate your docstrings (there are a variety of tools installed in your VSCode env to help with this).
6. Run tests using `pytest` (installed in the `packaging-env` for you).
7. Format your code with `black`  (installed in the `packaging-env` for you).
8. Create your documentation with `mkdocs` and host on GitHub pages.
9. Create a basic GitHub Action workflow to test your code.
10. Create a release and use a GitHub action workflow to build your code.

Consider the [DeReLiCT Code](https://derelict.streamlit.app/) principles when designing your project.

# Guidance

Some key commands/directions for building your project are listed here. See further details on the [wiki](https://github.com/murphyqm/python-project-template/wiki).

## Essential linux/bash commands

The virtual machine is running on Ubuntu, a Linux distribution.

```bash
cd # change directory to home
cd /workspaces # return to the /workspaces directory
cd .. # go up a level in the directory structure
ls # list the contents of the current directory
pwd # get the path to the current working directory
```

## Essential git commands

We will use git and a GitHUb remote to track our changes. You can use git in the same way you would from your local machine.

```bash
git status # check on status of current git repo
git branch NAME # create a branch called NAME
git checkout NAME # swap over to the branch called NAME
git add . # stage all changed files for commit, you can replace "." with FILE to add a single file called FILE
git commit # commit the staged files (this will open your text editor to create a commit message)
git push origin NAME # push local commits to the remote branch tracking the branch NAME
```

## Essential conda commands

The devcontainer/codespaces virtual machine comes preloaded with `miniforge`, an open source alternative to anaconda with the fast
libmamba solver available. You use this in the same way you would conda from your local machine. Your codespaces machine
comes with a basic Python packaging environment prebuilt.

```bash
# from terminal/outside a conda env
conda env list # list built environments
conda env create --file PATH/TO/A/FILE # build a conda env from a file
conda env create --file .devcontainer/env-files/mkdocs-env.yml # build a conda env from a file
conda activate ENV-NAME  # activate the environment ENV-NAME

# from inside a conda env (after activating the env)
conda list # lists installed packages in the env
conda env export --no-builds > exported-env.yml # exports all packages in the env
conda env export --from-history  > exported-env.yml # exports the packages that were explicitly installed
```
## Essential pytest hints

Add the following to the `__init__.py` file in your `tests/` directory:

```python
import sys

sys.path.append("src")
```

You can then run `pytest` from the main repo directory.

## Essential GitHub action hints

Under workflows, select "New workflow" and choose the "Python application" option. Change the Python version to suit your application, and modify the triggers so that you can manually run the action:

```yaml
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
  workflow_dispatch:
```

## Essential mkdocs commands

Ensure you are using a conda environment that has mkdocs and the required additional packages installed (you can
install the ready-made `mkdocs-env` by running `conda env create --file .devcontainer/env-files/mkdocs-env.yml` and then
activating it with `conda activate mkdocs`).

The following commands should be run from the main folder of your repository (where your `pyproject.toml` is).
```bash
mkdocs new . # initialise a new mkdocs project
# You can now edit the mkdocs yml file
TZ=UTC mkdocs serve # serve the mkdocs website without time zone errors
# you may need to set up port forwarding to view the website
TZ=UTC mkdocs build # build your docs files in a /site dir
TZ=UTC mkdocs gh-deploy # deploy the website - change settings on your gh repo to allow writing by actions
```

You should edit your `mkdocs.yml` to contain the following plugins so that it can find your docs:

```yaml
site_name: NAME HERE

theme:
  name: "material"

plugins:
- mkdocstrings:
    handlers:
      python:
        paths: [src]  # search packages in the src folder

nav:
  - FILE NAME HERE: index.md
```

If you have added sensible and well-formatted comments and docstrings to your code, you can use the `mkdocstring`
plugin to automatically build your documentation.

Simply include:

```
::: YOUR_PACKAGE_NAME
```

in one of the markdown files included in your docs (for example, `index.md`) to include any docs you have added to your package `__init__.py` file.

To include function-level documentation, just include:

```
::: YOUR_PACKAGE_NAME.MODULE_NAME
```
For more detail on customising your `mkdocs` set-up and on writing good documentation, please see this [fantastic RealPython tutorial](https://realpython.com/python-project-documentation-with-mkdocs/).
___

Please keep the attribution below this divider section. Update the URL in the code snippet below to direct users to installing your package from a release.
___

# To install the package with pip

Create a virtual environment with pip available. From within this env, simply run the `pip install` command with the url of the desired packaged binary:

```bash
python -m pip install https://github.com/murphyqm/swd3-testing-ghcodespaces-demo-repo/releases/download/v0.0.1-alpha.2/hypot-0.0.1.tar.gz
```

You can test that it has installed correctly by running:
bash
```
python -c "import hypot.calc;print(hypot.calc.squared(2))"
```

**This repository was built using the template created by Maeve Murphy Quinlan (c) 2024 under the MIT license. See [here](https://package-your-python.streamlit.app/) for more details.**
