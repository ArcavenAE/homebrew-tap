class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.214742.862f1c2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-214742-862f1c2/threedoors-a-darwin-arm64"
    sha256 "971d96b736d680c4f366a77b861d8a09e2e468a8af4140de7ccc8500ee5f70d1"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-214742-862f1c2/threedoors-a-darwin-amd64"
    sha256 "973c5a8a8c42f52632d53fb63f786c551b4abbc416c1cef3df80deab99cc719a"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-214742-862f1c2/threedoors-a-linux-amd64"
    sha256 "6a44a2e7b60a628cd9fae7c5d1c7ddfe154e089578eb754fddfe836cc8079868"
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
