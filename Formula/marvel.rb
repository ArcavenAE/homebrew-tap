class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.204503.d324e5d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204503-d324e5d/marvel-darwin-arm64"
    sha256 "9d8e9e714f37adc125a669dc56442ff9fdc1a46accf876eaa19e8946d6e1254f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204503-d324e5d/marvel-darwin-amd64"
    sha256 "c0d80a7323813a48792be99e08ccae4ff54b82204da77de3c4c59abc64faa26b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204503-d324e5d/marvel-linux-arm64"
    sha256 "e1b018965ddf62f918cb12e668cf2eb3ada26ffe11df7cb89ede15a7a448ed97"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204503-d324e5d/marvel-linux-amd64"
    sha256 "3c3f992cb08bd96bd363e0ecbe7cd589080417daab0a536f8f471ca63da146ff"
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
