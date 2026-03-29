class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.230139.d0e1c46"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-230139-d0e1c46/threedoors-a-darwin-arm64"
    sha256 "2b6913f474ec8bcb3bbc01bad2f8c5b03785dabf8c61ec79900f1dc9245e81f5"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-230139-d0e1c46/threedoors-a-darwin-amd64"
    sha256 "948440842106d5b0f07ac91d60dfa9a95e5e2e72562d8d2d36dd0d9c4627cba9"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-230139-d0e1c46/threedoors-a-linux-amd64"
    sha256 "0fb9b7ab465f9a418b6460b2b47254f95b63b6c741a15bc6c7c3b9ba870e1c7d"
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
