class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.160122.3a8b13e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-160122-3a8b13e/marvel-darwin-arm64"
    sha256 "c8bfe10c0025a4a805c7a29e888af211c9551fd5fcedbd708c5063a0cea1bc01"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-160122-3a8b13e/marvel-darwin-amd64"
    sha256 "2232d1e3ab17dba974e89f99028628419dfdd6a0362708b43160257a78ac47db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-160122-3a8b13e/marvel-linux-arm64"
    sha256 "17396a60e7d21dd8814f63a2c4a0f9728c2db4ee120ca48be4767e2d955c4cfa"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-160122-3a8b13e/marvel-linux-amd64"
    sha256 "9efd45d3453c0ca6f9d75fa4057a26b4ff95840cc0b9cb0c1dc055862a532858"
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
