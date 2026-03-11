class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.234927.596050f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-234927-596050f/threedoors-a-darwin-arm64"
    sha256 "f60b17e20bcbbb9e29034e4901f363a87755cb9b10bd1e5c93c137ab31ca2178"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-234927-596050f/threedoors-a-darwin-amd64"
    sha256 "139d476e5724c3ed5cbcbbcebed494a06dba5402eb63f902c335df08d5472b50"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-234927-596050f/threedoors-a-linux-amd64"
    sha256 "55ba92cfc902cbde85e3716a854368dfa3d5713568fd034afecc98a79dd0ce77"
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
