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

package() {
  cd "$srcdir"
    install -Dm755 ${pkgname}/{AutoInstall.sh,Auto-PreInstall.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${pkgname}/Auto-PreInstall.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
