class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.200503.46b3500"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200503-46b3500/marvel-darwin-arm64"
    sha256 "25036a5237ed071c30af9d15eeed987bad3da4cdeed4d7e7ada04ef7d40b424f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200503-46b3500/marvel-darwin-amd64"
    sha256 "e0573afb0277a23b6d1b0ebeb0492afcdffa613ce71f4397a65bfc44a302fdf3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200503-46b3500/marvel-linux-arm64"
    sha256 "cdcccb1398d4ef62704916357a6b9fb8e704ee74f5defbf43252d05f8d4e4f15"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-200503-46b3500/marvel-linux-amd64"
    sha256 "bb30d3002fdad57f96df2a7c562b41e491850dfb96524a9277b0610dffff0ef7"
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
