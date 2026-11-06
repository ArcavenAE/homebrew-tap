class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.103705.dea02e7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-103705-dea02e7/marvel-darwin-arm64"
    sha256 "3d8d00e5bd9a9c3fdf035e3507937d048f5179801ba46da7b2f95c8476b64ab7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-103705-dea02e7/marvel-darwin-amd64"
    sha256 "a4c04083a88debbc85e7d01d07f523e672fcd08f3dd8027452bd8aa144292024"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-103705-dea02e7/marvel-linux-arm64"
    sha256 "d172c25ca00da4c8747b4367a29e9a238eb173602c9e3bb65aca3ff88b4b2212"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-103705-dea02e7/marvel-linux-amd64"
    sha256 "c009055bd87fd21e39ecf98434be18a683d556b910a0e1faa67ec4f80245fe23"
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
