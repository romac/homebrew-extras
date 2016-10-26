
class Loc < Formula
  desc "loc is a tool for counting lines of code written in Rust"
  homepage "https://github.com/cgag/loc/"
  url "https://github.com/cgag/loc/releases/download/v0.3.2/loc-v0.3.2-x86_64-apple-darwin.tar.gz"
  version "0.3.2"
  sha256 "d0ec117bba1d432f5ea3c394910b6a7c13d713d482d4354bd6678eb8b2ff9075"

  def install
    bin.install "loc"
  end

  test do
    system "#{bin}/loc ."
  end
end
