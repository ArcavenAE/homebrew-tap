class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261113.210636.5812a69"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-210636-5812a69/marvel-darwin-arm64"
    sha256 "84fd1ae85ea8a277ea8f7298b19f8284387433c348398cfd2e4da76a4581ec43"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-210636-5812a69/marvel-darwin-amd64"
    sha256 "c223a74111324a5fb8dd5d9e45d8f1341219be0fe9db526259892fe24656a286"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-210636-5812a69/marvel-linux-arm64"
    sha256 "33ab584f90d1ea3a3bec99c049958a7025b1b43ac751ea2f92fc80692b4dc0a5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-210636-5812a69/marvel-linux-amd64"
    sha256 "344c87f0552f3327822c2bc292eae5482a9c8f49af106c9b088b454e3026d4c6"
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
