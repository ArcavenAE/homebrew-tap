class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.5cf3db7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5cf3db7/threedoors-a-darwin-arm64"
    sha256 "2a116d7849bc53efacb50ae5a797694964b5c4f8b11a036236b6ecad4e478c41"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5cf3db7/threedoors-a-darwin-amd64"
    sha256 "0f90e1ad2146984512918eecd1eb5e7440097f5d1da6e9e99e416825d1e96466"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5cf3db7/threedoors-a-linux-amd64"
    sha256 "39fb61d7ed3bc8f69909d45253985be0c3694935503440c26513fce63aba3d9f"
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
