class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.058dd40"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-058dd40/threedoors-a-darwin-arm64"
    sha256 "60d5d098490cd7c71a67fee2a765cd33fd1ec98d5fbbc6f8c4c972b65f8a1810"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-058dd40/threedoors-a-darwin-amd64"
    sha256 "0d7f23ab4b0b95f3d4ff5cd8e8718d4bd867c3116f27b3a2351df6393dd99b7e"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-058dd40/threedoors-a-linux-amd64"
    sha256 "7a6838a2b0f0cc4ff91f38ec9fad656d022a42311e85a510fd251e9b43f97154"
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
