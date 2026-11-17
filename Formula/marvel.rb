class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.184110.7dd751c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-184110-7dd751c/marvel-darwin-arm64"
    sha256 "2f50c92c70d29f784c9d7f3f7a3897031536c2cbd3a34d1b12140165c88f9aed"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-184110-7dd751c/marvel-darwin-amd64"
    sha256 "9f0a132db010d2d4125fa300cc517fec8a3fc58fc9a613bb82181706cce29031"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-184110-7dd751c/marvel-linux-arm64"
    sha256 "ac3ab51705797dac6f0fd12ca1e68bee021d05a7723a4a1bfa5851c33320dd0a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-184110-7dd751c/marvel-linux-amd64"
    sha256 "d5acec2b4a5f2652d9a75355b732286635121a436a7e48f24f89e93087165f62"
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
