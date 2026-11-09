class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261109.224141.74bee58"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-224141-74bee58/threedoors-a-darwin-arm64"
    sha256 "7dd31b44748975e94ffd9a7669ee2e7f4d667fd7dbdd4b459b9690d6836742dd"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-224141-74bee58/threedoors-a-darwin-amd64"
    sha256 "1a7076ef043daf090a7eb366db53a9b92891654f2c84ad3830bcfa4fe1de201a"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-224141-74bee58/threedoors-a-linux-amd64"
    sha256 "bf8070bc8937949931d083026cba040c671ac05d2e35cbb57909d2ccdd6ba9ba"
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
