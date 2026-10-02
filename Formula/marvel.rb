class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.125400.13a7f30"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-125400-13a7f30/marvel-darwin-arm64"
    sha256 "2668fe421da327a692ee96c0724c2b96126adf281579a50235869e10c798407e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-125400-13a7f30/marvel-darwin-amd64"
    sha256 "6530cc68f3a646df3b000740cf14a0b15c7bede3624b100767771a0f939b743f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-125400-13a7f30/marvel-linux-arm64"
    sha256 "a805dce06e3d266f61e9b7b512b68066717b2c3daf1d5002b1f574a340bc32f1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-125400-13a7f30/marvel-linux-amd64"
    sha256 "66a426e7e348649b03caf34997e8736f860084d4d383cbbf1784e847d5d54382"
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
