# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=2.0.1
pkgrel=1
pkgdesc='AutoLinux bootstrap scripts, with optional riced configs for the AutoLinux platform'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog)
makedepends=(git)                 
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  printf "2.0.$(git rev-list --count HEAD)"
}

package() {
  cd "$srcdir"
    install -Dm755 ${pkgname}/{AutoLinux.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${pkgname}/AutoLinux.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
