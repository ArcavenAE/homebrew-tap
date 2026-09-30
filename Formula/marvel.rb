class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.070745.9009e89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-070745-9009e89/marvel-darwin-arm64"
    sha256 "cb686d9d26fec8126811289e2f09d289420c7dc3c87759dfaa57709e98b3fc11"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-070745-9009e89/marvel-darwin-amd64"
    sha256 "acbaf009b72307859d117955ff9c537828cf3d36f4208a0172454d84f56ae5a0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-070745-9009e89/marvel-linux-arm64"
    sha256 "c69daf8a22b4a07820ae23b78863278c2909874a012f24d86b7f2804b3051a89"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-070745-9009e89/marvel-linux-amd64"
    sha256 "c0b607010923a5a7d11194006a645bdbf16356b93b74b3b190e1f1f267c1fa1b"
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
