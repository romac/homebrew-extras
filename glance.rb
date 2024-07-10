class Glance < Formula
  desc "A self-hosted dashboard that puts all your feeds in one place"
  homepage "https://github.com/glanceapp/glance/"
  url "https://github.com/glanceapp/glance/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f0c9e3816c6810b06f2db007e12275c7ce0656a5a20b6fde1da064f289e7fe6f"
  license "AGPL-3.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "glance", "-help"
  end
end
