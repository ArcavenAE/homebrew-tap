class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.210143.b77e0da"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210143-b77e0da/marvel-darwin-arm64"
    sha256 "cb2b04de752da606fc60ec6ee57e2f50eee0b459437c13d300400b4d612cd8e1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210143-b77e0da/marvel-darwin-amd64"
    sha256 "ca41cc1625f64e8829c2c8389b31cfd32005b8701b9461807877762d5aa3d34c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210143-b77e0da/marvel-linux-arm64"
    sha256 "fb0ec9a36df5da9f440bbd2a3f4ef47aea2e125b57fc0e66b114bf391c08fc7b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210143-b77e0da/marvel-linux-amd64"
    sha256 "1ce13d38d0088f833aaded5b7fa2b80ffcb278567883b5a1b6e1f965e80025e4"
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
