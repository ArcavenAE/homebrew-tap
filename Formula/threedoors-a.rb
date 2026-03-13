class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.000336.25df153"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-000336-25df153/threedoors-a-darwin-arm64"
    sha256 "5bda9f49fc7fdb10680959d3c32b5b3f74aa9ef8c50e514e80036bbaee891756"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-000336-25df153/threedoors-a-darwin-amd64"
    sha256 "c299ce1a8e8e146f1fdf564a666003ffc522b1ff7d57bef9bb12748e788570f7"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-000336-25df153/threedoors-a-linux-amd64"
    sha256 "8e7b7991e314785b30aaf2fbbc68f6dcdbdd6c67f7edaf295125c230b7322676"
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
