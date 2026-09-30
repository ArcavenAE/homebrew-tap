class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.054310.cb300c0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-054310-cb300c0/marvel-darwin-arm64"
    sha256 "7a9ad8902e3be3a6795820ac117850af2f351b331ff6af5747f89e067905cb37"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-054310-cb300c0/marvel-darwin-amd64"
    sha256 "5ec295a615edc882efb2cf97cec48350b2d56deb36902dbbcf205a6303022060"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-054310-cb300c0/marvel-linux-arm64"
    sha256 "66f0abaf56033695ce7038b3d0ab3d421f858d1dacd8cb900d635ed7d099fd48"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-054310-cb300c0/marvel-linux-amd64"
    sha256 "5bd4ed2d248da63662ab79afa57996a1253e8ae854ef8a111b6c350c53c0136a"
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
