class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.230312.ad19f88"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230312-ad19f88/marvel-darwin-arm64"
    sha256 "f2442d03dfe354804ca8ba82167fcc19b8bb702eea2db35277f99f7fb1d720fb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230312-ad19f88/marvel-darwin-amd64"
    sha256 "9fa01f29c14775d5f628bb6ef86fd8fc9aa15aaa2bfedeffa5c164bca4a0b02e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230312-ad19f88/marvel-linux-arm64"
    sha256 "1f4dcb6ce69fea28f09bd5f9a9883630246ce4aa499ac6c31360c86a10888db5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-230312-ad19f88/marvel-linux-amd64"
    sha256 "2f3db72716fa19fcf07c08b3f195ef05c87f12f5308cf9c2226090a0a656fe92"
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
