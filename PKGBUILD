# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=3.0.1
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
    install -Dm755 ${_pkgname}/{autoInstall,autoCleanInstall,AutoPart} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${_pkgname}/{autoCleanInstall,AutoInstall,AutoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
