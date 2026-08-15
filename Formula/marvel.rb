class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260815.084519.6235733"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-084519-6235733/marvel-darwin-arm64"
    sha256 "b4736b5d808d22701ff7977fdcc1200e3328cd165f6ce0c944546d0a70ecb90f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-084519-6235733/marvel-darwin-amd64"
    sha256 "04c0e9a6bae81211b67811dfbe7a9dcea0117d2de44c80999c1a41bc6fabc71a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-084519-6235733/marvel-linux-arm64"
    sha256 "555ff0e3bc5c9d8cf8ce969d7406ba8e9326e64b413fc1ed00ede92382951a17"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-084519-6235733/marvel-linux-amd64"
    sha256 "8e195c6e2298477a974b8e784b9e9524691200d33945241f79888530664ec0de"
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
