class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.234913.a3d804e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-234913-a3d804e/marvel-darwin-arm64"
    sha256 "71784eab303c014754798de319e8f52e2e8b94f1e57f609ef0575a4cb4aa286a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-234913-a3d804e/marvel-darwin-amd64"
    sha256 "09048d3c737948174527ab7f7539788c5e3b7b2f2101f66413651a7885ee3e64"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-234913-a3d804e/marvel-linux-arm64"
    sha256 "e31fe62c64c25cfb66b8ad757ee20ea1448ff2461f073a281f8b56f4ee4fcef1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-234913-a3d804e/marvel-linux-amd64"
    sha256 "b3e33cee51447f1b3d4643520ab6991fb7999de89449bfef97716b5b2c88eeea"
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
