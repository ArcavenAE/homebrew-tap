class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.202852.e25550b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-202852-e25550b/threedoors-a-darwin-arm64"
    sha256 "1135c8025a39b8c292772f2c7a8046ccb348f4c24df4f51040dfc0ea11959c7d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-202852-e25550b/threedoors-a-darwin-amd64"
    sha256 "583683f85428503b3385543793d65eb88073db723a70a3cf237539520c65ea1a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-202852-e25550b/threedoors-a-linux-amd64"
    sha256 "f65bc91caf12bed7983e57191ca44016f35f175c327672e59b4396a75348084f"
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
