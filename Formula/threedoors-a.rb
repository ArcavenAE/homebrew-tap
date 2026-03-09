class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.2455f28"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2455f28/threedoors-a-darwin-arm64"
    sha256 "cd617414d2fec60822a6c777bf4ad307e5843149b90e7cb7b7651d6ffd5eab91"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2455f28/threedoors-a-darwin-amd64"
    sha256 "bde15b08a5cac7fb2dff11b0e0feb356c00847f28f838c304f9da741f2253024"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2455f28/threedoors-a-linux-amd64"
    sha256 "3336aad2eb19177bf97fc168504fc9c01e753635e6d205e7a4cbbfbb266456d3"
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
