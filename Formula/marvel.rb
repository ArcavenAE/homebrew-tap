class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.193124.2bc58fa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-193124-2bc58fa/marvel-darwin-arm64"
    sha256 "f0ed7a26e67429d90b95f3274ae0daabdd51e3f58042e24ca672ebd18a366b5d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-193124-2bc58fa/marvel-darwin-amd64"
    sha256 "cc1ed3f7b4e86eee3b474d438d56d9950b595e4ca49279d75638911544cb689b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-193124-2bc58fa/marvel-linux-arm64"
    sha256 "a583d1d57e8a69b789e77e38d8b1bcd3730edf448bdd8bd79a07ed58422040cc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-193124-2bc58fa/marvel-linux-amd64"
    sha256 "0a820bdae6f467547da6046a1136b5287240a4207687ceaa621ad07c98c29be1"
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
