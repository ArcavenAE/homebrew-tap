class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260319.051951.cdc435d"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260319-051951-cdc435d/threedoors-a-darwin-arm64"
    sha256 "17e8a3ca7cfad62672be018710c70a36b67be62ca859bd0c4aed5346c7ce7085"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260319-051951-cdc435d/threedoors-a-linux-amd64"
    sha256 "6fca1593f28782d315b81d05e24c7fb7c3cb19ffeeaac23d7fd1819e80898ee2"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
