class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.235114.28c3e98"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235114-28c3e98/marvel-darwin-arm64"
    sha256 "c505093f40beaaef17dca5c2b860fe1087e7d2cc6465d028e580d95aa77bc26c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235114-28c3e98/marvel-darwin-amd64"
    sha256 "216e288a45993d87450f8cfbd48090aab8d350b06ee68b28070c87b5fb5bf4f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235114-28c3e98/marvel-linux-arm64"
    sha256 "f060939bd59814c90d2cd35ace34338319aaa023f388e72a16532baa235068a5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-235114-28c3e98/marvel-linux-amd64"
    sha256 "74fbdf537e0da29370b6d2468a7ac1a4843a72e8136f0976a1df67ac3ea210b1"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
