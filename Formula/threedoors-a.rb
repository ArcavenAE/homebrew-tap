class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.bd9d16f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-bd9d16f/threedoors-a-darwin-arm64"
    sha256 "9154ac7521c41fbc8fe4b276f6d874a7379def1d15737e911b1f2052a187ef01"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-bd9d16f/threedoors-a-darwin-amd64"
    sha256 "3327212fa93d7ffd4dfe049a3badfdca4296738d0ba9beb5a53a0c2723de93c7"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-bd9d16f/threedoors-a-linux-amd64"
    sha256 "54587c44e0590be0a7faaab766c7408291f9a7fe1c7d95cab07568fb7f4a9c65"
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
