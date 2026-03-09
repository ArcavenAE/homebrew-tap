class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.4eb7def"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4eb7def/threedoors-a-darwin-arm64"
    sha256 "93afe7260721a2b8690b70204662ad246a83c40e7a04c61f0d3d92e345596e6a"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4eb7def/threedoors-a-darwin-amd64"
    sha256 "807a9bd26902c3e7cfd26f37cf53383e72c743b755f45fb16be82aa318d5a0ad"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4eb7def/threedoors-a-linux-amd64"
    sha256 "59ead27ae59799347360a8b6688311d85726a79c45dc43999c5001396f1c598a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
