class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261022.111849.9a9ba66"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261022-111849-9a9ba66/threedoors-a-darwin-arm64"
    sha256 "d44d31836d6b854564335dae22836ba3bff078dad3d26d6c90f7943b8d9adbcc"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261022-111849-9a9ba66/threedoors-a-darwin-amd64"
    sha256 "f614ee0d1ffe45add34a5b3d8f25acf441bbbb1b2570665a117e3ca7fd9ceae3"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261022-111849-9a9ba66/threedoors-a-linux-amd64"
    sha256 "142972e4dc586eae9a504ace59d2fb5e0bece2a7a86fdda9a5dc4f94ed02bb8a"
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
