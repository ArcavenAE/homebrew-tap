class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.175449.545d655"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-175449-545d655/threedoors-a-darwin-arm64"
    sha256 "4184430ed44213e5601ab8d5f0de5a8ed3f6bb1b42d83df18a410f0b67abb7e0"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-175449-545d655/threedoors-a-darwin-amd64"
    sha256 "d152fa0924bfcbb79264147b766060e74fc16e7151c5bf287bf213a59077d5ac"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-175449-545d655/threedoors-a-linux-amd64"
    sha256 "5bbb3ee2c1b5b97956344620b6b43db60657c77b462c99d2de8fa44b895bc9ef"
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
