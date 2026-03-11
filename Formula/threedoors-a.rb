class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.57f83c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-57f83c4/threedoors-a-darwin-arm64"
    sha256 "032ac73a477c0636d6305d94c1c11d83b95af4f53ba1cdec35a561bbb16e5d8a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-57f83c4/threedoors-a-darwin-amd64"
    sha256 "e3aa9f5f98aae89c553d77aed214f55f823725853dc1f612d89e1b3792478c2c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-57f83c4/threedoors-a-linux-amd64"
    sha256 "d7a0c165641c617dc72f6dc823f3b768f2a3bf8df9d33fa66ecf40bc769e84ff"
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
