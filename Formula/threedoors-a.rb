class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.184636.22075b5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-184636-22075b5/threedoors-a-darwin-arm64"
    sha256 "ac466e4bf374ed27036be8fa68ee9d79c137cd8f9742d0753ae639c77a76c93f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-184636-22075b5/threedoors-a-darwin-amd64"
    sha256 "0e88a30cb081cc1dc9cda89b503f94f1d708cfbad3491469bf6f89658a9c3afa"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-184636-22075b5/threedoors-a-linux-amd64"
    sha256 "ea2ee2c6a566865ea0e52d51db28ed3f4f212a592980c39543d58f98edf177d9"
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
