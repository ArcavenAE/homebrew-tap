class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.203758.e897cde"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-203758-e897cde/threedoors-a-darwin-arm64"
    sha256 "c7ffc4c6fa76f5ba39ad4e353dc8e64ab169b6136a7bc46792749fafcdb1b36c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-203758-e897cde/threedoors-a-darwin-amd64"
    sha256 "c0baf02c985ddb49ee90c798d3feee65dc3da04e30ea93b278cb19156b96a6c5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-203758-e897cde/threedoors-a-linux-amd64"
    sha256 "4b9cca1d607f1b3fb0a8941ab0ce7f7551c42726d889315835b5377c9597d415"
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
