class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.234425.eb0ab23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-234425-eb0ab23/threedoors-a-darwin-arm64"
    sha256 "96483ff513592697f4bbb891fc1b3c3e32d993bd578c422831e0a8448862e68c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-234425-eb0ab23/threedoors-a-darwin-amd64"
    sha256 "62f60399a798b234b7cfbedf1b5f2fc27c59a74be2b51e1e180dc7b193308c28"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-234425-eb0ab23/threedoors-a-linux-amd64"
    sha256 "8e6345d340791d24e706708d01db74be833168d5c3b76e69714e75fa0a48cf14"
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
