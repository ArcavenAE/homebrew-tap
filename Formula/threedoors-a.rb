class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260310.df54bcb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-df54bcb/threedoors-a-darwin-arm64"
    sha256 "dd8a9bb38afa8ef45143ce3019bec8f84da18724a2d9fec2d890d93267304d9c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-df54bcb/threedoors-a-darwin-amd64"
    sha256 "8e313732cc77a6458195a3a090b20129285dc9bd20c892c8b785adc7d945c1b1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260310-df54bcb/threedoors-a-linux-amd64"
    sha256 "ea10580f3690b3759d9d587d6487caf39ab1e9d90fb349e2499fce61799499fd"
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
