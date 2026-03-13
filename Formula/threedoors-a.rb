class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.225957.ba868b1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-225957-ba868b1/threedoors-a-darwin-arm64"
    sha256 "14b7aeaff371930009e650339843925d311c0d00b9f003c53a10cc45761fd051"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-225957-ba868b1/threedoors-a-darwin-amd64"
    sha256 "149fb6d5a8b5eb7b2a0f22c6b270c5421ad6d6fe215decf4278c25f09da461da"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-225957-ba868b1/threedoors-a-linux-amd64"
    sha256 "640bf44ded82372cb5d6ac785aeee06d7cebd408f3454ac0b50f41162aae39a7"
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
