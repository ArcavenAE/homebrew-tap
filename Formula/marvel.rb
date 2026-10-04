class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.041857.247eb57"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-041857-247eb57/marvel-darwin-arm64"
    sha256 "8fdd290ad0f4a514a6cb227fc0f6957eeeb686646daa21b3055f87e3df276c49"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-041857-247eb57/marvel-darwin-amd64"
    sha256 "82ac0ed39d68067960ed43c387611806ef11f105ddf596a29ebca079ee095cce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-041857-247eb57/marvel-linux-arm64"
    sha256 "bb6dd4c67382fe7a556f3f3a4590443d9e8f9c56ee8af750635f075fb7132c5e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-041857-247eb57/marvel-linux-amd64"
    sha256 "ea7e193e32508cf6475b4b9628d05eb285d01d4fcf17750815f297175051b20e"
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
