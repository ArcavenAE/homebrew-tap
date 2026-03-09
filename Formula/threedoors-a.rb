class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.40fb5e6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-40fb5e6/threedoors-a-darwin-arm64"
    sha256 "5f2c3441bcd457b3e4360401874b5b699884e2b052ec2d556435a2c7e6c9f25e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-40fb5e6/threedoors-a-darwin-amd64"
    sha256 "dd43579e98a1339cd54605810d5c1e41bbbfed0af132bc8ed54c56d949690e33"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-40fb5e6/threedoors-a-linux-amd64"
    sha256 "bfd49ee7c72703244946533dd10f00a8bc3565e564a44315758dd6d1403c9436"
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
