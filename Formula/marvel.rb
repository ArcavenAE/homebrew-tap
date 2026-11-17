class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.014031.0538d70"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-014031-0538d70/marvel-darwin-arm64"
    sha256 "8757d2bae20d69a34618a3b97f0382b9d103559cc5f8d96c129135bb3f694141"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-014031-0538d70/marvel-darwin-amd64"
    sha256 "474c24336c81afcdcfe57bce8bd3d9e8fb91dac0a885d86d44638f20ed67445e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-014031-0538d70/marvel-linux-arm64"
    sha256 "0912e0be6d1b1ebe021fe32bf8c215eccf8ffdf832b4419c105210e67ddee91b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-014031-0538d70/marvel-linux-amd64"
    sha256 "597db089487ae9c37f8edb24b6813549457dc6812299954ef55d8979ee42b93e"
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
