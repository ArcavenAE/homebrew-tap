class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.232506.08e5519"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-232506-08e5519/threedoors-a-darwin-arm64"
    sha256 "6cc0fa5ffc62773cc39190830c03d9dae64b484998ff2c92ce52086673f7bf08"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-232506-08e5519/threedoors-a-darwin-amd64"
    sha256 "3d277163818bfea4757f21adc60251dd57de50e06786d175c39d35977ad841aa"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-232506-08e5519/threedoors-a-linux-amd64"
    sha256 "62d499d01328c3e6e7f3bd14b81d0d1ffa4f7b353537d4265d457e68f34a7b21"
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
