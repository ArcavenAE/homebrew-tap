class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.204707.f852d6c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204707-f852d6c/marvel-darwin-arm64"
    sha256 "78deccf725ddf9927363b63d7a687931edcb96c4b4fed2e3981c5e166c90b6c3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204707-f852d6c/marvel-darwin-amd64"
    sha256 "dc082f98d133db14c89b288702930435f34eebe17a8d87b8bf1772afcc3a893b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204707-f852d6c/marvel-linux-arm64"
    sha256 "440e1a2f1c0101da627618e13dc71280779b2c6c9bafdbf0fe02473e18173953"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204707-f852d6c/marvel-linux-amd64"
    sha256 "cfa3aa948818840b9d51cb05c100701d45e78adf7c83fe3cfb810f9ec2ba08e6"
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
