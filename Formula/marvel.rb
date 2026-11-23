class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.183605.a7e5c20"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-183605-a7e5c20/marvel-darwin-arm64"
    sha256 "d3e0e6fd713fb345bfb8724a077ffa98c6977437cb8c0f7bca6627460f881d81"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-183605-a7e5c20/marvel-darwin-amd64"
    sha256 "ffaf145c67631781d79355a0613c88f6ea572547e167760121e5b6faf29fd8ac"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-183605-a7e5c20/marvel-linux-arm64"
    sha256 "7127b0f5d6f68a6de59ca6e43798a27e77f29e2b4491fe8a0997677a12e418ff"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-183605-a7e5c20/marvel-linux-amd64"
    sha256 "929ffd39b5a97b3ab5b50d50215a9ad71633058998b47bd1f001baf640a128fd"
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
