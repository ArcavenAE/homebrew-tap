class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.212245.c1cb44b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-212245-c1cb44b/marvel-darwin-arm64"
    sha256 "78c34ad5afa95bb4d243afc5748622d54bb2fab59bd5304c7518bb422ffa7a6b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-212245-c1cb44b/marvel-darwin-amd64"
    sha256 "9ef718e96d703049d0b308d93401179bb919cfdc01f0c224e395a4de19f384fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-212245-c1cb44b/marvel-linux-arm64"
    sha256 "ea9f9fd97c0bb127ccab5764b4fa38957d8472f75f3d0f47742ae48df06ee0d1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-212245-c1cb44b/marvel-linux-amd64"
    sha256 "24bdbab68e61c83d41fe501d4e69998b975bb981825d8c7d5af71a43ed0995a5"
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
