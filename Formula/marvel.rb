class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.163439.b0a6d67"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-163439-b0a6d67/marvel-darwin-arm64"
    sha256 "15428d4505de319eee039ffd2e00708954e377f681ca7518cc6f095a0b929054"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-163439-b0a6d67/marvel-darwin-amd64"
    sha256 "5bc6047f61af70b482cdfa4bde47bfe0e1dcd78741c936e5a1661bda82237362"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-163439-b0a6d67/marvel-linux-arm64"
    sha256 "67857a8c610b86349d39cc5876275992215e606dbf4f6fb82261b6511e53ab7d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-163439-b0a6d67/marvel-linux-amd64"
    sha256 "ddbd352dd4c4309a0d1a0b03975cbd7f00b0c03f88f35f982134581d229340ba"
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
