class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.001914.fda5cfc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-001914-fda5cfc/marvel-darwin-arm64"
    sha256 "555918b0e05e4b9ec26fe3630fa47c9324b74adb55a29f210a19d684f256df6b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-001914-fda5cfc/marvel-darwin-amd64"
    sha256 "1f0434e1096c75ae2a363357864b4d1ce28b6ccabf4e8a233b5cb16a938a1865"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-001914-fda5cfc/marvel-linux-arm64"
    sha256 "2d1fe718d3e1e0780dec0ae8836d28d7b67ee2033e2d66b26a58e12693354eb3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-001914-fda5cfc/marvel-linux-amd64"
    sha256 "720afa29b09a82dca402fb8fdf5713f29dd1a53e071ebc5a12d24f6e730da7ad"
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
