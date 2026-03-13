class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.222726.e7d76a6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222726-e7d76a6/threedoors-a-darwin-arm64"
    sha256 "d5721bcf9b1e09d057c40d424a4b17d43cce1e9e35d207abc584b3b7b54ef5eb"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222726-e7d76a6/threedoors-a-darwin-amd64"
    sha256 "0f848c62306e636960d4636efb505f281e2ac0f25e9c896203b1d6aef53efc9e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222726-e7d76a6/threedoors-a-linux-amd64"
    sha256 "9a07c159f3161ba92b35ab3d5a8a747ad2d46dde6c4391f472eea5cb52396a27"
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
