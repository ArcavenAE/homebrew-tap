class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.3517592"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-3517592/threedoors-a-darwin-arm64"
    sha256 "1173f011a2cf01258bd7b4cdd642b6179f5103fc0506b35edf59dac015d55ccd"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-3517592/threedoors-a-darwin-amd64"
    sha256 "a8f3253dfc3dad236d5ae76f43ff6baa9f1a7a5730e268870884543f96aa0e48"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-3517592/threedoors-a-linux-amd64"
    sha256 "dcbe7f757c8928c86f723089398433cb970e85ac6a5cd1adf95f82604925753c"
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
