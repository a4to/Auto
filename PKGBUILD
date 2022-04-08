# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=3.0.6
pkgrel=1
pkgdesc='ArchLinux bootstrap and partitioning scripts, with optional AutoLinux configs.'
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
install="auto.install"
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
    install -Dm644 ${_pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
