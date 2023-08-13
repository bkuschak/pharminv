CFLAGS="-L$$HOME/.local/lib -I$$HOME/.local/include"
CFLAGS+="-I/opt/local/include"

all:
	python3 -m pip install pharminv
clean:
	rm -rf build/ dist/ harminv/charminv.c harminv/charminv.so harminv/*pyc

rebuild: clean
	CFLAGS=$(CFLAGS) python setup.py build_ext --inplace

release: clean
	CFLAGS=$(CFLAGS) python setup.py build_ext sdist

test: clean
	CFLAGS=$(CFLAGS) python setup.py build_ext sdist upload -r test

upload: clean
	CFLAGS=$(CFLAGS) python setup.py build_ext sdist upload -r pypi
