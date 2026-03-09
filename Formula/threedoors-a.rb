class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.89e3eba"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-89e3eba/threedoors-a-darwin-arm64"
    sha256 "3be0ac4abbe1b48ebd66fda53ba7edafe355d6ae9c73e71443c54c14c8f1cce2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-89e3eba/threedoors-a-darwin-amd64"
    sha256 "f7c1028aad3e402707622310d5a35730b1c9c83e394981dc21df5452254e467d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-89e3eba/threedoors-a-linux-amd64"
    sha256 "d2659df0c7d1ea2531108c8faa9e2071466bba10222631c12e4c97145a03788c"
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
