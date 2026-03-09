class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.679c1ad"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-679c1ad/threedoors-a-darwin-arm64"
    sha256 "9a70b44c0dc94d0bb80a62c1b6930311d6798345f57428bbd81eb0ef6a003227"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-679c1ad/threedoors-a-darwin-amd64"
    sha256 "b5d9340087179da18ec44ac292712d3d65196b52d77876d3e5572d17af88dfd2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-679c1ad/threedoors-a-linux-amd64"
    sha256 "7d51a1d6492b58147c56a2257187f04acbb452fbdc641a2384011c186f7aedfc"
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
