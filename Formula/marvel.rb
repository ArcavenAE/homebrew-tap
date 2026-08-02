class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260802.021255.ab9ae43"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-021255-ab9ae43/marvel-darwin-arm64"
    sha256 "c484e2a2804b1a336e0d2a0f730587b618d7a02dd8f7e297d54e217ffd3f4942"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-021255-ab9ae43/marvel-darwin-amd64"
    sha256 "887b2d6aaf73e761ccf2baf1c4dab9832d1c8352240239060c7d11da14538490"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-021255-ab9ae43/marvel-linux-arm64"
    sha256 "9c0185dc3dd20e1ea621f99185de56d6497832e2c84d1e15e38ccefd46399dfc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-021255-ab9ae43/marvel-linux-amd64"
    sha256 "76e95235ecf384506040391b1735b65c615662a2695a55ab05bf47fda95d3188"
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
