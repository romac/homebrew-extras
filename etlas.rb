class Etlas < Formula
  desc "Etlas, the build tool and package manager for the Eta programming language"
  homepage "https://eta-lang.org/"
  url "https://cdnverify.eta-lang.org/eta-binaries/etlas-1.5.0.0/binaries/x86_64-osx/etlas"
  sha256 "c48307d1c504086365c8c444058693d9c0e364e44a1c6edd675089d9dc4467f6"

  def install
    bin.install "etlas"
  end

  test do
    system "#{bin}/etlas", "--version"
  end
end
