class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.194525.125e19c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-194525-125e19c/threedoors-a-darwin-arm64"
    sha256 "53551ad64eb5ba49579a6d0c7402c010f20c2627284b4cfc347b76112654b9d5"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-194525-125e19c/threedoors-a-darwin-amd64"
    sha256 "12a18767fbb88852ad619dfd4a6d172a7985416538adf89130a2200b7698f476"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-194525-125e19c/threedoors-a-linux-amd64"
    sha256 "baeb437972ee488a88e7b577298781d729754125aef1f954792ceecd82b2083a"
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
