class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.020345.2209354"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-020345-2209354/threedoors-a-darwin-arm64"
    sha256 "c74681ff14a11cf780c82d7d1398fd8cee6e3421ff40d08460eef7f0197e2e46"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-020345-2209354/threedoors-a-darwin-amd64"
    sha256 "2ab410323dc30868372d59bc594ab3a63aac8dcfe8eaafee5913a547d659dde7"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-020345-2209354/threedoors-a-linux-amd64"
    sha256 "018a6beb42430c2a842c02fd198a207119a279e1e29e5612df6f20a9c65f2922"
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
