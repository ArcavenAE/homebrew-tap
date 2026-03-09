class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.afc55b5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-afc55b5/threedoors-a-darwin-arm64"
    sha256 "759766b538c50c14cd8f5a0ee5a4aebdaf54e183b0c4791992a82bfe73ddc5dd"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-afc55b5/threedoors-a-darwin-amd64"
    sha256 "228692052a748c6a3c750b39226c2e4a3a6a2b5126f1d2cb02106f20d5f14af6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-afc55b5/threedoors-a-linux-amd64"
    sha256 "a07c74cfc66e50729eba284df76a13d6c9621e681ded0714e13d51fed2ba49f0"
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
