class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261109.194204.595815b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-194204-595815b/threedoors-a-darwin-arm64"
    sha256 "31c6d766b2a1c51cfde2ca0b7f6001b4780c711960fa5d5e9a541bc96d03579d"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-194204-595815b/threedoors-a-darwin-amd64"
    sha256 "cc6df5dcdae032b84e2a0a91d58684593e777ac2968ac14952cda94857b0afe6"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-194204-595815b/threedoors-a-linux-amd64"
    sha256 "52175773d915762f514a9ada66f118eb3954878c863a6dc6351ade7fa0fd6745"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
