class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.020545.a75dd4b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-020545-a75dd4b/threedoors-a-darwin-arm64"
    sha256 "ed6e62c6ccfd31e99c15988546ea8e5c6f588b671f997bbac236442fd0488b23"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-020545-a75dd4b/threedoors-a-darwin-amd64"
    sha256 "b9d1a195ea348292c86a4424f1cbb16eb8be4cef25f8fd45f70bd65554b4c723"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-020545-a75dd4b/threedoors-a-linux-amd64"
    sha256 "9e8e848bc7b2fc90d908c614c910fb40d4236ba27809bc572823ca4fa4c8e5b0"
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
