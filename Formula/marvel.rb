class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.021203.7e62f37"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021203-7e62f37/marvel-darwin-arm64"
    sha256 "2e49b0a9dda4ed036a2255c61a88f8cd5e8c5f7abbb006b1c64cfde9cbd25516"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021203-7e62f37/marvel-darwin-amd64"
    sha256 "81bc66c849f26fdbe83ffb91ff0cdb85a7aebcff8dc9b4bf6224f1afff760706"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021203-7e62f37/marvel-linux-arm64"
    sha256 "0caed4581e7419cbe746a628ead9197168d780e83a20b356cb48688f335c0a5a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-021203-7e62f37/marvel-linux-amd64"
    sha256 "a26a5b404ca644f452025df835632074c4d60d088a2e400981fb1031f79def41"
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
