class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.6c12ab7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6c12ab7/threedoors-a-darwin-arm64"
    sha256 "8067023897f56b8bb19fd743eecd9afb86f89769cde104e712b4ae13c7045550"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6c12ab7/threedoors-a-darwin-amd64"
    sha256 "f069aa09e9baf8641cc80a68ff7d69802f05d815ca0b4378fecd98bc2bbe1553"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6c12ab7/threedoors-a-linux-amd64"
    sha256 "b269fcf09008296bbf119a5ee75c5e70dfc56e0ebb07f042c78e46ad91cfba3a"
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
