class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.050005.940cc33"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-050005-940cc33/marvel-darwin-arm64"
    sha256 "e30f0917fca5ae8d69ab842f5d1d52b3ee036be5033615bd30aa892c1757d6b2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-050005-940cc33/marvel-darwin-amd64"
    sha256 "64b0698ba246f56b3f540f163462fa6c5763ba6faa5ffed7f23699599c2ce8df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-050005-940cc33/marvel-linux-arm64"
    sha256 "e9957438b662b54d040ec791a4ae298ac8971ef1c31f49ee57a3af3a34b84fd9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-050005-940cc33/marvel-linux-amd64"
    sha256 "af2c43b4cce09c842977f0765cecb0698621fd50bbbd2374707850263161e7d6"
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
