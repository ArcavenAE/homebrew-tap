class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.094c8b9"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-094c8b9/threedoors-a-darwin-arm64"
    sha256 "960d708c5cfc59b399858213906dc501f895a4cbd791f7b313d02638c31d2386"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-094c8b9/threedoors-a-darwin-amd64"
    sha256 "68517e2e5e302e9770f62c37359ecd60191d34da8116379859254b21a2634481"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-094c8b9/threedoors-a-linux-amd64"
    sha256 "9e52a1ee2b0e367d64f3064dd38858004eafbe11a11dd81dcc043a14a483ac21"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
