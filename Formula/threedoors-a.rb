class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260318.064545.d1c66b7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-064545-d1c66b7/threedoors-a-darwin-arm64"
    sha256 "214f34520b7be0fca62a34ccf00977e9be047027bb3088fbeb9fa5ea38371a30"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-064545-d1c66b7/threedoors-a-darwin-amd64"
    sha256 "fba77d75acbfe98048279b716fd3870c1c39e0accfc13d829aed3edcec974306"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260318-064545-d1c66b7/threedoors-a-linux-amd64"
    sha256 "5af36e31f814ccace6d496902b48c7c61ce7d491abf1729e43747baccea4f779"
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
