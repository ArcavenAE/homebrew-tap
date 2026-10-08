class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.195009.988cd9a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-195009-988cd9a/marvel-darwin-arm64"
    sha256 "cdca1952205fc280d348ae674d7f3eb196484c2d3eb72ec27eb9f88abaa19632"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-195009-988cd9a/marvel-darwin-amd64"
    sha256 "7d309ec815c6d00a1555cc4d68bfc742e2094ce2e38c25c44ac6abc7eb03d817"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-195009-988cd9a/marvel-linux-arm64"
    sha256 "5cb2adea8a569383193c58e599e472a020a25b628528804be43b4489e9c31f8c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-195009-988cd9a/marvel-linux-amd64"
    sha256 "7402fb5294ffa28ce51694285bf272bd79097dabfeebd5e701920054ec500edc"
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
