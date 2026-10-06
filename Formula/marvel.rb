class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.203454.e512abf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-203454-e512abf/marvel-darwin-arm64"
    sha256 "14546ed8ab7136e37803ba8dffe4d5b89f4ac705433604538d607a2f3b5b0d8a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-203454-e512abf/marvel-darwin-amd64"
    sha256 "f3947588915230167705c6e5e2972297fca6a6720773978a9e0d20e2d6daf393"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-203454-e512abf/marvel-linux-arm64"
    sha256 "25dd29afedac6b1a15f8736042a2dcd9b892175c04fc789f79b3738f3fa751d9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-203454-e512abf/marvel-linux-amd64"
    sha256 "b2a4eed199627bb8ac1faaa963d4b7e460d6c3aae93e1c8f346becde29514f67"
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
