class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.cdd4a80"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cdd4a80/threedoors-a-darwin-arm64"
    sha256 "0fb985b011150ffda28afd06bf112e7ce67090a697f1d11d583a019df110dd3b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cdd4a80/threedoors-a-darwin-amd64"
    sha256 "6dc89476fffec49c4a202c6005d9b55b8114be3d0a6b7afbceaaa97cc53bb4fc"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-cdd4a80/threedoors-a-linux-amd64"
    sha256 "11ed80ecfdf4b5b85713eb5cb3c0672a8e5c9449acfca891940d6552ece91da1"
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
