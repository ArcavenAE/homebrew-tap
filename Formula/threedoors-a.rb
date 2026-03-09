class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.e0588f6"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e0588f6/threedoors-a-darwin-arm64"
    sha256 "e5de5307f830bd0cae48f0f7d6e5d9b7c43ddfd74004994465ab730e0e584aac"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e0588f6/threedoors-a-darwin-amd64"
    sha256 "88ddad03e93b1decc723e64fa6aaac1ef46b1fb259c8b5a8dab16b529cc7df25"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e0588f6/threedoors-a-linux-amd64"
    sha256 "2a4b851144c89477f2277809252c834075a2b2bd84239eefe326685132f74b1d"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
