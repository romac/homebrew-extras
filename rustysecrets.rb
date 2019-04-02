class Rustysecrets < Formula
  desc "CLI around the Rust implementation of threshold Shamir's secret sharing"
  homepage "https://github.com/SpinResearch/rustysecrets-cli"
  url "https://github.com/romac/rustysecrets-cli/archive/0.1.0.tar.gz"
  sha256 "e13a51f2d2bb1df0369279c6280930b9e27c82ef312284d2b6376cc3810f05b1"
  head "https://github.com/SpinResearch/rustysecrets-cli.git"

  option "with-completions", "Install bash/zsh/fish completions"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/rustysecrets"

    if build.with? "completions"
      bash_completion.install "target/release/build/rustysecrets-completions/rustysecrets.bash-completion"
      zsh_completion.install "target/release/build/rustysecrets-completions/_rustysecrets"
      fish_completion.install "target/release/build/rustysecrets-completions/rustysecrets.fish"
    end
  end

  test do
    system "#{bin}/rustysecrets", "help"
  end
end

