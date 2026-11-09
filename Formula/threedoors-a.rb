class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261109.204437.46408d9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-204437-46408d9/threedoors-a-darwin-arm64"
    sha256 "62965feefec99addeb7c2e174dc91d3178042cb43f6f5d203f0e93cbf2e60c35"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-204437-46408d9/threedoors-a-darwin-amd64"
    sha256 "11bc50dd6753d49c5f4cc47f1f43b148de633cd5e1771808b05351119c9cafeb"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-204437-46408d9/threedoors-a-linux-amd64"
    sha256 "018a5a91364fda7ce582dfed11c19cfd6baa9dab95cd6cefa02c6a20e0da3107"
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
