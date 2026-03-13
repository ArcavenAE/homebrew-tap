class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.064741.630a3e9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064741-630a3e9/threedoors-a-darwin-arm64"
    sha256 "728ad752f092ec00601698eb55b309fdc11352be9632f7bd99fbbdc712d2e9d6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064741-630a3e9/threedoors-a-darwin-amd64"
    sha256 "5a827bdfe9025e9d10a15323c25a18acd93677aa8e140c66b38946aa79f59e3f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-064741-630a3e9/threedoors-a-linux-amd64"
    sha256 "d0991432d993a4628178bf8c3bbc3ed6a888ec51d0201d63b16defca5fede13c"
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
