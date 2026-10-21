class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.154948.1bb64a5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154948-1bb64a5/marvel-darwin-arm64"
    sha256 "832f685e92b4b8a088a045c71202820e38f1943c6c012115ce23e4bbd1d36780"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154948-1bb64a5/marvel-darwin-amd64"
    sha256 "45d88fe4343c8ae16ec3f4f540148bff5ef5b052db55ff3f02dd780072648e4e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154948-1bb64a5/marvel-linux-arm64"
    sha256 "280c18e06ea40ea0c8bed12f37052da32a40e0492aff6822919ef44b7d520328"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-154948-1bb64a5/marvel-linux-amd64"
    sha256 "26a19ea69dad0aca1a4e3f38a43b05c4fc947fbb6ae7a61ba4120b37fc4fb6f5"
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
