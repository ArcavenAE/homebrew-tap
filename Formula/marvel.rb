class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.172510.ad03041"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-172510-ad03041/marvel-darwin-arm64"
    sha256 "bfe5f08a933f9560bfcad083e16e2d2d3b85694f2e681c9cc9525afcb378c016"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-172510-ad03041/marvel-darwin-amd64"
    sha256 "1bb5448c695dc6b995c8507eacbb4ca14d3c237a83aa70482c4c9d038152112f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-172510-ad03041/marvel-linux-arm64"
    sha256 "3c711116b72be616b15a1b9903076fa7d66a8610863f8630526864a3715adfc0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-172510-ad03041/marvel-linux-amd64"
    sha256 "00e38cd2db4a0502dba987dbef9a6638fb722b7175f8c0fc8f90b488f8911b20"
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
