class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.220558.a45eb0b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220558-a45eb0b/marvel-darwin-arm64"
    sha256 "e3ab3802b4f05f7d8ec3932e8ff44b3dc601a7e44dee180bba208761c1b861cf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220558-a45eb0b/marvel-darwin-amd64"
    sha256 "0dfe28abcdfe8650124c6590111acef033ff5dd4b3eaa3dbe4fe587900dd6665"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220558-a45eb0b/marvel-linux-arm64"
    sha256 "407abca63d954771a22ddff5fad15fb0d16f0a4d2eb062f2ed99b8d4958ca73b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-220558-a45eb0b/marvel-linux-amd64"
    sha256 "774762c0c3664dc0d89267c04677b8e5a77c31d06b04fe7d2477c0edacb5d9f5"
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
