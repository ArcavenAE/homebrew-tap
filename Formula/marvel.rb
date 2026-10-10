class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.202637.cdbacec"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202637-cdbacec/marvel-darwin-arm64"
    sha256 "c8cf09a31fcdb4a138f6fd4ab3456dd74b7121ef0ba0e78364438bc882a0be7a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202637-cdbacec/marvel-darwin-amd64"
    sha256 "b725ea9b687e04d0f7de9aac932e0b18cfc4547703201f00ec3d4e04605fdf28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202637-cdbacec/marvel-linux-arm64"
    sha256 "bbff0c9b5ba9c440a70cc4d7688b463ec58adee91f3c51332968ddc5879fec44"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202637-cdbacec/marvel-linux-amd64"
    sha256 "e2450694f52895d137b042207a1070fbc5bf03ae369966d1bd31788d2739caed"
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
