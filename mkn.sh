

@if [ ! -d "./b" ]; then
	git clone https://github.com/boostorg/boost -b master b --recursive
	cd b
	./bootstrap.sh
	./b2 headers
fi