class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.718e08e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-718e08e/threedoors-a-darwin-arm64"
    sha256 "0d828c9208888697fac41c8b7b778d911b3c878b20642fa40b056d429daf69a7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-718e08e/threedoors-a-darwin-amd64"
    sha256 "e9ee9bfb67fc9f810c89f9ccfbf19293d880948adadb2c770ed185c724d0d5d4"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-718e08e/threedoors-a-linux-amd64"
    sha256 "46050469c38e9414d5049ca3ff92a99efab9ed4a5a8dcc122e7bdbc48865158c"
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
