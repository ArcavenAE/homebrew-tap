class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.204940.aef2194"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-204940-aef2194/marvel-darwin-arm64"
    sha256 "39db80d193e1bb707b1a6bc419c03daec37865f3576c31439eef6dca38df3ff6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-204940-aef2194/marvel-darwin-amd64"
    sha256 "6483d8a1d03067d797f7fdc536f3c853d613eb46f759501a9fc81bbc20092749"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-204940-aef2194/marvel-linux-arm64"
    sha256 "a740797642013dcc912c58039686de8d0d77bcb8d7f89eacd847982a33a4ba92"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-204940-aef2194/marvel-linux-amd64"
    sha256 "91585e2074824b2da1cf7ad1cf4ebe2b50efafe1dd0e87e113160930fb447362"
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
