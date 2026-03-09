class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.43181fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-43181fb/threedoors-a-darwin-arm64"
    sha256 "cb6af9d51737a9aa93e7447928e6a8318a230d05aaca0a15f278d49cd0fd76f8"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-43181fb/threedoors-a-darwin-amd64"
    sha256 "bb747f89ce807711cdbbe98391b5a4af96fd1e77fe3bdb1b8d25a709ee750624"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-43181fb/threedoors-a-linux-amd64"
    sha256 "af080c5e06d6b3915ba38548311aa57d8da2acdca3a24ddf0fbff02a9c18bbfb"
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
