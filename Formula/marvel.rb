class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.023636.de34787"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023636-de34787/marvel-darwin-arm64"
    sha256 "d7bb76101a22633de01180ba716c2ddb51c7ead8ade92e9c171ed5773b0b2323"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023636-de34787/marvel-darwin-amd64"
    sha256 "c615bd80c0f740cb50c81b9e9965a7f6449e350d97e15e125bd2aaab0f8c574c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023636-de34787/marvel-linux-arm64"
    sha256 "d86e0efa5f6587ac1aa53a3c1d0b4b1e1d4b82f4014e600a94196c3f1831309f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-023636-de34787/marvel-linux-amd64"
    sha256 "eff0ba4fb0789235d8570909ef364f28cbed36794180986871aad6ff469a7056"
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
