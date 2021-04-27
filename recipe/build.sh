
export BOOST_ROOT=$PREFIX
export CMAKE=$BUILD_PREFIX/bin/cmake
export PKG_CONFIG=$BUILD_PREFIX/bin/pkg-config
( \
  meson setup \
  ${MESON_ARGS:---buildtype release --prefix=$PREFIX -Dlibdir=lib} \
  --debug \
  build \
  || ( cat $SRC_DIR/build/meson-logs/meson-log.txt && false ) \
) && ninja -C build install
