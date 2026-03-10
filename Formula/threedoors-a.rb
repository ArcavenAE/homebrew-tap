class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.1943b66"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-1943b66/threedoors-a-darwin-arm64"
    sha256 "5ff12c57c8e56fb18bdbb8d4fc57e812affda3b1b2e198d7315f83f4f808dda7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-1943b66/threedoors-a-darwin-amd64"
    sha256 "6a6945b452afbebbfc03f1b51bd7aa96bcd503782a280fa595858cfc6b200275"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-1943b66/threedoors-a-linux-amd64"
    sha256 "9cb6ea1833b7f8e6b054d29598679c690ed5f2842a906a40adcb924081710145"
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
