class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.173055.527450a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173055-527450a/marvel-darwin-arm64"
    sha256 "6e5474fa5225c737f7f6cdccb132c302fc66d98ed86deaab67c35d0374d19ea1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173055-527450a/marvel-darwin-amd64"
    sha256 "8495284113c2bc27816080f23155247a49ee71dc383ea53aaabd3ada10aa0214"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173055-527450a/marvel-linux-arm64"
    sha256 "9ddd13e7edb026d50fb99c62f6b6c4f8addc728d10ba18b911d2cd5c0c023297"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-173055-527450a/marvel-linux-amd64"
    sha256 "8fed7f1cfbe976c532bda2ec5f1d1ec9d657c36f50f8fd075cb9e5ed77ab01fe"
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
