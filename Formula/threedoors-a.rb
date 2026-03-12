class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.214602.aa7a3c0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-214602-aa7a3c0/threedoors-a-darwin-arm64"
    sha256 "43e2a0ee828fb9beec4618aa258b1bd6373241587b08783fd20316d46ee20fc1"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-214602-aa7a3c0/threedoors-a-darwin-amd64"
    sha256 "5a99ce1bddc26aa8bdff3bf627dab3d928c4b08478659b31a351058bb6084c38"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-214602-aa7a3c0/threedoors-a-linux-amd64"
    sha256 "0b3a41f099d53b0f080033ab6c647234e170ee0477268e88096a2deeb4cc7f62"
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
