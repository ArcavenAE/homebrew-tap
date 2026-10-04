class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.032043.39a4a4c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-032043-39a4a4c/marvel-darwin-arm64"
    sha256 "d9bc8f38110f88556a1f74010c1d0460e5e0ec052de96ecdead04a4c74f48de3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-032043-39a4a4c/marvel-darwin-amd64"
    sha256 "85943781f245f3465b771b4830f4014ca2998dbe6c5485f01d407c077888eee8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-032043-39a4a4c/marvel-linux-arm64"
    sha256 "0a868b0861513bec383318a068c2011dd628b4a2506819e95603e942cf257ebc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-032043-39a4a4c/marvel-linux-amd64"
    sha256 "112d94b3d55dd277d2cac5b71489b0a9f75c6227d32478698107f8dcc4eb69ec"
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
