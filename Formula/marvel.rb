class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.003500.2780ca1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-003500-2780ca1/marvel-darwin-arm64"
    sha256 "5d229344f39a5e4bd8ae8ffbd7679b399f3fb8500fa7033c54900c669828dc6f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-003500-2780ca1/marvel-darwin-amd64"
    sha256 "9987000685dc2059151094b8024d4d898ec05eaa33cc13483cd6be300c16a80e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-003500-2780ca1/marvel-linux-arm64"
    sha256 "e20c860d42146e676469f85e78ab02c1e5fe770936512fb7aadb9005001cd3ac"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-003500-2780ca1/marvel-linux-amd64"
    sha256 "9c635638791c4493fcb8478c466e12ee70865b0091d6a059f9d9e2de9c169831"
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
