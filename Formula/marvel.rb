class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261023.013825.20336f1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-013825-20336f1/marvel-darwin-arm64"
    sha256 "a85c451b93405807b2b480cb2b1a644931fe24dd195b2d68acb6b4318ee86241"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-013825-20336f1/marvel-darwin-amd64"
    sha256 "96cdeeb318f3bf38e95b3d9c11b4bd48087b633e9d029a35465ab7a1fc3b042d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-013825-20336f1/marvel-linux-arm64"
    sha256 "361904283aab4ce5071296736322ee08ecaa3daf2864ec56438ac150e6d89c08"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-013825-20336f1/marvel-linux-amd64"
    sha256 "b2037999fded880c780926492fb5fcf2cb8ed8495ff3b9bd874675612710ebfe"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
