class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260918.053430.b67060a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-053430-b67060a/marvel-darwin-arm64"
    sha256 "67f7cc0df874c3fffe3aed91d74bbe47d6f0a4954d84a58a56ecf2637925db2c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-053430-b67060a/marvel-darwin-amd64"
    sha256 "4304d8dc3037628b9df42aa6c8db025706db8b66af6c67e4a45348b098f47382"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-053430-b67060a/marvel-linux-arm64"
    sha256 "b900af2461d3cc49d9db0d3d3dc4623009e3d75f9b55ab9eff2cb15475def9b2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-053430-b67060a/marvel-linux-amd64"
    sha256 "6e372b2d5a4bfed46fd7b52d813321cf9c85b8774ef3e3ec5b14659a6cc39d4c"
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
