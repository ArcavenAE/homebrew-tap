class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.135341.f6f33d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135341-f6f33d9/marvel-darwin-arm64"
    sha256 "37a7fcb299b03ddeff4be125a32e245424135bbf8156b1d9e14a83a5b6b793d4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135341-f6f33d9/marvel-darwin-amd64"
    sha256 "d176d453796fc78cf6e7527d5f5b1701b1f88c14e76289289fdb50fc0e6e7308"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135341-f6f33d9/marvel-linux-arm64"
    sha256 "4b07e36c8c70ac3719024f412c25fb546d8319c0536ac59e0bc288ea3a6e2ec8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135341-f6f33d9/marvel-linux-amd64"
    sha256 "8d8b6fca8108963371208a3e9c50e3da07fd863dc69efe3f3df0793a28870bad"
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
