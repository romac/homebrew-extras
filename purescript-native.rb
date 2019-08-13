class PurescriptNative < Formula
  desc "A native compiler backend for PureScript (via C++ or Golang)"
  homepage "http://purescript.org"
  url "https://github.com/andyarvanitis/purescript-native/releases/download/2019-08-12/macos-2019-08-12.zip"
  sha256 "73b95874f978261a8d2a8a75ca6c5212de280cad9bbf77121d444ad2b164f3be"

  def install
    bin.install "pscpp"
    bin.install "psgo"
  end

  test do
    system "#{bin}/pscpp", "--version"
  end
end
