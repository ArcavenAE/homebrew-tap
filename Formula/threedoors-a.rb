class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.215515.475c866"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-215515-475c866/threedoors-a-darwin-arm64"
    sha256 "dffd08fe94e5b7e324621181d532f87718a9be999cf708b4e8026446e1d83eff"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-215515-475c866/threedoors-a-darwin-amd64"
    sha256 "6c757bbf405d2677da952f5c92e9ab92fd56298d22039131d77d1192de17a4c5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-215515-475c866/threedoors-a-linux-amd64"
    sha256 "1c12a716f135f5bbff027456d12b0299140025be1adcd3c6ebf8615b76de8abb"
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
