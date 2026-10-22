class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.204636.7ad82ea"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-7ad82ea/marvel-darwin-arm64"
    sha256 "2108de43890d3c64ef3aa18eb243ea134d65f7015cca1ae499e94410d743a2f1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-7ad82ea/marvel-darwin-amd64"
    sha256 "913948d0b0bdac47d3fd611b15a7bc159819598d09db1a8c06f30f7a8b904246"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-7ad82ea/marvel-linux-arm64"
    sha256 "576d1322f96d6ee89418aaea45016236f84cd091ddbb7a815f9bca680f0a3235"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-7ad82ea/marvel-linux-amd64"
    sha256 "94b6181f8e6453ae2c0609c518b1391bd092144beeb3dfb8643e747d61578b11"
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
