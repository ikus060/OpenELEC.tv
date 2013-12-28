################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libIDL"
PKG_VERSION="0.8.14"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.gnome.org"
PKG_URL="http://ftp.gnome.org/pub/gnome/sources/libIDL/0.8/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS="glib"
PKG_BUILD_DEPENDS_HOST="toolchain glib:host"
PKG_BUILD_DEPENDS_TARGET="toolchain glib"
PKG_PRIORITY="optional"
PKG_SECTION="other"
PKG_SHORTDESC="libidl: Library for creating trees of CORBA IDL files"
PKG_LONGDESC="libIDL is a library for creating trees of CORBA Interface Definition Language (IDL) files."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_HOST="libIDL_cv_long_long_format=ll"
PKG_CONFIGURE_OPTS_TARGET="libIDL_cv_long_long_format=ll"

post_makeinstall_host() {
  sed -e "s:pkg-config :PKG_CONFIG_PATH=$HOST_PKG_CONFIG_PATH $PKG_CONFIG :" -i libIDL-config-2
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}