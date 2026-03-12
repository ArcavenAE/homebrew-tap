class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.221119.d21a3e2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-221119-d21a3e2/threedoors-a-darwin-arm64"
    sha256 "77504cd47cc8ed05fcc92cfd17b9852336215daca3d81362e5ef936bff4d112c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-221119-d21a3e2/threedoors-a-darwin-amd64"
    sha256 "815ec21650adb999f421700399529c30d4138ec40317836818a85fd0d44cebab"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-221119-d21a3e2/threedoors-a-linux-amd64"
    sha256 "82abf1cbc308807a95ef39a294ca20ac42e7534988639dc37ca311b29d8638bf"
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
