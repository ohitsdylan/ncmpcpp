#!/bin/bash

set -x
cd src

DESTDIR="/usr/"
PREFIX="/local/"

SOURCES="$(find . -iname "*.cpp" | tr '\n' ' ')"
OBJECTS="$(echo "$SOURCES" | sed 's/\.cpp/.o/g')"

for src in $SOURCES; do
    g++ -DHAVE_CONFIG_H -I. -I.. -DU_USING_ICU_NAMESPACE=0 -D_DEFAULT_SOURCE \
        -D_XOPEN_SOURCE=600 -I/usr/include -I/usr/include/taglib -g -O2 -flto \
        -ftree-vectorize -ffast-math -std=c++14 -c -o "${src/.cpp/.o}" "$src" &
done

wait

g++ -g -O2 -flto -ftree-vectorize -ffast-math -std=c++14 -o ../ncmpcpp \
    $OBJECTS \
    -lboost_date_time -lboost_filesystem -lboost_locale -lboost_program_options \
    -lboost_regex -lboost_thread -lboost_system -licui18n -licuuc -licudata \
    -lmpdclient -lreadline -lpthread -lncursesw -lfftw3 -lcurl -L/usr/lib -ltag \
    -lz

cd ..

install -Dm755 ncmpcpp ${DESTDIR}${PREFIX}/bin/ncmpcpp
install -Dm755 doc/bindings ${DESTDIR}${PREFIX}/doc/ncmpcpp/bindings
install -Dm755 doc/config ${DESTDIR}${PREFIX}/doc/ncmpcpp/config
install -Dm755 doc/ncmpcpp.1 ${DESTDIR}${PREFIX}/man/man1/ncmpcpp.1
