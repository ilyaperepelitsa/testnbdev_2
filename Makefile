SRC = $(wildcard ./*.ipynb)

all: testnbdev_2 docs

testnbdev_2: $(SRC)
	nbdev_build_lib
	touch testnbdev_2

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

release: bump dist
	twine upload --repository pypi dist/*

pypi: dist
	twine upload --repository pypi dist/*

bump:
	nbdev_bump_version

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist