# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=2.1.1
pkgrel=1
pkgdesc='AutoLinux bootstrap scripts, with optional riced configs for the AutoLinux platform'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog parted)
makedepends=(git)                 
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
    install -Dm755 ${_pkgname}/{AutoInstall,Auto-PreInstall} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${_pkgname}/{Auto-PreInstall,AutoInstall} -t "${pkgdir}/usr/bin"
    install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
