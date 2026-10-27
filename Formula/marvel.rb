class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.154316.533aa65"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154316-533aa65/marvel-darwin-arm64"
    sha256 "4e4dbb1017d1ea5a208bc423a2b0d2c1cb9d1ff8277a3022fdfc8238b8076444"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154316-533aa65/marvel-darwin-amd64"
    sha256 "3d734ad63e9e41539d891b261a320825d2e21bfa1dc6e723a80a54038b9b6438"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154316-533aa65/marvel-linux-arm64"
    sha256 "b4a759e662d081165616a728bfdea570cf5a44f6bc332709558d0dad6d312d48"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-154316-533aa65/marvel-linux-amd64"
    sha256 "39243d776a81a899a73dcd75c859c501bfa50ad66146f9fb6e1c93275cfb1fd4"
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
