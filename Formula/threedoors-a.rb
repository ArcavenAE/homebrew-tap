class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.224847.d97385c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-224847-d97385c/threedoors-a-darwin-arm64"
    sha256 "837597d6383e374b88f01a7f82f3d558fc1b6e2a45450cdaca46501a3a61e8a6"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-224847-d97385c/threedoors-a-darwin-amd64"
    sha256 "f1b5f9ff1fe4dab371ca0f33ef6903d8ae29fb2ced0d2a1dc8cd39d6fb392bd9"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-224847-d97385c/threedoors-a-linux-amd64"
    sha256 "b4f299e1293da84d727004ac9f06525929265da4c94df2e3decf9b9364e5cc9a"
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
