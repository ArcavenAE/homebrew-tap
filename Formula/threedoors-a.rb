class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.8a5d198"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8a5d198/threedoors-a-darwin-arm64"
    sha256 "1e9b377071e6937ffadbf15ce6713277ce1295b4210799b345f3f3094aebf41d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8a5d198/threedoors-a-darwin-amd64"
    sha256 "3a3f01632980dff0625980c862ef292705e639f610f040b4c2647e975a212e68"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-8a5d198/threedoors-a-linux-amd64"
    sha256 "f24b2d0379ba1e5197b2f1afacfddbbfeb9c21287348a5bb7529788896297231"
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
