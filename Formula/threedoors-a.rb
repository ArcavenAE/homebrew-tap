class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.cb164cd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cb164cd/threedoors-a-darwin-arm64"
    sha256 "b07c9bd6855c83adf953fe964d923b4dd2687a3ef14b8235c94174150e37468c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cb164cd/threedoors-a-darwin-amd64"
    sha256 "7b428ed32c837ab099973bc72b76c0b136a4cc9da417e7e66f9fda72252f8b95"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cb164cd/threedoors-a-linux-amd64"
    sha256 "8fee12793609ca98cf6ff8cad065a492bc3253571392a7332bb8de3133e3b1ac"
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
