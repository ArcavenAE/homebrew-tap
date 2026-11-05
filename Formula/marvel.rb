class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.184624.525adaa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-184624-525adaa/marvel-darwin-arm64"
    sha256 "91fee34baccff45cd2d5f08c4acdbcadb91c0979826f28c5aa1681314570cdfa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-184624-525adaa/marvel-darwin-amd64"
    sha256 "b48b0f5db86480a71c8ed6c4c1afbd385440098e6bd7c5fe5404898fa7054d0a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-184624-525adaa/marvel-linux-arm64"
    sha256 "8f081d0911cbf090f9339f1eb23c22dd10cfba6b3b8eb1d4b441c092b34af110"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-184624-525adaa/marvel-linux-amd64"
    sha256 "8cbe0a74dafe6554f4ac391d7af0f88ed95b6fda8740f56714e42efc613a0a27"
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
