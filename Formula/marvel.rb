class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.121927.b9c7e91"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-121927-b9c7e91/marvel-darwin-arm64"
    sha256 "3c9583b67b1c41f0f77e50e1d1b4b33d47c277664f923429ef31a8317b70f66c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-121927-b9c7e91/marvel-darwin-amd64"
    sha256 "c0da6bc946dbd3b16a4342ba720d9dae87e8e8b6020d421b7052c1d93a3e76df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-121927-b9c7e91/marvel-linux-arm64"
    sha256 "5f535f52910c6e8fc4d66f27a17626ebce321f8763b8230df35a466034d98a3e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-121927-b9c7e91/marvel-linux-amd64"
    sha256 "9b39790538d01def5ae9bcd9e5304c3b7cde8873f176ae095bb273e99cb1eac9"
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
