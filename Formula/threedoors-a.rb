class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.e684e0f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e684e0f/threedoors-a-darwin-arm64"
    sha256 "0e246a19b31acc013c1c2e2403dd63ce45ff65debc1415312c66cdf3d45bb65c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e684e0f/threedoors-a-darwin-amd64"
    sha256 "ee31c7aeb4327eaebce51ab90d170ffcbb866b465d1b550f9df850c744f91848"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-e684e0f/threedoors-a-linux-amd64"
    sha256 "a1044930a36c2452cd37e6d42fd80c927d987e15373a9e33040f9427f5c8a259"
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
