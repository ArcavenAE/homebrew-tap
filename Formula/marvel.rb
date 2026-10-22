class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.062925.2da083c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-062926-2da083c/marvel-darwin-arm64"
    sha256 "7238b3ce7566c455f8ee61552972b4016c29f4e6533789e208574534fd42c0aa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-062926-2da083c/marvel-darwin-amd64"
    sha256 "79684cc6f5d3ddd447cc9beb4ae1104616581217eabb12159943fc0a7801c285"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-062926-2da083c/marvel-linux-arm64"
    sha256 "d4beb4e32cc96f9af936bfd7a9685feac2e901f1586ab0f9731fb2abbd36b0c8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-062926-2da083c/marvel-linux-amd64"
    sha256 "648a5aa87de03c56b9bc4def4edabb6da00b7ed99f49f68d3ccc8c8d387bde8a"
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
