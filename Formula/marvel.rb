class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261127.185347.496ed56"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-185347-496ed56/marvel-darwin-arm64"
    sha256 "946667ce08edb60a37a900a38fed259ff12a4d5f1b16617f429af30ea05451b3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-185347-496ed56/marvel-darwin-amd64"
    sha256 "32d720d1a39936eeca072298051d43392f77eae4ddf48074b8ad7dad7692c800"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-185347-496ed56/marvel-linux-arm64"
    sha256 "f410ac673db3e53e4f4fd842136658acb0d9728349dd641b0a85197d85800f6b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-185347-496ed56/marvel-linux-amd64"
    sha256 "deabf2c1f1d389c9f3a853cc13adebdecc7f9ca339d13b2338e2bcab73a6bd4d"
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
