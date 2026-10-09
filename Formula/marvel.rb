class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.063643.b2fa4ff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-063643-b2fa4ff/marvel-darwin-arm64"
    sha256 "5ed5d43b9fdeed434059dc7e2b1f3bfd3bdb45db5f8e4aee517d1c97616c9e0e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-063643-b2fa4ff/marvel-darwin-amd64"
    sha256 "3ba2b54b602b9d4d3778f19bad7e66fa5845bbb07607568de1c15cb07e61c855"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-063643-b2fa4ff/marvel-linux-arm64"
    sha256 "e98065fd245475274428281235886f8df4f2f43393b71660a72f8d234e5f05fb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-063643-b2fa4ff/marvel-linux-amd64"
    sha256 "f5fd9361dd25003c159d7710b26df06e6ab0c9f30c1a9eeac8d065f5a06eefe9"
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
