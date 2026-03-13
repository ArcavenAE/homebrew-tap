class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.204134.7d048e8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-204134-7d048e8/threedoors-a-darwin-arm64"
    sha256 "45c6d2409e71c801569f86d512a08ac17661bd4001c999f7a5f0fe02c6c28f00"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-204134-7d048e8/threedoors-a-darwin-amd64"
    sha256 "b94405b9eb4494942e60d3bdb3bc942184497fe724e1bc7eee39040d734000b3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-204134-7d048e8/threedoors-a-linux-amd64"
    sha256 "7ee557a467d600d41c4e7b1f52b754acea4b38fc23417ba14b6cd38ad86c746b"
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
