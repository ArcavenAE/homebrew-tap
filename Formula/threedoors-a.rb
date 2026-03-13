class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.205423.becd86f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205423-becd86f/threedoors-a-darwin-arm64"
    sha256 "b2760a5e846479c67429102283c1fc706be49752e6abb9af34de3c8b48d3aa4a"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205423-becd86f/threedoors-a-darwin-amd64"
    sha256 "15ff86c2d60c67b954364ca61c1dd917d44317145a6cdfb8a1dc17ca10472e47"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205423-becd86f/threedoors-a-linux-amd64"
    sha256 "c70c46db083eef644412c013d2708d06a18024e6bfb54c480b64cc5f584ccf37"
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
