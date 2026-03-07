class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.f6fca60"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-f6fca60/threedoors-darwin-arm64"
    sha256 "8b7084ba1b9d937b7e20ea6d73cf5290af881bc0d15c19f2a285b5fa701e6ded"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-f6fca60/threedoors-darwin-amd64"
    sha256 "99cd5b7653f51167e1615d02451a7427c404704f0fb85c9b4ea695ee7f2680b1"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
