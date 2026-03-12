class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.220757.8783777"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-220757-8783777/threedoors-a-darwin-arm64"
    sha256 "2c2ecbf32da54ae3b2dd2cf6f970ae0fe2f17c8e4307a817f97d9d29d384918d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-220757-8783777/threedoors-a-darwin-amd64"
    sha256 "059940bc7a52104f3ee04a9c4acb8497290f082e516b791a7e9e2067d8e1ab3b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-220757-8783777/threedoors-a-linux-amd64"
    sha256 "f7a43e1f8c38c0592d6e2be02ea33db501954d6a657bcd12ebbd505514cf9336"
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
