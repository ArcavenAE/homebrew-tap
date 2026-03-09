class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.cbff91a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cbff91a/threedoors-a-darwin-arm64"
    sha256 "774a6f2c85c13f570a2efe366f8204a4d9d65d5e7b27ecb9a3ac1bad2a84c986"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cbff91a/threedoors-a-darwin-amd64"
    sha256 "25c45674a0185df18818a6d754838e78a82c7c8640326fb3a5d3387f40b16dfe"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cbff91a/threedoors-a-linux-amd64"
    sha256 "d41e23538e6b7a496629720e2fcb0053ca8c9212d0b1f1bd51968f1a84939a4d"
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
