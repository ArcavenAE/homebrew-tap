class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.091944.853df21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-091944-853df21/marvel-darwin-arm64"
    sha256 "b584b523456ed999c45722b273656dc2cb6cdc3e31d0d85ff80aae806e00089b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-091944-853df21/marvel-darwin-amd64"
    sha256 "b08cc0161704e955b29ccab491d51f6a3ccc9f4e2e112fae5ce9fc192d76ef97"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-091944-853df21/marvel-linux-arm64"
    sha256 "79897de6de724d7af3770505293489ae86657ff3fcfb1eda328fdcb473117bbb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-091944-853df21/marvel-linux-amd64"
    sha256 "2e1aa1554a2ca341e372d10f7fdc746bcd303601d6e7e8251b2d982077eeba52"
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
