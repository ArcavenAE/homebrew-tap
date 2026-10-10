class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.134606.42596fc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134606-42596fc/marvel-darwin-arm64"
    sha256 "3247345abeb831cf804f42febbe329ac9b8c2c8cb6d5b2395b04fa60c1504e97"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134606-42596fc/marvel-darwin-amd64"
    sha256 "74ea5897671ccd1141da46f5f3103c6a7e257bf07495cbcdacad95b699250180"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134606-42596fc/marvel-linux-arm64"
    sha256 "f4a1871fbae55a95e704a4fc0d09fee78f7e7b1128fafb18861a50edfadb91b2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-134606-42596fc/marvel-linux-amd64"
    sha256 "b0ea4a22e915ffb682b6638d3420de60b05725d3900c2d9d2751f1eb62d76a7b"
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
