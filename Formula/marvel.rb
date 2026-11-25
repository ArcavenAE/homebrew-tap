class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261125.104323.292f472"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-104323-292f472/marvel-darwin-arm64"
    sha256 "c04b3f4e9c33530ddd32091200ec7ae9ac7dfd205f0a2ebb14ebd03b4eb8dcea"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-104323-292f472/marvel-darwin-amd64"
    sha256 "c8129a721f5fe304a25c9b920186114c39370471a231bc00326aabe2f6a447b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-104323-292f472/marvel-linux-arm64"
    sha256 "c981d241209b47e2895d2809b5e8e2cd8fd89f85cc2656820348ba103a6bd06b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261125-104323-292f472/marvel-linux-amd64"
    sha256 "7783ca1f3ab553889e14665c654d719265b1595d1288d519f3609cb6910ce701"
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
