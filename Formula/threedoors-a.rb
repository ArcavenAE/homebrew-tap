class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.225147.ddf9bc6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-225147-ddf9bc6/threedoors-a-darwin-arm64"
    sha256 "6ec5e1567b3c47a4277bec71c77504d788a5e65b3dce0f836dccc3eb6e5dddc0"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-225147-ddf9bc6/threedoors-a-darwin-amd64"
    sha256 "f90da49746dc1f4ea8a3e6b394975aab008f044c9cfee475c6f900b4f4567119"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-225147-ddf9bc6/threedoors-a-linux-amd64"
    sha256 "ee9db8055947f2abd192e8850c16a545797b1997fdae0f11d51b86d048069903"
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
