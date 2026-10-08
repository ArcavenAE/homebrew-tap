class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.052001.992beca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052001-992beca/marvel-darwin-arm64"
    sha256 "e7142f5e88f9b32e2530988036d80d7c0a58a7c6a9cf94bd4054872c6dab233f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052001-992beca/marvel-darwin-amd64"
    sha256 "978e3ab3eadf525f0d789885e159a26cf8d185e169d3e7d343e1fc1f9da3f8a0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052001-992beca/marvel-linux-arm64"
    sha256 "34419a4941451d9f7063d00b91b1ae1fd5e9832393e93a6aae48611d963679ce"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052001-992beca/marvel-linux-amd64"
    sha256 "6dc1ae45372999bbe0be08a4b97a0c101a5f06faaf551ec4bbf998a69923177e"
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
