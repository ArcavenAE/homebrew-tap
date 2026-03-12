class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.033154.452bd13"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033154-452bd13/threedoors-a-darwin-arm64"
    sha256 "039bafad5e1772ab4223d850a88d871d1ab02b523cc41b9d5487a9469bd36123"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033154-452bd13/threedoors-a-darwin-amd64"
    sha256 "3b624daec112ee10a205b251bc27aac738a09d0176bb81b8994b850e09a5d334"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-033154-452bd13/threedoors-a-linux-amd64"
    sha256 "be2ae01660c2844b14edc64cd2ed42c9bcc218c55228e4dae1ca53b0fc84c645"
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
