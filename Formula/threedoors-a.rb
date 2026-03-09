class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.7bb183c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7bb183c/threedoors-a-darwin-arm64"
    sha256 "b52bdfb7106d052a26262d9a78181de93c1570b1d266d831f4c99441d12c62a1"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7bb183c/threedoors-a-darwin-amd64"
    sha256 "f3b65b3e62cd196b99dfe2cb7225938a4c2991bea45cd3efb2d7497c209e2b9d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-7bb183c/threedoors-a-linux-amd64"
    sha256 "9899a41d078cf3bbc7c88b5376573e33a9759ac29dcfdb637aa4dbcbb90895e6"
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
