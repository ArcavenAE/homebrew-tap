class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.222739.3b15508"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222739-3b15508/marvel-darwin-arm64"
    sha256 "5afbcdb97960c366cac2a78f873975b5f35f22cdd43b046968a397af97fafc1f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222739-3b15508/marvel-darwin-amd64"
    sha256 "1a01a39c63046d8a941508cc22853f8f0f68aad814040c739d2481a087aa1667"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222739-3b15508/marvel-linux-arm64"
    sha256 "f17def306b2fdaecb8d040fece0ece639e36685f6eb912d6a8f214daf1962ca1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222739-3b15508/marvel-linux-amd64"
    sha256 "4f51387a1adeaa26bbd876ddd8514d3fb44377b2cba0de9a12ea0d9ea69ad42e"
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
