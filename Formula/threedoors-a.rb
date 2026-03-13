class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.200357.2cb0465"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200357-2cb0465/threedoors-a-darwin-arm64"
    sha256 "45daf33db4a64de2d9ce09e599d2eeab13be3765c9ba70232209e7fc03313108"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200357-2cb0465/threedoors-a-darwin-amd64"
    sha256 "73600cba336d16accb3ebc1481ebb661f8a03658eb6597d71fd5c09d8fc9a6bb"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200357-2cb0465/threedoors-a-linux-amd64"
    sha256 "513f34531435be6e27b9198fb1a77c3cd592826934b93d67532de30f7fad77bc"
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
