class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.050840.df1a2b7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-050840-df1a2b7/marvel-darwin-arm64"
    sha256 "94ff4406d3d3899f96fa7ca8e5df49b67ad63568838ab21e2038821eba0c6363"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-050840-df1a2b7/marvel-darwin-amd64"
    sha256 "882a2e38a2a9f5f245cbcbe0e316a5c5611bb0f6660e61afb3942810b3c77969"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-050840-df1a2b7/marvel-linux-arm64"
    sha256 "788d9a84608b1e003c8cff361a91672185f561eb2e6fed141402552d91c14050"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-050840-df1a2b7/marvel-linux-amd64"
    sha256 "8417e7c036bf278e5486e6a3fdf163dfc01ce6857406ba916aaff9f883a0a9ca"
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
