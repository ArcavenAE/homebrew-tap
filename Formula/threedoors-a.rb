class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.a680312"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a680312/threedoors-a-darwin-arm64"
    sha256 "4ff0ffdaec691674afd61dc4f9697de680b2f9c36d2969b9730b836dee52a935"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a680312/threedoors-a-darwin-amd64"
    sha256 "ae1c90847a12e3f789c58ddb224c1380be7ff248c08397023220b84512465dfa"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-a680312/threedoors-a-linux-amd64"
    sha256 "a8e8c60061d329bafb34d90f3a6b399981b43ec458347682ce238270c1dbbdfc"
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
