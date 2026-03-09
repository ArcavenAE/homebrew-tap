class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.fe68f84"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-fe68f84/threedoors-a-darwin-arm64"
    sha256 "e68b0b44ee74919b1703ee12569dfd7cd7dee40efd1974a6f9f4e4f8db60342e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-fe68f84/threedoors-a-darwin-amd64"
    sha256 "ad5455ecb008fb884f4b928ddc2aa2ffb700e7866ba873134a19a63667a20184"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-fe68f84/threedoors-a-linux-amd64"
    sha256 "52d1b2e71a2915bd80064c4b35666246f39046972c353902596d6c582c1efe20"
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
