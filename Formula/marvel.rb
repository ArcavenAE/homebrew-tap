class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.113449.7c9daff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-113449-7c9daff/marvel-darwin-arm64"
    sha256 "453505dda1db0725f0052e2282aacbc863bdb285e3265a90e4f760cb583510bf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-113449-7c9daff/marvel-darwin-amd64"
    sha256 "c8cc923b2f5d11ee73661023f16a1fec0eeebf6d72ff37b136b86f744e784c1e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-113449-7c9daff/marvel-linux-arm64"
    sha256 "f8fa57b8c2f8bcecf53f25865d05a96f5c40ce0ac36bd496f1a7e452e7ba4ebc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-113449-7c9daff/marvel-linux-amd64"
    sha256 "a4c38b605168204fea50ac847a8facc951b4a3015c2e51388b3592f4e1bbbdbf"
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
