# Data Toolkit

Docker compose stack for working on data.

My general workflow goes something like this:

1. Spin up a database
2. Import the raw data
3. Run some queries on the data
4. Run some python/numpy routines on the data
5. Export/visualize the data

For this workflow I have included:

1. A MySQL database for storing the data
2. An adminer for examining the data
3. A Jupyter-Datascience instance for running Python, R and Julia
4. Some custom Python code I hope to expand in the future

The stack uses a data and a notebook directory for importing data and saving your work to the host.

To make sure everything works, run a clean install every time you switch computers/users.

## How to install

You need Docker, bash and sed.

Run `install.sh` to generate the docker compose stack. The defaults are fine.

Start the stack with `docker-compose up`.

## How to use

To access the Jupyter instance, you'll need the token that is printed when the stack starts.

Once inside, you'll see three directories.

- `data` is where your data goes and is mounted to the host
- `presets` includes pre-made notebooks by me and also some python code
- `notebooks` is where your notebooks go and is also mounted to the host

The python code included in the presets directory is installed as a package and can be used by importing from `data_lib`.

To access the database from the host machine, for example when using another DB-management tool, connect to localhost using the chosen database port.

## Be careful

The database is exposed, don't use it on public networks.

This works for me, it might not work for you.