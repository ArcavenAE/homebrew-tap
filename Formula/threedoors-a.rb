class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.4f7c0fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4f7c0fb/threedoors-a-darwin-arm64"
    sha256 "5b2fc5dcdd885f48c1f404bfb9cdc1d512c817aa4e07029148461eac448084df"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4f7c0fb/threedoors-a-darwin-amd64"
    sha256 "01d45865343f7b45075387c1d8321066cf6eb3653e9a3f69fdc871d2b731135a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4f7c0fb/threedoors-a-linux-amd64"
    sha256 "3edf3d8d25cc7153ee1ed5d7479bdcb8f4e0615f28fcead7cfc25a233f6d47e9"
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
