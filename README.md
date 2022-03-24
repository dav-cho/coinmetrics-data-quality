# Coin Metrics Data Quality Engineer

## Python Task

### Objectives

1. Find all available markets for a given exchange (binance).
2. For all available markets in the given exchange, extract all trades from the Timeseries Market Trades endoint that occurred in the last 5 minutes.

### Technologies

| Required | Installation Link                                                        |
| -------- | ------------------------------------------------------------------------ |
| Python 3 | [python.org](https://www.python.org/downloads/)                          |
| Pip      | [pypi.org](https://pip.pypa.io/en/stable/installation/)                  |
| PipEnv   | [pipenv.pypa.io](https://pipenv.pypa.io/en/latest/#install-pipenv-today) |

### Instructions

There are some necessary dependencies that will need to be installed in order for this script to run. The most important of these is **Pipenv** which requires a version of Python 3 and Pip. If you do not have some of these technologies installed on your local machine, I have included links and additional instructions below.

1. Make sure you have installed all the required technologies necessary in order to run this project.

- Check your Python installation:

  > `python --version`

  - If you see an error, or your local version of Python is not a version of Python 3, please use the link in the [Technologies](#Technologies) table and follow the appropriate instructions to install a version of Python 3. Addtionally, you can follow Pipenv's guide to enure your Python and pip installation: [Pipenv guide](https://pipenv.pypa.io/en/latest/install/#make-sure-you-ve-got-python-pip)

- Check your Pip installation:
  > `pip --version`
  - Most versions of Python 3 will come with pip installed. However, if you see an error, pleaes follow the link in the [Technologies](#Technologies) table. Similarly to the last step, you can also go to Pipenv's guide for ensuring your Python and pip installation ([Pipenv guide](https://pipenv.pypa.io/en/latest/install/#make-sure-you-ve-got-python-pip))

2. Install all project dependencies with
   > `pipenv install`

- After you have installed pipenv, in your terminal, change into the directory for this script (directory name is 'python-task').

- Once you are in the proper directory, run the following command:

  > `pipenv install`

  - This will install all necessary project dependencies from the `Pipfile`.

- After pipenv finishes installing the project dependencies, run the following command in order to run the script:
  > `pipenv run python_task.py`
  - As the script is running, the status codes for each page response will be printed to the console.
  - After the api calls, the number of markets with no trades for the given time period will be printed as well as the name of each market.
  - If any discrepancies are found in the sequential order of each trade ID for each market, the missing ID or range of missing IDs will be printed.

### Testing

A test file using Python's native `unittest`module is included as the file named 'test_python_task.py'.

To run these tests simply run the test file in your terminal with the following command:

> `pipenv run test_python_task.py`

## SQL Task

## Bash(zsh) Task

### Technologies

| Required | Installation Link                                 |
| -------- | ------------------------------------------------- |
| Zshell   | [zsh.sourceforge.io](https://zsh.sourceforge.io/) |

### Instructions

The Bash Task was written for Zshell.

In order to run this file, you must have zsh installed on your machine.

If you don't have zsh, the easiest way to install it is with [Homebrew](https://brew.sh/).  
You can follow instructions on the homebrew website or paste this command into your terminal:

> `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Once homebrew is installed you can run `brew install zsh`.

The script takes two parameters:

1. The name of the market i.e. `coinbase-btc-usd-spot`.
2. The time offset in seconds i.e. `120`
   To run the file you can simply change into the directory where the `get_trades.sh` file lives and run the following command:
   > `./get_trades.sh [market] [time offset in seconds]`

Example: `./get_trades.sh coinbase-btc-usd-spot 120`

If you wish to use a wildcard flag such as `binance-*` to get all markets for a given exchange, you will have to wrap the first parameter in quotes: `./get_trades.sh 'binance-*' 120`

If you get an error, you may have to change the permissions for this file and make it executable by running the following command:

> `sudo chmod +x get_trades.sh`

The results of the API call will be printed to the console.  
As a convenience, the script will write results by page to json files in the same directory named `page-[page #].json`
