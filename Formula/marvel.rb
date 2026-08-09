class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.084812.d17dac5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-084812-d17dac5/marvel-darwin-arm64"
    sha256 "1c7932212422237d719cb5f2f44bb29cb0973582493560fec71d27a85fb8099e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-084812-d17dac5/marvel-darwin-amd64"
    sha256 "6100a771c269d561dc70b436567caeaafebb2ccfa56c0c894475c643b5d287e5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-084812-d17dac5/marvel-linux-arm64"
    sha256 "2bb3be35832c6bf1e2059d96b78acf28442b1772e3b167f36a81e54b203e2249"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-084812-d17dac5/marvel-linux-amd64"
    sha256 "f6d7b644be9282a1141b3e29cfabbc1d10ea8855d2606699744f09cca6708a98"
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
