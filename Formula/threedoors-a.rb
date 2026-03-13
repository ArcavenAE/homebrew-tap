class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.230707.a934005"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-230707-a934005/threedoors-a-darwin-arm64"
    sha256 "65db2dfeb4345131471ed6f5e8df086a4322900283e04941c80205aa38a1b734"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-230707-a934005/threedoors-a-darwin-amd64"
    sha256 "e228849386ec7fb85e45b88ae39613bc17ea716f82444fca6a23caed34c999f1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-230707-a934005/threedoors-a-linux-amd64"
    sha256 "9f3e1ff106134e1d1aa704f845c7d0ea71e446790dcc6cefb25027f978890b52"
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
