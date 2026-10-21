class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.180343.6191319"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180343-6191319/marvel-darwin-arm64"
    sha256 "6b0db42d1c54cc919084a34ca8882db9af7ee638683954ecc9023dd409e5dcaf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180343-6191319/marvel-darwin-amd64"
    sha256 "2e8734e75852f3c94f33a869c930fb22fceccf7c9c24b7713408bbd28a80920c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180343-6191319/marvel-linux-arm64"
    sha256 "5096262be7ab4f8afd845f8bb9c55b02f5a9db2798fe84a72506f14251426955"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-180343-6191319/marvel-linux-amd64"
    sha256 "3cdfcfd25b19cb0d4803ed1e653d9810ab2f122354fbb847e914c0ae91b8c19c"
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
