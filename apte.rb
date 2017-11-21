class Apte < Formula
  desc "Algorithm for Proving Trace Equivalence"
  homepage "https://projects.lsv.ens-cachan.fr/APTE/"
  url "https://github.com/romac/APTE/archive/v0.5beta.tar.gz"
  sha256 "54fe9468e2ecb32765206167ee15549fa1543fb04f787a46ddbf0c3079708a1f"
  head "https://github.com/romac/APTE.git"

  depends_on "ocaml" => :build

  def install
    ENV.deparallelize

    system "make"
    bin.install "apte"
  end

  test do
    system "#{bin}/apte" "Example/example_1.txt"
  end
end
