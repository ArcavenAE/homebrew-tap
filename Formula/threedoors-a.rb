class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.eb3efa9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-eb3efa9/threedoors-a-darwin-arm64"
    sha256 "454aaf42300ec0686f3ca589edfa6975956a3b9686fde9cf489f363b7ddb66ba"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-eb3efa9/threedoors-a-darwin-amd64"
    sha256 "ea2a57013e046f1f3438ed6d9285581abc856d05c73239578e1baeda73f51f22"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-eb3efa9/threedoors-a-linux-amd64"
    sha256 "ed495c13fb678029f065f4a7d4504bd5764ce008faf6d14385e851b2b8f1b257"
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
