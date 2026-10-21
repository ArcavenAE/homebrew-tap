class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.161430.b9f33a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-161430-b9f33a8/marvel-darwin-arm64"
    sha256 "3fd9c15d9d8ef5551548792f82a7ee3df21bb148a0f4c58c2ea6f03d319d05e3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-161430-b9f33a8/marvel-darwin-amd64"
    sha256 "a0d945c14ff2a7b2dc809680cb3009a81db44a30ccc4f5cc09beef46f4ca3391"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-161430-b9f33a8/marvel-linux-arm64"
    sha256 "289a976c4d1579641374da9670b17dbb2122cf45c3171366af7873f7d25941b5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-161430-b9f33a8/marvel-linux-amd64"
    sha256 "3f023461a76d59475d62677ad7393bfe133c72d3acc36acd80114df6cab71b15"
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
