class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.104954.9aaff4e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-104954-9aaff4e/marvel-darwin-arm64"
    sha256 "bae57f6cefc0bb9ae50552816dc842eb74054b5a391bc9fed0b717da8f71e818"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-104954-9aaff4e/marvel-darwin-amd64"
    sha256 "cad6e92a80f2b2c7f855ee1b6225349e8ea613a23aa581fb93b5108768834162"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-104954-9aaff4e/marvel-linux-arm64"
    sha256 "22c8fb183f2f4a14bf7097e26b0f9e66d310b2daccd2b691419376994ac10521"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-104954-9aaff4e/marvel-linux-amd64"
    sha256 "9860660b6a607a5d171505e3d0ba2fb05de87d53660a0145f8f5e476eda32c45"
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
