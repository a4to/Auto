# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=3.0.3
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning scripts, with optional AutoLinuxOS configs.'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog parted)
makedepends=(git)                 
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
    install -Dm755 ${_pkgname}/{autoInstall,autoCleanInstall,autoPart} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${_pkgname}/{autoCleanInstall,autoInstall,autoPart} -t "${pkgdir}/usr/bin"
    install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
