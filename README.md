# Hello World python skeleton 

This project contains all the resources and code required to:

1. Build and unit test a basic "Hello World!" fire app.
2. Report the code coverage of the testing
3. Build supporting documentation for the app and an example API specification

## Dependencies

1. Python
2. GNU Make (usually installed with dev tools on a linux machine). The project was built and tested with `GNU Make 4.3`

Software versions tested with

- `python` - 3.7.2

The solution will build and configure its own virtual environment so no preparatory work required. The Makefile macros take care of all this.

## Folder Structure

``` text
.
├── app
│   ├── docs
│   │   ├── api-specification
│   │   └── source
│   │       ├── _static
│   │       └── _templates
│   ├── src
│   └── test
├── config
│   ├── apache
│   └── wsgi
└── ops
    ├── docker
    ├── kubernetes
    └── terraform

```

## Files of note

- `/app/src/main.py` The actual executable fire application
- `/app/docs/source/*.rst` Documentation skeleton for the project
- `/app/docs/api-specification/helloworld.yaml` OpenAPI specification for an example HelloWorld API
- `/app/test/test_*` Test files for unit testing the source code 
- `/app/*requirements.txt` Python dependency files for the app, test and documentation
- `.coveragerc` rules for coverage report for unit tests
- `Makefile` The brains of the operation, all the automation macros to build, test and deploy the solution.

## Order of Execution

1. `make unittest` - runs the unit test framework
2. `make coverage` - runs a coverage report for unit testing and outputs to terminal
3. `make changelog` - produces a new changelog file for the documentation
4. `make html-docs` - Will produce a set of documentation of the code and the API spec that can be deployed to a support portal during CI/CD

## Makefile Macros

The Makefile is self documenting so just run `make` and it will provide the list of available macros

- `make changelog`                      generate a new changelog
- `make ci`                             unit tests and coverage report in one
- `make clean`                          clean everything up
- `make coverage`                       generate a coverage report for the unit tests
- `make docs-requirements`              Install python dependencies
- `make html-docs`                      Build html documentation
- `make requirements`                   Install python dependencies
- `make unittest`                       run the unit tests for the app
- `make virtual-env`                    Creates a virtual environment for the python dependencies

## Cleaning up

To clean the environment after review `make clean` will remove the all build resources and any temporary files (virtual env, etc) from the local machine

## TODO

- Add in cleanup of pycache folders
