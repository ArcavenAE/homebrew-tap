class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.61d2b6b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-61d2b6b/threedoors-a-darwin-arm64"
    sha256 "9feaa474519bd43360aa40b35229388527865f89eff330372d8aeb60ff7cf614"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-61d2b6b/threedoors-a-darwin-amd64"
    sha256 "54cb63cf584a74a9d499091c4ccaa885b6fc8ba5fff9261fd6b2449adb2e28d9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-61d2b6b/threedoors-a-linux-amd64"
    sha256 "d30cfc687c02b2b603dbed654ff011957b068a9082e6a9325a6e70ec3d9c5d6e"
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
