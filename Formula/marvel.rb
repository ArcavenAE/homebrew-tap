class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.232937.f73aae4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-232937-f73aae4/marvel-darwin-arm64"
    sha256 "8b1f5e100d34e2fd72abf644ec58a95ffd995ae08003b068649578b147d9f11c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-232937-f73aae4/marvel-darwin-amd64"
    sha256 "45d53c1ea2cc2766181f47543880b03bab73580c486540214bf7182849e46472"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-232937-f73aae4/marvel-linux-arm64"
    sha256 "b294a45bb8d806218f2add21f14eaf45f1b5462f109f7d426cf12a7bff4225a4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-232937-f73aae4/marvel-linux-amd64"
    sha256 "e294cc7f7385a7b10487e66b12cd98e463146d862a5807ddbbaea14ab5cf09bc"
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
