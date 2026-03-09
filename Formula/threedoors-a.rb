class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.5d98bef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5d98bef/threedoors-a-darwin-arm64"
    sha256 "c82c924b058eefec230f33794d6efaf27d0dc29b7e80bb0a218cf6063a0fc0b4"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5d98bef/threedoors-a-darwin-amd64"
    sha256 "fb7fcdd682923328795b68f1274338fb4f8881823b30c48591745108cbd30e61"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-5d98bef/threedoors-a-linux-amd64"
    sha256 "ae08e59ce1037c6fd197e4a48f3e0d6e11b1d9e4e61439db06c177a26dba2173"
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
