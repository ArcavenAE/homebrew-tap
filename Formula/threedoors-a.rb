class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.211329.1d467ed"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-211329-1d467ed/threedoors-a-darwin-arm64"
    sha256 "a3be772a2d635ddd3f259504be996f66ad89d1cbf241511ca6a69ad9c1669a2e"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-211329-1d467ed/threedoors-a-darwin-amd64"
    sha256 "6d606ca4ca9e7d6063db8975effe981bafdc581e7623f2160f7603043d72fa75"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-211329-1d467ed/threedoors-a-linux-amd64"
    sha256 "a666ce8f4e213afa6ab79e666dfcc295e9b35883a1ce81285cb5bd9c2adf86b2"
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
